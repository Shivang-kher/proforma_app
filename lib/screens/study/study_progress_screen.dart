import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../db/database.dart';
import '../../theme/app_theme.dart';
import 'task_providers.dart';

class StudyProgressScreen extends ConsumerWidget {
  const StudyProgressScreen({super.key});

  static DateTime _dayOf(DateTime d) => DateTime(d.year, d.month, d.day);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(tasksProvider).valueOrNull ?? const <Task>[];
    final now = DateTime.now();
    final today = _dayOf(now);
    final weekStart = DateTime(today.year, today.month, today.day - (now.weekday - 1));

    final done = tasks.where((t) => t.isDone && t.completedAt != null).toList();
    final open = tasks.where((t) => !t.isDone).toList();

    final doneThisWeek =
        done.where((t) => !t.completedAt!.isBefore(weekStart)).length;

    // Last 7 days of completions.
    final days = List.generate(
        7, (i) => DateTime(today.year, today.month, today.day - (6 - i)));
    final counts = {for (final d in days) d: 0};
    for (final t in done) {
      final d = _dayOf(t.completedAt!);
      if (counts.containsKey(d)) counts[d] = counts[d]! + 1;
    }
    final maxDay = counts.values.fold(0, (a, b) => a > b ? a : b);

    final byCat = <String, int>{'study': 0, 'work': 0, 'personal': 0};
    for (final t in done) {
      byCat[t.category] = (byCat[t.category] ?? 0) + 1;
    }

    const weekdayLetters = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 24),
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(2, 0, 2, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Progress', style: kDisplay()),
              Text('Last 7 days', style: kMetaText()),
            ],
          ),
        ),

        Row(
          spacing: 8,
          children: [
            Expanded(
              child: _StatTile(value: '$doneThisWeek', label: 'done this week', filled: true),
            ),
            Expanded(child: _StatTile(value: '${open.length}', label: 'still open')),
            Expanded(child: _StatTile(value: '${done.length}', label: 'all time')),
          ],
        ),

        const SizedBox(height: 14),

        Container(
          decoration: BoxDecoration(
            color: kCard,
            borderRadius: BorderRadius.circular(kRadPanel),
          ),
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Tasks completed', style: kArchivo(size: 13, weight: FontWeight.w600)),
              const SizedBox(height: 14),
              SizedBox(
                height: 118,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  spacing: 9,
                  children: [
                    for (final d in days)
                      Expanded(
                        child: _Bar(
                          value: counts[d]!,
                          max: maxDay,
                          isCurrent: d == today,
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Row(
                spacing: 9,
                children: [
                  for (final d in days)
                    Expanded(
                      child: Center(
                        child: Text(
                          weekdayLetters[d.weekday - 1],
                          style: kArchivo(
                            size: 10,
                            weight: FontWeight.w500,
                            color: d == today ? kStudy : kFaint,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(height: 14),

        Container(
          decoration: BoxDecoration(
            color: kCard,
            borderRadius: BorderRadius.circular(kRadPanel),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('By category · all time',
                  style: kArchivo(size: 13, weight: FontWeight.w600)),
              const SizedBox(height: 12),
              if (done.isEmpty)
                Text('Nothing completed yet', style: kMetaText(color: kFaint))
              else
                Column(
                  spacing: 11,
                  children: [
                    for (final e in byCat.entries)
                      Row(
                        children: [
                          SizedBox(
                            width: 74,
                            child: Text(
                              e.key[0].toUpperCase() + e.key.substring(1),
                              style: kRow(),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(kRadPill),
                              child: LinearProgressIndicator(
                                value: done.isEmpty ? 0 : e.value / done.length,
                                minHeight: 8,
                                backgroundColor: const Color(0xFFF0EEEB),
                                valueColor:
                                    AlwaysStoppedAnimation(categoryColor(e.key)),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          SizedBox(
                            width: 20,
                            child: Text(
                              '${e.value}',
                              textAlign: TextAlign.right,
                              style: kArchivo(
                                  size: 12.5, weight: FontWeight.w600, color: kMuted),
                            ),
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
  const _StatTile({required this.value, required this.label, this.filled = false});
  final String value;
  final String label;
  final bool filled;

  @override
  Widget build(BuildContext context) {
    final fg = filled ? Colors.white : kInk;
    return Container(
      decoration: BoxDecoration(
        color: filled ? kStudy : kCard,
        borderRadius: BorderRadius.circular(18),
      ),
      padding: const EdgeInsets.fromLTRB(14, 14, 14, 13),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: kArchivo(
                size: 30, weight: FontWeight.w700, letterSpacing: -1, height: 1, color: fg),
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
            color: isCurrent ? kStudy : kFaint,
          ),
        ),
        const SizedBox(height: 6),
        Container(
          height: h,
          decoration: BoxDecoration(
            color: isCurrent ? kStudy : kStudy.withValues(alpha: 0.22),
            borderRadius: BorderRadius.circular(kRadPill),
          ),
        ),
      ],
    );
  }
}
