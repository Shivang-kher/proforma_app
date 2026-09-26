import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class SegmentOption {
  const SegmentOption({required this.label, this.icon, this.accent});
  final String label;
  final IconData? icon;

  /// Colour for the selected state. Falls back to ink.
  final Color? accent;
}

/// Pill segmented control — grey track, white thumb, icon beside the label.
class SegmentedPill extends StatelessWidget {
  const SegmentedPill({
    super.key,
    required this.options,
    required this.selected,
    required this.onSelect,
    this.height = 38,
    this.filledThumb = false,
  });

  final List<SegmentOption> options;
  final int selected;
  final ValueChanged<int> onSelect;
  final double height;

  /// When true the active segment fills with its accent and its label goes
  /// white, instead of sitting on a white thumb.
  final bool filledThumb;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: kTrack,
        borderRadius: BorderRadius.circular(kRadPill),
      ),
      child: Row(
        spacing: 4,
        children: [
          for (var i = 0; i < options.length; i++)
            Expanded(child: _segment(i, options[i])),
        ],
      ),
    );
  }

  Widget _segment(int i, SegmentOption o) {
    final isActive = i == selected;
    final accent = o.accent ?? kInk;

    final Color bg;
    final Color fg;
    if (!isActive) {
      bg = Colors.transparent;
      fg = kMuted;
    } else if (filledThumb) {
      bg = accent;
      fg = Colors.white;
    } else {
      bg = kCard;
      fg = accent;
    }

    return GestureDetector(
      onTap: () => onSelect(i),
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,
        height: height,
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(kRadPill),
          boxShadow: isActive && !filledThumb
              ? const [
                  BoxShadow(
                    color: Color(0x171C1B1A),
                    blurRadius: 3,
                    offset: Offset(0, 1),
                  ),
                ]
              : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 6,
          children: [
            if (o.icon != null) Icon(o.icon, size: 14, color: fg),
            Flexible(
              child: Text(
                o.label,
                overflow: TextOverflow.ellipsis,
                style: kArchivo(
                  size: 12,
                  weight: isActive ? FontWeight.w600 : FontWeight.w500,
                  color: fg,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
