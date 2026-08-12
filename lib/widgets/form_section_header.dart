import 'package:flutter/material.dart';

class FormSectionHeader extends StatelessWidget {
  const FormSectionHeader({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, bottom: 8),
      child: Row(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.5,
                ),
          ),
          const SizedBox(width: 10),
          Expanded(child: Divider(color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.3))),
        ],
      ),
    );
  }
}
