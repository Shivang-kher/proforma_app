import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// Selectable pill used by the multi-select and single-select groups.
///
/// Colours are set explicitly rather than inherited from `chipTheme` — a
/// Material `Chip` resolves its label colour through the color scheme, which
/// is fragile to theme changes and silently produced white-on-white labels.
class ChoicePill extends StatelessWidget {
  const ChoicePill({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
    this.selectedColor = kInk,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;
  final Color selectedColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected ? selectedColor : kCard,
      shape: const StadiumBorder(),
      child: InkWell(
        onTap: onTap,
        customBorder: const StadiumBorder(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: SizedBox(
            height: 36,
            child: Center(
              widthFactor: 1,
              child: Text(
                label,
                style: kArchivo(
                  size: 12.5,
                  weight: selected ? FontWeight.w600 : FontWeight.w500,
                  color: selected ? Colors.white : kInk,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Read-only pill for displaying a fact (age, status) rather than a choice.
class InfoPill extends StatelessWidget {
  const InfoPill({super.key, required this.label, this.color = kMuted});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(kRadPill),
      ),
      child: Text(
        label,
        style: kArchivo(size: 12, weight: FontWeight.w600, color: color),
      ),
    );
  }
}
