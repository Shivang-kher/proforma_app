import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// Apple Calendar-style month grid: centred day number, density dots beneath,
/// today filled in the module accent.
class MonthCalendar extends StatelessWidget {
  const MonthCalendar({
    super.key,
    required this.month,
    required this.selected,
    required this.accent,
    required this.dotsFor,
    required this.onSelect,
  });

  /// Any date inside the month to render.
  final DateTime month;
  final DateTime selected;
  final Color accent;

  /// Dot colours for a given day — at most 3 are drawn.
  final List<Color> Function(DateTime day) dotsFor;
  final ValueChanged<DateTime> onSelect;

  static bool _sameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    final first = DateTime(month.year, month.month, 1);
    final leading = first.weekday - 1; // Monday-first
    final daysInMonth = DateTime(month.year, month.month + 1, 0).day;
    final rows = ((leading + daysInMonth) / 7).ceil();
    final cellCount = rows * 7;

    return Container(
      decoration: BoxDecoration(
        color: kCard,
        borderRadius: BorderRadius.circular(kRadPanel),
      ),
      padding: const EdgeInsets.fromLTRB(8, 14, 8, 10),
      child: Column(
        children: [
          Row(
            children: [
              for (final d in const ['M', 'T', 'W', 'T', 'F', 'S', 'S'])
                Expanded(
                  child: Center(
                    child: Text(
                      d,
                      style: kArchivo(size: 11, weight: FontWeight.w600, color: kFaint),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 4),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              mainAxisExtent: 58,
            ),
            itemCount: cellCount,
            itemBuilder: (_, i) {
              final dayNum = i - leading + 1;
              final inMonth = dayNum >= 1 && dayNum <= daysInMonth;
              final date = DateTime(month.year, month.month, dayNum);

              final isToday = inMonth && _sameDay(date, today);
              final isSelected = inMonth && _sameDay(date, selected);
              final dots = inMonth ? dotsFor(date).take(3).toList() : const <Color>[];

              return _DayCell(
                label: '${date.day}',
                inMonth: inMonth,
                isToday: isToday,
                isSelected: isSelected,
                accent: accent,
                dots: dots,
                onTap: inMonth ? () => onSelect(date) : null,
              );
            },
          ),
        ],
      ),
    );
  }
}

class _DayCell extends StatelessWidget {
  const _DayCell({
    required this.label,
    required this.inMonth,
    required this.isToday,
    required this.isSelected,
    required this.accent,
    required this.dots,
    required this.onTap,
  });

  final String label;
  final bool inMonth;
  final bool isToday;
  final bool isSelected;
  final Color accent;
  final List<Color> dots;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final Color bg;
    final Color fg;
    if (isToday) {
      bg = accent;
      fg = Colors.white;
    } else if (isSelected) {
      bg = accent.withValues(alpha: 0.12);
      fg = accent;
    } else {
      bg = Colors.transparent;
      fg = inMonth ? kInk : kDisabled;
    }

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(kRadCard),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 32,
            height: 32,
            alignment: Alignment.center,
            decoration: BoxDecoration(color: bg, shape: BoxShape.circle),
            child: Text(
              label,
              style: kArchivo(
                size: 14.5,
                weight: isToday || isSelected ? FontWeight.w700 : FontWeight.w500,
                color: fg,
              ),
            ),
          ),
          const SizedBox(height: 4),
          SizedBox(
            height: 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 3,
              children: [
                for (final c in dots)
                  Container(
                    width: 5,
                    height: 5,
                    decoration: BoxDecoration(color: c, shape: BoxShape.circle),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
