import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../db/database.dart';
import '../../providers/database_provider.dart';
import '../../services/notification_service.dart';

final tasksProvider = StreamProvider<List<Task>>(
  (ref) => ref.watch(databaseProvider).watchTasks(),
);

/// Mutations that must keep the DB and the scheduled notifications in step.
class TaskActions {
  TaskActions(this._db);
  final AppDatabase _db;

  Future<void> setDone(Task task, bool done) async {
    await _db.setTaskDone(task.id, done);
    if (done) {
      await NotificationService.instance.cancelTaskReminder(task.id);
    } else {
      await _rearm(task);
    }
    await _refreshNudge();
  }

  Future<void> delete(Task task) async {
    await NotificationService.instance.cancelTaskReminder(task.id);
    await _db.deleteTask(task.id);
    await _refreshNudge();
  }

  /// Reschedules the reminder for a task that already exists in the DB.
  Future<void> _rearm(Task task) async {
    if (task.dueDate == null ||
        task.dueMinuteOfDay == null ||
        task.reminderLeadMinutes == null) {
      return;
    }
    await NotificationService.instance.scheduleTaskReminder(
      taskId: task.id,
      title: task.title,
      category: task.category,
      dueDate: task.dueDate!,
      dueMinuteOfDay: task.dueMinuteOfDay!,
      leadMinutes: task.reminderLeadMinutes!,
    );
  }

  Future<void> _refreshNudge() async {
    final count = await _db.openTaskCountOn(DateTime.now());
    await NotificationService.instance.refreshDailyNudge(hasTasksToday: count > 0);
  }

  /// Re-arms every pending reminder. iOS drops scheduled notifications after a
  /// reinstall or a long gap, so this runs once on launch.
  Future<void> rearmAll() async {
    for (final task in await _db.getTasksNeedingReminder()) {
      await _rearm(task);
    }
    await _refreshNudge();
  }
}

final taskActionsProvider =
    Provider<TaskActions>((ref) => TaskActions(ref.watch(databaseProvider)));
