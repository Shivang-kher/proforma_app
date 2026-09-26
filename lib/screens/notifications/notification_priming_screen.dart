import 'package:flutter/material.dart';
import '../../services/notification_service.dart';
import '../../theme/app_theme.dart';

/// Explains the value before iOS shows its one-and-only permission dialog.
/// Returns true when notifications ended up granted.
Future<bool> showNotificationPriming(BuildContext context) async {
  final granted = await showModalBottomSheet<bool>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => const _PrimingSheet(),
  );
  return granted ?? false;
}

class _PrimingSheet extends StatefulWidget {
  const _PrimingSheet();

  @override
  State<_PrimingSheet> createState() => _PrimingSheetState();
}

class _PrimingSheetState extends State<_PrimingSheet> {
  bool _asking = false;

  Future<void> _turnOn() async {
    setState(() => _asking = true);
    final notif = NotificationService.instance;
    final granted = await notif.requestPermission();
    if (!mounted) return;

    if (!granted) {
      // iOS only ever prompts once — after a denial the only route is Settings.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Notifications are off. Enable them in iOS Settings › Proforma.'),
          duration: Duration(seconds: 4),
        ),
      );
    }
    Navigator.of(context).pop(granted);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: kGround,
        borderRadius: BorderRadius.vertical(top: Radius.circular(kRadSheet)),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 10, 24, 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 38,
                  height: 4,
                  decoration: BoxDecoration(
                    color: kDisabled,
                    borderRadius: BorderRadius.circular(kRadPill),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: kStudy.withValues(alpha: 0.10),
                  borderRadius: BorderRadius.circular(kRadCard),
                ),
                child: const Icon(Icons.notifications_none_rounded, size: 26, color: kStudy),
              ),
              const SizedBox(height: 18),
              Text(
                'Never miss a deadline',
                style: kArchivo(size: 21, weight: FontWeight.w700, letterSpacing: -0.6),
              ),
              const SizedBox(height: 10),
              Text(
                "A nudge when a task is due, and a morning prompt on days you haven't planned anything.",
                style: kArchivo(size: 13, color: kMuted, height: 1.55),
              ),
              const SizedBox(height: 20),
              const _Point('Only tasks you set a time on'),
              const SizedBox(height: 11),
              const _Point('One nudge a day, never more'),
              const SizedBox(height: 11),
              const _Point('Off any time in Settings'),
              const SizedBox(height: 26),
              FilledButton(
                onPressed: _asking ? null : _turnOn,
                style: FilledButton.styleFrom(
                  backgroundColor: kStudy,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: _asking
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                      )
                    : const Text('Turn on reminders'),
              ),
              const SizedBox(height: 6),
              TextButton(
                onPressed: _asking
                    ? null
                    : () async {
                        await NotificationService.instance.markPrimed();
                        if (context.mounted) Navigator.of(context).pop(false);
                      },
                style: TextButton.styleFrom(minimumSize: const Size(double.infinity, 44)),
                child: const Text('Not now'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Point extends StatelessWidget {
  const _Point(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 1),
          child: Icon(Icons.check_rounded, size: 16, color: kExercise),
        ),
        const SizedBox(width: 9),
        Expanded(child: Text(text, style: kArchivo(size: 12.5, height: 1.45))),
      ],
    );
  }
}
