import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../db/database.dart';
import '../theme/app_theme.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.task,
    required this.onToggle,
    required this.onEdit,
    required this.onDelete,
    this.showDate = false,
    this.overdue = false,
  });

  final Task task;
  final VoidCallback onToggle;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  /// Include the due date in the meta row (used in list views that mix days).
  final bool showDate;
  final bool overdue;

  String? get _meta {
    if (task.isDone && task.completedAt != null) {
      return 'done ${DateFormat('HH:mm').format(task.completedAt!)}';
    }
    if (task.dueDate == null) return 'no date';

    final time = task.dueMinuteOfDay == null
        ? null
        : '${(task.dueMinuteOfDay! ~/ 60).toString().padLeft(2, '0')}:'
            '${(task.dueMinuteOfDay! % 60).toString().padLeft(2, '0')}';

    if (overdue) {
      final days = DateTime.now().difference(task.dueDate!).inDays;
      return days <= 0 ? 'overdue' : '$days ${days == 1 ? 'day' : 'days'} late';
    }
    if (showDate) {
      final d = DateFormat('d MMM').format(task.dueDate!);
      return time == null ? d : '$d · $time';
    }
    return time ?? 'no time';
  }

  @override
  Widget build(BuildContext context) {
    final accent = categoryColor(task.category);
    final label = task.category[0].toUpperCase() + task.category.substring(1);
    final metaColor = overdue ? kOverdue : kFaint;

    return Dismissible(
      key: ValueKey(task.id),
      direction: DismissDirection.endToStart,
      onDismissed: (_) => onDelete(),
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          color: kOverdue.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(kRadCard),
        ),
        child: const Icon(Icons.delete_outline_rounded, color: kOverdue),
      ),
      child: Material(
        color: kCard,
        borderRadius: BorderRadius.circular(kRadCard),
        child: InkWell(
          onTap: onEdit,
          borderRadius: BorderRadius.circular(kRadCard),
          child: Opacity(
            opacity: task.isDone ? 0.55 : 1,
            child: Container(
              decoration: overdue
                  ? BoxDecoration(
                      borderRadius: BorderRadius.circular(kRadCard),
                      border: const Border(
                        left: BorderSide(color: kOverdue, width: 3),
                      ),
                    )
                  : null,
              padding: const EdgeInsets.fromLTRB(14, 13, 14, 13),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _Checkbox(done: task.isDone, accent: accent, onTap: onToggle),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(task.title, style: kRow(strike: task.isDone)),
                        if (task.description != null &&
                            task.description!.trim().isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(top: 2),
                            child: Text(
                              task.description!.trim(),
                              style: kMetaText(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 9, vertical: 3),
                              decoration: BoxDecoration(
                                color: accent.withValues(alpha: 0.10),
                                borderRadius: BorderRadius.circular(kRadPill),
                              ),
                              child: Text(
                                label,
                                style: kArchivo(
                                    size: 10.5,
                                    weight: FontWeight.w600,
                                    color: accent),
                              ),
                            ),
                            if (_meta != null) ...[
                              const SizedBox(width: 7),
                              Text(
                                _meta!,
                                style: kArchivo(
                                  size: 12,
                                  weight: overdue ? FontWeight.w600 : FontWeight.w400,
                                  color: metaColor,
                                ),
                              ),
                            ],
                            if (task.reminderLeadMinutes != null && !task.isDone) ...[
                              const SizedBox(width: 6),
                              const Icon(Icons.notifications_none_rounded,
                                  size: 13, color: kFaint),
                            ],
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Checkbox extends StatelessWidget {
  const _Checkbox({required this.done, required this.accent, required this.onTap});
  final bool done;
  final Color accent;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        // Keeps the tap target at 44px without moving the visual circle.
        padding: const EdgeInsets.only(top: 1, right: 6, bottom: 6),
        child: Container(
          width: 22,
          height: 22,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: done ? accent : Colors.transparent,
            border: done ? null : Border.all(color: accent, width: 2),
          ),
          child: done
              ? const Icon(Icons.check_rounded, size: 14, color: Colors.white)
              : null,
        ),
      ),
    );
  }
}
