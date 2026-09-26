import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../db/database.dart';
import '../../theme/app_theme.dart';
import '../../widgets/month_calendar.dart';
import '../../widgets/task_card.dart';
import 'task_form_sheet.dart';
import 'task_providers.dart';

class StudyMonthScreen extends ConsumerStatefulWidget {
  const StudyMonthScreen({super.key});

  @override
  ConsumerState<StudyMonthScreen> createState() => _StudyMonthScreenState();
}

class _StudyMonthScreenState extends ConsumerState<StudyMonthScreen> {
  late DateTime _month;
  late DateTime _selected;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _month = DateTime(now.year, now.month, 1);
    _selected = DateTime(now.year, now.month, now.day);
  }

  void _shiftMonth(int delta) {
    setState(() {
      _month = DateTime(_month.year, _month.month + delta, 1);
      final lastDay = DateTime(_month.year, _month.month + 1, 0).day;
      _selected = DateTime(_month.year, _month.month, _selected.day.clamp(1, lastDay));
    });
  }

  static bool _sameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  @override
  Widget build(BuildContext context) {
    final all = ref.watch(tasksProvider).valueOrNull ?? const <Task>[];
    final actions = ref.read(taskActionsProvider);

    final inMonth = all.where((t) =>
        t.dueDate != null &&
        t.dueDate!.year == _month.year &&
        t.dueDate!.month == _month.month);

    // One dot per distinct category on that day, so a glance shows the mix.
    final catsByDay = <int, List<Color>>{};
    for (final t in inMonth) {
      final list = catsByDay[t.dueDate!.day] ??= [];
      final c = categoryColor(t.category);
      if (!list.contains(c)) list.add(c);
    }

    final dayTasks = all.where((t) => t.dueDate != null && _sameDay(t.dueDate!, _selected)).toList()
      ..sort((a, b) {
        if (a.isDone != b.isDone) return a.isDone ? 1 : -1;
        return (a.dueMinuteOfDay ?? 1 << 30).compareTo(b.dueMinuteOfDay ?? 1 << 30);
      });
    final openCount = dayTasks.where((t) => !t.isDone).length;

    final isToday = _sameDay(_selected, DateTime.now());

    return ListView(
      padding: const EdgeInsets.only(bottom: 24),
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(18, 4, 18, 12),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(DateFormat('MMMM').format(_month), style: kDisplay()),
                    Text(
                      '${all.where((t) => !t.isDone).length} open · '
                      '${all.where((t) => t.isDone).length} done',
                      style: kMetaText(),
                    ),
                  ],
                ),
              ),
              _RoundIconButton(
                icon: Icons.chevron_left_rounded,
                tooltip: 'Previous month',
                onTap: () => _shiftMonth(-1),
              ),
              const SizedBox(width: 8),
              _RoundIconButton(
                icon: Icons.chevron_right_rounded,
                tooltip: 'Next month',
                onTap: () => _shiftMonth(1),
              ),
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: MonthCalendar(
            month: _month,
            selected: _selected,
            accent: kStudy,
            dotsFor: (day) => catsByDay[day.day] ?? const [],
            onSelect: (d) => setState(() => _selected = d),
          ),
        ),

        Padding(
          padding: const EdgeInsets.fromLTRB(18, 20, 18, 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                isToday ? 'Today' : DateFormat('EEEE').format(_selected),
                style: kArchivo(size: 17, weight: FontWeight.w700, letterSpacing: -0.4),
              ),
              const SizedBox(width: 8),
              Text(DateFormat('d MMM').format(_selected), style: kMetaText()),
              const Spacer(),
              if (dayTasks.isNotEmpty) Text('$openCount due', style: kMetaText()),
            ],
          ),
        ),

        if (dayTasks.isEmpty)
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 34),
              decoration: BoxDecoration(
                color: kCard,
                borderRadius: BorderRadius.circular(kRadCard),
              ),
              child: Column(
                children: [
                  Icon(Icons.event_available_rounded, size: 28, color: kDisabled),
                  const SizedBox(height: 10),
                  Text('Nothing scheduled', style: kRow(color: kMuted)),
                  const SizedBox(height: 2),
                  Text('Tap below to plan this day', style: kMetaText(color: kFaint)),
                ],
              ),
            ),
          )
        else
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              spacing: 8,
              children: [
                for (final t in dayTasks)
                  TaskCard(
                    task: t,
                    onToggle: () => actions.setDone(t, !t.isDone),
                    onDelete: () => actions.delete(t),
                    onEdit: () => _openSheet(existing: t),
                  ),
              ],
            ),
          ),

        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
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
      builder: (_) => TaskFormSheet(existing: existing, defaultDate: _selected),
    );
  }
}

class _RoundIconButton extends StatelessWidget {
  const _RoundIconButton({required this.icon, required this.onTap, required this.tooltip});
  final IconData icon;
  final VoidCallback onTap;
  final String tooltip;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: Material(
        color: kCard,
        shape: const CircleBorder(),
        child: InkWell(
          onTap: onTap,
          customBorder: const CircleBorder(),
          child: SizedBox(
            width: 40,
            height: 40,
            child: Icon(icon, size: 20, color: kInk),
          ),
        ),
      ),
    );
  }
}
