import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../db/database.dart';
import '../../providers/database_provider.dart';
import '../../theme/app_theme.dart';
import '../../widgets/month_calendar.dart';
import 'exercise_log_sheet.dart';

/// Entries for the month containing [month], keyed by that month's first day.
final exerciseMonthProvider =
    StreamProvider.family<List<ExerciseEntry>, DateTime>((ref, month) {
  final from = DateTime(month.year, month.month, 1);
  final to = DateTime(month.year, month.month + 1, 1);
  return ref.watch(databaseProvider).watchExerciseEntriesInRange(from, to);
});

class ExerciseMonthScreen extends ConsumerStatefulWidget {
  const ExerciseMonthScreen({super.key});

  @override
  ConsumerState<ExerciseMonthScreen> createState() => _ExerciseMonthScreenState();
}

class _ExerciseMonthScreenState extends ConsumerState<ExerciseMonthScreen> {
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
      // Keep the selection inside the visible month.
      final lastDay = DateTime(_month.year, _month.month + 1, 0).day;
      _selected = DateTime(_month.year, _month.month, _selected.day.clamp(1, lastDay));
    });
  }

  bool get _isSameDayAsToday {
    final now = DateTime.now();
    return _selected.year == now.year &&
        _selected.month == now.month &&
        _selected.day == now.day;
  }

  @override
  Widget build(BuildContext context) {
    final entries = ref.watch(exerciseMonthProvider(_month)).valueOrNull ?? const [];

    final byDay = <int, List<ExerciseEntry>>{};
    for (final e in entries) {
      (byDay[e.date.day] ??= []).add(e);
    }
    final dayEntries = byDay[_selected.day] ?? const <ExerciseEntry>[];
    final totalMinutes = dayEntries.fold<int>(0, (s, e) => s + (e.durationMinutes ?? 0));

    return ListView(
      padding: const EdgeInsets.only(bottom: 24),
      children: [
        // Header
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
                      '${entries.length} ${entries.length == 1 ? 'session' : 'sessions'} this month',
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

        // Calendar
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: MonthCalendar(
            month: _month,
            selected: _selected,
            accent: kExercise,
            dotsFor: (day) =>
                List.filled((byDay[day.day] ?? const []).length.clamp(0, 3), kExercise),
            onSelect: (d) => setState(() => _selected = d),
          ),
        ),

        // Day heading
        Padding(
          padding: const EdgeInsets.fromLTRB(18, 20, 18, 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                _isSameDayAsToday ? 'Today' : DateFormat('EEEE').format(_selected),
                style: kArchivo(size: 17, weight: FontWeight.w700, letterSpacing: -0.4),
              ),
              const SizedBox(width: 8),
              Text(DateFormat('d MMM').format(_selected), style: kMetaText()),
              const Spacer(),
              if (dayEntries.isNotEmpty)
                Text(
                  totalMinutes > 0
                      ? '${dayEntries.length} · $totalMinutes min'
                      : '${dayEntries.length} logged',
                  style: kMetaText(),
                ),
            ],
          ),
        ),

        // Entries
        if (dayEntries.isEmpty)
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
                  Icon(Icons.fitness_center_rounded, size: 28, color: kDisabled),
                  const SizedBox(height: 10),
                  Text('Nothing logged', style: kRow(color: kMuted)),
                  const SizedBox(height: 2),
                  Text('Tap below to add a session', style: kMetaText(color: kFaint)),
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
                for (final e in dayEntries)
                  _EntryCard(
                    entry: e,
                    onEdit: () => _openSheet(existing: e),
                    onDelete: () =>
                        ref.read(databaseProvider).deleteExercise(e.id),
                  ),
              ],
            ),
          ),

        // Primary action
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: FilledButton.icon(
            onPressed: () => _openSheet(),
            icon: const Icon(Icons.add_rounded, size: 18),
            label: const Text('Log exercise'),
            style: FilledButton.styleFrom(
              backgroundColor: kExercise,
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 50),
            ),
          ),
        ),
      ],
    );
  }

  void _openSheet({ExerciseEntry? existing}) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => ExerciseLogSheet(date: _selected, existing: existing),
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

class _EntryCard extends StatelessWidget {
  const _EntryCard({required this.entry, required this.onEdit, required this.onDelete});
  final ExerciseEntry entry;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  String get _detail {
    final parts = <String>[];
    if (entry.sets != null && entry.reps != null) {
      parts.add('${entry.sets} × ${entry.reps}');
    }
    if (entry.weightKg != null) {
      final w = entry.weightKg!;
      parts.add('${w == w.roundToDouble() ? w.toInt() : w} kg');
    }
    if (entry.durationMinutes != null) parts.add('${entry.durationMinutes} min');
    if (entry.notes != null && entry.notes!.trim().isNotEmpty) parts.add(entry.notes!.trim());
    return parts.join(' · ');
  }

  String? get _time {
    if (entry.minuteOfDay == null) return null;
    final h = entry.minuteOfDay! ~/ 60;
    final m = entry.minuteOfDay! % 60;
    return '${h.toString().padLeft(2, '0')}:${m.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(entry.id),
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
            child: Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: kExercise.withValues(alpha: 0.10),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.fitness_center_rounded, size: 17, color: kExercise),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        entry.exerciseType,
                        style: kArchivo(size: 14.5, weight: FontWeight.w600),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (_detail.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(top: 1),
                          child: Text(
                            _detail,
                            style: kMetaText(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                    ],
                  ),
                ),
                if (_time != null) ...[
                  const SizedBox(width: 8),
                  Text(_time!, style: kMetaText(color: kFaint)),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
