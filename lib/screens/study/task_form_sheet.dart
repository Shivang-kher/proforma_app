import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../db/database.dart';
import '../../providers/database_provider.dart';
import '../../services/notification_service.dart';
import '../../theme/app_theme.dart';
import '../../widgets/segmented_pill.dart';
import '../notifications/notification_priming_screen.dart';

const _categories = ['study', 'work', 'personal'];

/// Minutes before the due time that the reminder fires.
const _leadOptions = [0, 15, 60];

class TaskFormSheet extends ConsumerStatefulWidget {
  const TaskFormSheet({super.key, this.existing, this.defaultDate});
  final Task? existing;
  final DateTime? defaultDate;

  @override
  ConsumerState<TaskFormSheet> createState() => _TaskFormSheetState();
}

class _TaskFormSheetState extends ConsumerState<TaskFormSheet> {
  final _title = TextEditingController();
  final _notes = TextEditingController();

  String _category = 'study';
  DateTime? _dueDate;
  TimeOfDay? _dueTime;
  bool _remind = false;
  int _lead = 0;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    final e = widget.existing;
    if (e != null) {
      _title.text = e.title;
      _notes.text = e.description ?? '';
      _category = e.category;
      _dueDate = e.dueDate;
      if (e.dueMinuteOfDay != null) {
        _dueTime = TimeOfDay(
            hour: e.dueMinuteOfDay! ~/ 60, minute: e.dueMinuteOfDay! % 60);
      }
      if (e.reminderLeadMinutes != null) {
        _remind = true;
        _lead = e.reminderLeadMinutes!;
      }
    } else {
      _dueDate = widget.defaultDate ?? DateTime.now();
    }
  }

  @override
  void dispose() {
    _title.dispose();
    _notes.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _dueDate ?? now,
      firstDate: DateTime(now.year - 1),
      lastDate: DateTime(now.year + 3),
    );
    if (picked != null) setState(() => _dueDate = picked);
  }

  Future<void> _pickTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: _dueTime ?? TimeOfDay.now(),
    );
    if (picked != null) setState(() => _dueTime = picked);
  }

  Future<void> _toggleRemind(bool on) async {
    if (!on) {
      setState(() => _remind = false);
      return;
    }
    // A reminder is meaningless without permission — earn it here, once.
    final notif = NotificationService.instance;
    if (!notif.isGranted) {
      final granted = await showNotificationPriming(context);
      if (!granted) {
        if (mounted) setState(() => _remind = false);
        return;
      }
    }
    if (mounted) setState(() => _remind = true);
  }

  Future<void> _save() async {
    final title = _title.text.trim();
    if (title.isEmpty) return;
    setState(() => _saving = true);

    final db = ref.read(databaseProvider);
    final notif = NotificationService.instance;

    final minuteOfDay =
        _dueTime == null ? null : _dueTime!.hour * 60 + _dueTime!.minute;
    final canRemind = _remind && _dueDate != null && minuteOfDay != null;
    final lead = canRemind ? _lead : null;

    final companion = TasksCompanion(
      title: Value(title),
      description: Value(_notes.text.trim().isEmpty ? null : _notes.text.trim()),
      category: Value(_category),
      dueDate: Value(_dueDate),
      dueMinuteOfDay: Value(minuteOfDay),
      reminderLeadMinutes: Value(lead),
    );

    // Without the finally, a throw anywhere below leaves _saving true and the
    // button stuck on a spinner with no way to retry.
    try {
      final int taskId;
      if (widget.existing != null) {
        taskId = widget.existing!.id;
        await db.updateTask(companion.copyWith(
          id: Value(taskId),
          isDone: Value(widget.existing!.isDone),
          completedAt: Value(widget.existing!.completedAt),
        ));
      } else {
        taskId = await db.insertTask(companion);
      }

      // Always clear first — editing may have removed or moved the reminder.
      await notif.cancelTaskReminder(taskId);
      if (canRemind) {
        await notif.scheduleTaskReminder(
          taskId: taskId,
          title: title,
          category: _category,
          dueDate: _dueDate!,
          dueMinuteOfDay: minuteOfDay,
          leadMinutes: lead!,
        );
      }
      await notif.refreshDailyNudge(openTaskCountOn: db.openTaskCountOn);

      if (mounted) Navigator.of(context).pop();
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final insets = MediaQuery.of(context).viewInsets.bottom;
    final canRemind = _dueDate != null && _dueTime != null;

    return Padding(
      padding: EdgeInsets.only(bottom: insets),
      child: Container(
        decoration: const BoxDecoration(
          color: kGround,
          borderRadius: BorderRadius.vertical(top: Radius.circular(kRadSheet)),
        ),
        child: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10),
                width: 38,
                height: 4,
                decoration: BoxDecoration(
                  color: kDisabled,
                  borderRadius: BorderRadius.circular(kRadPill),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.existing != null ? 'Edit task' : 'New task',
                    style: kTitle(),
                  ),
                ),
              ),
              Flexible(
                child: ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.fromLTRB(20, 18, 20, 0),
                  children: [
                    Text('Title', style: kFieldLabel()),
                    const SizedBox(height: 7),
                    TextField(
                      controller: _title,
                      textCapitalization: TextCapitalization.sentences,
                      style: kArchivo(size: 15, weight: FontWeight.w600),
                      decoration: const InputDecoration(hintText: 'What needs doing?'),
                    ),

                    const SizedBox(height: 14),
                    Text('Notes', style: kFieldLabel()),
                    const SizedBox(height: 7),
                    TextField(
                      controller: _notes,
                      style: kArchivo(size: 13.5),
                      decoration: const InputDecoration(hintText: 'Optional detail'),
                    ),

                    const SizedBox(height: 18),
                    Text('Category', style: kFieldLabel()),
                    const SizedBox(height: 7),
                    SegmentedPill(
                      filledThumb: true,
                      selected: _categories.indexOf(_category),
                      options: [
                        for (final c in _categories)
                          SegmentOption(
                            label: c[0].toUpperCase() + c.substring(1),
                            accent: categoryColor(c),
                          ),
                      ],
                      onSelect: (i) => setState(() => _category = _categories[i]),
                    ),

                    const SizedBox(height: 16),
                    _CardGroup(
                      children: [
                        _DetailRow(
                          icon: Icons.calendar_today_rounded,
                          label: 'Due date',
                          value: _dueDate == null
                              ? 'None'
                              : DateFormat('EEE d MMM').format(_dueDate!),
                          onTap: _pickDate,
                        ),
                        _DetailRow(
                          icon: Icons.schedule_rounded,
                          label: 'Time',
                          value: _dueTime == null ? 'None' : _dueTime!.format(context),
                          onTap: _pickTime,
                        ),
                      ],
                    ),

                    const SizedBox(height: 14),
                    _CardGroup(
                      children: [
                        SizedBox(
                          height: 54,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              children: [
                                Icon(Icons.notifications_none_rounded,
                                    size: 17,
                                    color: canRemind ? kStudy : kDisabled),
                                const SizedBox(width: 11),
                                Expanded(
                                  child: Text(
                                    'Remind me',
                                    style: kRow(color: canRemind ? kInk : kFaint),
                                  ),
                                ),
                                Switch(
                                  value: _remind && canRemind,
                                  onChanged: canRemind ? _toggleRemind : null,
                                ),
                              ],
                            ),
                          ),
                        ),
                        if (_remind && canRemind)
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                            child: Row(
                              spacing: 7,
                              children: [
                                for (final m in _leadOptions)
                                  _LeadChip(
                                    label: m == 0
                                        ? 'At time'
                                        : m >= 60
                                            ? '${m ~/ 60} hr before'
                                            : '$m min before',
                                    selected: _lead == m,
                                    onTap: () => setState(() => _lead = m),
                                  ),
                              ],
                            ),
                          ),
                      ],
                    ),

                    if (!canRemind)
                      Padding(
                        padding: const EdgeInsets.fromLTRB(4, 8, 4, 0),
                        child: Text(
                          'Set a date and time to enable reminders.',
                          style: kMetaText(color: kFaint),
                        ),
                      ),
                    const SizedBox(height: 4),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
                child: Row(
                  spacing: 10,
                  children: [
                    SizedBox(
                      width: 108,
                      child: OutlinedButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('Cancel'),
                      ),
                    ),
                    Expanded(
                      child: FilledButton(
                        onPressed: _saving ? null : _save,
                        style: FilledButton.styleFrom(
                          backgroundColor: kStudy,
                          foregroundColor: Colors.white,
                        ),
                        child: _saving
                            ? const SizedBox(
                                width: 18,
                                height: 18,
                                child: CircularProgressIndicator(
                                    strokeWidth: 2, color: Colors.white),
                              )
                            : const Text('Save task'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CardGroup extends StatelessWidget {
  const _CardGroup({required this.children});
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kCard,
        borderRadius: BorderRadius.circular(kRadCard),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          for (var i = 0; i < children.length; i++) ...[
            if (i > 0)
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Divider(height: 1),
              ),
            children[i],
          ],
        ],
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  const _DetailRow({
    required this.icon,
    required this.label,
    required this.value,
    required this.onTap,
  });
  final IconData icon;
  final String label;
  final String value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final unset = value == 'None';
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 52,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Icon(icon, size: 17, color: kMuted),
              const SizedBox(width: 11),
              Expanded(child: Text(label, style: kRow())),
              Text(
                value,
                style: kArchivo(
                  size: 14,
                  weight: FontWeight.w600,
                  color: unset ? kFaint : kStudy,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LeadChip extends StatelessWidget {
  const _LeadChip({required this.label, required this.selected, required this.onTap});
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected ? kStudy : kGround,
      shape: const StadiumBorder(),
      child: InkWell(
        onTap: onTap,
        customBorder: const StadiumBorder(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
          child: Text(
            label,
            style: kArchivo(
              size: 12,
              weight: selected ? FontWeight.w600 : FontWeight.w400,
              color: selected ? Colors.white : kInk,
            ),
          ),
        ),
      ),
    );
  }
}
