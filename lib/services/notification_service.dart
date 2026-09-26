import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz_data;

/// Notification IDs are partitioned so the three sources can never overwrite
/// each other. Task IDs used to derive from `millisecondsSinceEpoch`, which
/// could collide with a patient reminder and silently replace it.
class NotifIds {
  static const patientMin = 1;
  static const patientMax = 99999;
  static const taskMin = 100000;
  static const taskMax = 799999;
  static const dailyNudge = 900001;

  /// Rows are keyed by id so re-scheduling replaces rather than duplicates.
  /// Modulo rather than clamp — clamping would collapse every out-of-range id
  /// onto one slot, where each new reminder silently overwrites the last.
  static int forTask(int taskId) => taskMin + (taskId % (taskMax - taskMin));

  static int forPatient(int patientId) =>
      patientMin + (patientId % (patientMax - patientMin));
}

class NotificationService {
  NotificationService._();
  static final NotificationService instance = NotificationService._();

  final _plugin = FlutterLocalNotificationsPlugin();

  static const _details = NotificationDetails(
    iOS: DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    ),
  );

  static const _primedKey = 'notif_primed';
  static const _grantedKey = 'notif_granted';
  static const _nudgeHourKey = 'notif_nudge_hour';

  bool _granted = false;
  bool get isGranted => _granted;

  Future<void> init() async {
    tz_data.initializeTimeZones();
    final tzName = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(tzName));

    // Permission is requested explicitly after the priming screen, never here —
    // iOS only ever shows its dialog once, so asking cold gets it denied.
    const initSettings = InitializationSettings(
      iOS: DarwinInitializationSettings(
        requestAlertPermission: false,
        requestBadgePermission: false,
        requestSoundPermission: false,
      ),
    );
    await _plugin.initialize(initSettings);

    final prefs = await SharedPreferences.getInstance();
    _granted = prefs.getBool(_grantedKey) ?? false;
  }

  Future<void> markPrimed() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_primedKey, true);
  }

  /// Shows the iOS permission dialog. Call this only from the priming screen.
  Future<bool> requestPermission() async {
    final granted = await _plugin
            .resolvePlatformSpecificImplementation<
                IOSFlutterLocalNotificationsPlugin>()
            ?.requestPermissions(alert: true, badge: true, sound: true) ??
        false;
    _granted = granted;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_grantedKey, granted);
    await prefs.setBool(_primedKey, true);
    return granted;
  }

  // ── Task reminders ──────────────────────────────────────

  /// Schedules a one-shot reminder [leadMinutes] before the task's due time.
  /// Silently does nothing if the resulting moment is already past.
  Future<void> scheduleTaskReminder({
    required int taskId,
    required String title,
    required String category,
    required DateTime dueDate,
    required int dueMinuteOfDay,
    required int leadMinutes,
  }) async {
    if (!_granted) return;

    final due = tz.TZDateTime(
      tz.local,
      dueDate.year,
      dueDate.month,
      dueDate.day,
      dueMinuteOfDay ~/ 60,
      dueMinuteOfDay % 60,
    );
    final fireAt = due.subtract(Duration(minutes: leadMinutes));
    if (!fireAt.isAfter(tz.TZDateTime.now(tz.local))) return;

    final label = category[0].toUpperCase() + category.substring(1);
    final heading = leadMinutes == 0 ? 'Due now · $label' : 'Due in ${_lead(leadMinutes)} · $label';

    await _plugin.zonedSchedule(
      NotifIds.forTask(taskId),
      heading,
      title,
      fireAt,
      _details,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  static String _lead(int minutes) =>
      minutes >= 60 ? '${minutes ~/ 60} hr' : '$minutes min';

  Future<void> cancelTaskReminder(int taskId) =>
      _plugin.cancel(NotifIds.forTask(taskId));

  // ── Daily nudge ─────────────────────────────────────────

  Future<int> nudgeHour() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_nudgeHourKey) ?? 9;
  }

  Future<void> setNudgeHour(int hour) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_nudgeHourKey, hour);
  }

  /// Arms the nudge on the next day that has no open tasks.
  ///
  /// [openTaskCountOn] is queried for the day actually being targeted — a
  /// count for *today* says nothing about the day the notification lands on,
  /// so using one would fire "Nothing scheduled today" on a planned day.
  Future<void> refreshDailyNudge({
    required Future<int> Function(DateTime day) openTaskCountOn,
  }) async {
    await _plugin.cancel(NotifIds.dailyNudge);
    if (!_granted) return;

    final hour = await nudgeHour();
    final now = tz.TZDateTime.now(tz.local);
    var earliest = tz.TZDateTime(tz.local, now.year, now.month, now.day, hour);
    if (!earliest.isAfter(now)) earliest = earliest.add(const Duration(days: 1));

    tz.TZDateTime? fireAt;
    for (var i = 0; i < 7; i++) {
      final day = earliest.add(Duration(days: i));
      if (await openTaskCountOn(DateTime(day.year, day.month, day.day)) == 0) {
        fireAt = day;
        break;
      }
    }
    // Every day in the next week is planned — nothing to nag about.
    if (fireAt == null) return;

    await _plugin.zonedSchedule(
      NotifIds.dailyNudge,
      'Nothing scheduled today',
      'Take a minute to plan — add one task.',
      fireAt,
      _details,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  Future<void> cancelDailyNudge() => _plugin.cancel(NotifIds.dailyNudge);

  // ── Patient follow-ups (existing behaviour) ─────────────

  Future<void> scheduleDaily({
    required int patientId,
    required String patientName,
    required int hour,
    required int minute,
  }) async {
    final now = tz.TZDateTime.now(tz.local);
    var scheduled = tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, minute);
    if (scheduled.isBefore(now)) scheduled = scheduled.add(const Duration(days: 1));

    await _plugin.zonedSchedule(
      NotifIds.forPatient(patientId),
      'Follow-up reminder',
      'A patient follow-up is due. Open Proforma to view.',
      scheduled,
      _details,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  Future<void> cancel(int id) => _plugin.cancel(id);

  Future<List<PendingNotificationRequest>> pending() =>
      _plugin.pendingNotificationRequests();
}
