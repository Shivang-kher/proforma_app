import 'package:flutter/material.dart';

class PinPad extends StatelessWidget {
  const PinPad({
    super.key,
    required this.onKey,
    required this.onDelete,
    this.disabled = false,
  });

  final void Function(String) onKey;
  final VoidCallback onDelete;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    Widget key(String label) => _PinKey(
          label: label,
          onTap: disabled ? null : () => onKey(label),
          cs: cs,
        );

    Widget deleteKey() => _PinKey(
          icon: Icons.backspace_outlined,
          onTap: disabled ? null : onDelete,
          cs: cs,
        );

    Widget row(List<Widget> keys) => Row(
          children: keys
              .expand((k) => [Expanded(child: k), const SizedBox(width: 12)])
              .toList()
            ..removeLast(),
        );

    return Column(
      children: [
        row([key('1'), key('2'), key('3')]),
        const SizedBox(height: 12),
        row([key('4'), key('5'), key('6')]),
        const SizedBox(height: 12),
        row([key('7'), key('8'), key('9')]),
        const SizedBox(height: 12),
        row([const _EmptyKey(), key('0'), deleteKey()]),
      ],
    );
  }
}

class _PinKey extends StatelessWidget {
  const _PinKey({this.label, this.icon, required this.onTap, required this.cs});
  final String? label;
  final IconData? icon;
  final VoidCallback? onTap;
  final ColorScheme cs;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.6,
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          backgroundColor: cs.surfaceContainerHighest,
          foregroundColor: cs.onSurface,
          disabledForegroundColor: cs.onSurface.withValues(alpha: 0.3),
          disabledBackgroundColor: cs.surfaceContainerHighest.withValues(alpha: 0.5),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          padding: EdgeInsets.zero,
        ),
        child: icon != null
            ? Icon(icon, size: 22)
            : Text(
                label!,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
      ),
    );
  }
}

class _EmptyKey extends StatelessWidget {
  const _EmptyKey();

  @override
  Widget build(BuildContext context) => const AspectRatio(aspectRatio: 1.6, child: SizedBox());
}
