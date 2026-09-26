import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../db/database.dart';
import '../../theme/app_theme.dart';
import '../../widgets/task_card.dart';
import 'task_form_sheet.dart';
import 'task_providers.dart';

enum _Filter { all, study, work, personal, done }

class TaskListScreen extends ConsumerStatefulWidget {
  const TaskListScreen({super.key});

  @override
  ConsumerState<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends ConsumerState<TaskListScreen> {
  _Filter _filter = _Filter.all;

  static DateTime _dayOf(DateTime d) => DateTime(d.year, d.month, d.day);

  @override
  Widget build(BuildContext context) {
    final all = ref.watch(tasksProvider).valueOrNull ?? const <Task>[];
    final actions = ref.read(taskActionsProvider);

    final visible = all.where((t) => switch (_filter) {
          _Filter.all => !t.isDone,
          _Filter.done => t.isDone,
          _Filter.study => !t.isDone && t.category == 'study',
          _Filter.work => !t.isDone && t.category == 'work',
          _Filter.personal => !t.isDone && t.category == 'personal',
        }).toList();

    final today = _dayOf(DateTime.now());
    final tomorrow = today.add(const Duration(days: 1));

    List<Task> bucket(bool Function(Task) test) {
      final list = visible.where(test).toList();
      list.sort((a, b) {
        final ad = a.dueDate == null ? null : _dayOf(a.dueDate!);
        final bd = b.dueDate == null ? null : _dayOf(b.dueDate!);
        if (ad != bd) {
          if (ad == null) return 1;
          if (bd == null) return -1;
          return ad.compareTo(bd);
        }
        return (a.dueMinuteOfDay ?? 1 << 30).compareTo(b.dueMinuteOfDay ?? 1 << 30);
      });
      return list;
    }

    final List<({String title, Color color, List<Task> items, bool overdue})> sections;

    if (_filter == _Filter.done) {
      // Completed tasks read as history, so they go in one list newest-first.
      // Bucketing them by due date drops anything already past due — which is
      // most of them.
      final completed = visible.toList()
        ..sort((a, b) => (b.completedAt ?? b.dueDate ?? DateTime(0))
            .compareTo(a.completedAt ?? a.dueDate ?? DateTime(0)));
      sections = [
        (title: 'Completed', color: kMuted, items: completed, overdue: false),
      ];
    } else {
      sections = <({String title, Color color, List<Task> items, bool overdue})>[
        (
          title: 'Overdue',
          color: kOverdue,
          items: bucket((t) => t.dueDate != null && _dayOf(t.dueDate!).isBefore(today)),
          overdue: true,
        ),
        (
          title: 'Today',
          color: kMuted,
          items: bucket((t) => t.dueDate != null && _dayOf(t.dueDate!) == today),
          overdue: false,
        ),
        (
          title: 'Tomorrow',
          color: kMuted,
          items: bucket((t) => t.dueDate != null && _dayOf(t.dueDate!) == tomorrow),
          overdue: false,
        ),
        (
          title: 'Later',
          color: kMuted,
          items: bucket((t) =>
              t.dueDate == null || _dayOf(t.dueDate!).isAfter(tomorrow)),
          overdue: false,
        ),
      ];
    }

    final visibleSections = sections.where((s) => s.items.isNotEmpty).toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(18, 4, 18, 12),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Tasks', style: kDisplay()),
                Text('${all.where((t) => !t.isDone).length} open', style: kMetaText()),
              ],
            ),
          ),
        ),

        // Filters
        SizedBox(
          height: 34,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: _Filter.values.length,
            separatorBuilder: (_, i) => const SizedBox(width: 7),
            itemBuilder: (_, i) {
              final f = _Filter.values[i];
              final label = switch (f) {
                _Filter.all => 'All',
                _Filter.study => 'Study',
                _Filter.work => 'Work',
                _Filter.personal => 'Personal',
                _Filter.done => 'Done',
              };
              final on = _filter == f;
              return Material(
                color: on ? kInk : kCard,
                shape: const StadiumBorder(),
                child: InkWell(
                  onTap: () => setState(() => _filter = f),
                  customBorder: const StadiumBorder(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Center(
                      child: Text(
                        label,
                        style: kArchivo(
                          size: 12.5,
                          weight: on ? FontWeight.w600 : FontWeight.w500,
                          color: on ? Colors.white : kInk,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),

        Expanded(
          child: visibleSections.isEmpty
              ? _EmptyState(filter: _filter)
              : ListView(
                  padding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
                  children: [
                    for (final s in visibleSections) ...[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(2, 16, 2, 8),
                        child: Text(
                          s.title,
                          style: kArchivo(
                              size: 12.5, weight: FontWeight.w600, color: s.color),
                        ),
                      ),
                      Column(
                        spacing: 8,
                        children: [
                          for (final t in s.items)
                            TaskCard(
                              task: t,
                              overdue: s.overdue,
                              showDate: s.title == 'Later' || s.title == 'Completed',
                              onToggle: () => actions.setDone(t, !t.isDone),
                              onDelete: () => actions.delete(t),
                              onEdit: () => _openSheet(existing: t),
                            ),
                        ],
                      ),
                    ],
                  ],
                ),
        ),

        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
          child: FilledButton.icon(
            onPressed: () => _openSheet(),
            icon: const Icon(Icons.add_rounded, size: 18),
            label: const Text('New task'),
            style: FilledButton.styleFrom(
              backgroundColor: kStudy,
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 50),
            ),
          ),
        ),
      ],
    );
  }

  void _openSheet({Task? existing}) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => TaskFormSheet(existing: existing),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState({required this.filter});
  final _Filter filter;

  @override
  Widget build(BuildContext context) {
    final (icon, title, sub) = filter == _Filter.done
        ? (Icons.history_rounded, 'Nothing completed yet', 'Finished tasks land here')
        : (Icons.check_circle_outline_rounded, 'All caught up', 'Add a task to get started');

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 40, color: kDisabled),
          const SizedBox(height: 12),
          Text(title, style: kArchivo(size: 16, weight: FontWeight.w600, color: kMuted)),
          const SizedBox(height: 3),
          Text(sub, style: kMetaText(color: kFaint)),
        ],
      ),
    );
  }
}
