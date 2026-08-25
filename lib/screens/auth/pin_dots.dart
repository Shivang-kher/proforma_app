import 'package:flutter/material.dart';

class PinDots extends StatelessWidget {
  const PinDots({super.key, required this.filled, this.total = 6});
  final int filled;
  final int total;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(total, (i) {
        final isFilled = i < filled;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 120),
          margin: const EdgeInsets.symmetric(horizontal: 8),
          width: 14,
          height: 14,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isFilled ? cs.primary : Colors.transparent,
            border: Border.all(
              color: isFilled ? cs.primary : cs.outline,
              width: 2,
            ),
          ),
        );
      }),
    );
  }
}
