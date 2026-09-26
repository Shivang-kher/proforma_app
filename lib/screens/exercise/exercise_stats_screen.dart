import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../db/database.dart';
import '../../providers/database_provider.dart';
import '../../theme/app_theme.dart';

final _allExerciseProvider = StreamProvider<List<ExerciseEntry>>(
  (ref) => ref.watch(databaseProvider).watchExerciseEntries(),
);

class ExerciseStatsScreen extends ConsumerWidget {
  const ExerciseStatsScreen({super.key});

  static DateTime _dayOf(DateTime d) => DateTime(d.year, d.month, d.day);

  /// Consecutive days with at least one entry, counting back from today.
  /// A streak stays alive until the end of today, so an unlogged today does
  /// not immediately zero out yesterday's run.
  static int _streak(Set<DateTime> loggedDays) {
    if (loggedDays.isEmpty) return 0;
    final today = _dayOf(DateTime.now());
    var cursor = loggedDays.contains(today)
        ? today
        : today.subtract(const Duration(days: 1));
    if (!loggedDays.contains(cursor)) return 0;
    var count = 0;
    while (loggedDays.contains(cursor)) {
      count++;
      cursor = cursor.subtract(const Duration(days: 1));
    }
    return count;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final entries = ref.watch(_allExerciseProvider).valueOrNull ?? const [];
    final now = DateTime.now();

    final loggedDays = entries.map((e) => _dayOf(e.date)).toSet();
    final streak = _streak(loggedDays);

    final thisMonth = entries
        .where((e) => e.date.year == now.year && e.date.month == now.month)
        .length;
    final totalMinutes = entries.fold<int>(0, (s, e) => s + (e.durationMinutes ?? 0));

    // Last 8 weeks, Monday-anchored.
    final thisMonday = _dayOf(now).subtract(Duration(days: now.weekday - 1));
    final weeks = List.generate(8, (i) {
      final start = thisMonday.subtract(Duration(days: 7 * (7 - i)));
      final end = start.add(const Duration(days: 7));
      final count = entries
          .where((e) => !e.date.isBefore(start) && e.date.isBefore(end))
          .length;
      return (start: start, count: count);
    });
    final maxWeek = weeks.map((w) => w.count).fold(0, (a, b) => a > b ? a : b);

    final freq = <String, int>{};
    for (final e in entries) {
      freq[e.exerciseType] = (freq[e.exerciseType] ?? 0) + 1;
    }
    final top = freq.entries.toList()..sort((a, b) => b.value.compareTo(a.value));
    final topMax = top.isEmpty ? 1 : top.first.value;

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(2, 0, 2, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Stats', style: kDisplay()),
              Text('Last 8 weeks', style: kMetaText()),
            ],
          ),
        ),

        Row(
          spacing: 8,
          children: [
            Expanded(
              child: _StatTile(
                value: '$streak',
                label: 'day streak',
                filled: true,
              ),
            ),
            Expanded(child: _StatTile(value: '$thisMonth', label: 'this month')),
            Expanded(
              child: _StatTile(
                value: (totalMinutes / 60).toStringAsFixed(1),
                unit: 'h',
                label: 'total time',
              ),
            ),
          ],
        ),

        const SizedBox(height: 14),

        // Weekly bars
        Container(
          decoration: BoxDecoration(
            color: kCard,
            borderRadius: BorderRadius.circular(kRadPanel),
          ),
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Sessions per week',
                  style: kArchivo(size: 13, weight: FontWeight.w600)),
              const SizedBox(height: 14),
              SizedBox(
                height: 118,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  spacing: 9,
                  children: [
                    for (var i = 0; i < weeks.length; i++)
                      Expanded(
                        child: _Bar(
                          value: weeks[i].count,
                          max: maxWeek,
                          isCurrent: i == weeks.length - 1,
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Row(
                spacing: 9,
                children: [
                  for (final w in weeks)
                    Expanded(
                      child: Center(
                        child: Text(
                          '${w.start.day}/${w.start.month}',
                          style: kArchivo(size: 9.5, weight: FontWeight.w500, color: kFaint),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(height: 14),

        // Top movements
        Container(
          decoration: BoxDecoration(
            color: kCard,
            borderRadius: BorderRadius.circular(kRadPanel),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Top movements',
                  style: kArchivo(size: 13, weight: FontWeight.w600)),
              const SizedBox(height: 12),
              if (top.isEmpty)
                Text('Nothing logged yet', style: kMetaText(color: kFaint))
              else
                Column(
                  spacing: 11,
                  children: [
                    for (final e in top.take(6))
                      Row(
                        children: [
                          SizedBox(
                            width: 96,
                            child: Text(e.key,
                                style: kRow(),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(kRadPill),
                              child: LinearProgressIndicator(
                                value: e.value / topMax,
                                minHeight: 8,
                                backgroundColor: const Color(0xFFF0EEEB),
                                valueColor: const AlwaysStoppedAnimation(kExercise),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          SizedBox(
                            width: 20,
                            child: Text('${e.value}',
                                textAlign: TextAlign.right,
                                style: kArchivo(
                                    size: 12.5, weight: FontWeight.w600, color: kMuted)),
                          ),
                        ],
                      ),
                  ],
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class _StatTile extends StatelessWidget {
  const _StatTile({
    required this.value,
    required this.label,
    this.unit,
    this.filled = false,
  });
  final String value;
  final String label;
  final String? unit;
  final bool filled;

  @override
  Widget build(BuildContext context) {
    final fg = filled ? Colors.white : kInk;
    return Container(
      decoration: BoxDecoration(
        color: filled ? kExercise : kCard,
        borderRadius: BorderRadius.circular(18),
      ),
      padding: const EdgeInsets.fromLTRB(14, 14, 14, 13),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              text: value,
              style: kArchivo(
                  size: 30, weight: FontWeight.w700, letterSpacing: -1, height: 1, color: fg),
              children: [
                if (unit != null)
                  TextSpan(
                    text: unit,
                    style: kArchivo(
                      size: 15,
                      weight: FontWeight.w500,
                      color: filled ? Colors.white70 : kMuted,
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: kArchivo(size: 11.5, color: filled ? Colors.white70 : kMuted),
          ),
        ],
      ),
    );
  }
}

class _Bar extends StatelessWidget {
  const _Bar({required this.value, required this.max, required this.isCurrent});
  final int value;
  final int max;
  final bool isCurrent;

  @override
  Widget build(BuildContext context) {
    const trackHeight = 92.0;
    final h = max == 0 ? 0.0 : (value / max) * trackHeight;
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          '$value',
          style: kArchivo(
            size: 11,
            weight: FontWeight.w600,
            color: isCurrent ? kExercise : kFaint,
          ),
        ),
        const SizedBox(height: 6),
        Container(
          height: h,
          decoration: BoxDecoration(
            color: isCurrent ? kExercise : kExercise.withValues(alpha: 0.22),
            borderRadius: BorderRadius.circular(kRadPill),
          ),
        ),
      ],
    );
  }
}
