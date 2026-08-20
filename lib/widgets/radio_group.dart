import 'package:flutter/material.dart';

class LabeledRadioGroup extends StatelessWidget {
  const LabeledRadioGroup({
    super.key,
    required this.label,
    required this.options,
    required this.selected,
    required this.onChanged,
  });

  final String label;
  final List<String> options;
  final String? selected;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context)
                .textTheme
                .labelMedium
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 4),
          Wrap(
            spacing: 8,
            children: options.map((option) {
              final isSelected = selected == option;
              final cs = Theme.of(context).colorScheme;
              return ChoiceChip(
                label: Text(option),
                selected: isSelected,
                onSelected: (_) => onChanged(option),
                selectedColor: cs.primary,
                backgroundColor: cs.surfaceContainerHighest,
                labelStyle: TextStyle(
                  color: isSelected ? cs.onPrimary : cs.onSurface,
                  fontWeight:
                      isSelected ? FontWeight.w600 : FontWeight.normal,
                ),
                side: BorderSide(
                  color: isSelected ? cs.primary : cs.outlineVariant,
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
