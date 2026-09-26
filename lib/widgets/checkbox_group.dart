import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'choice_pill.dart';

class CheckboxGroup extends StatelessWidget {
  const CheckboxGroup({
    super.key,
    required this.label,
    required this.options,
    required this.selected,
    required this.onChanged,
  });

  final String label;
  final List<String> options;
  final List<String> selected;
  final ValueChanged<List<String>> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: kFieldLabel()),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final option in options)
                ChoicePill(
                  label: option,
                  selected: selected.contains(option),
                  onTap: () {
                    final updated = List<String>.from(selected);
                    if (updated.contains(option)) {
                      updated.remove(option);
                    } else {
                      updated.add(option);
                    }
                    onChanged(updated);
                  },
                ),
            ],
          ),
        ],
      ),
    );
  }
}
