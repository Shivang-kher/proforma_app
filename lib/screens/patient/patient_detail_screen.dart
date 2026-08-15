import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../providers/database_provider.dart';
import '../../db/database.dart';
import '../../services/notification_service.dart';
import '../../services/sync_service.dart';
import '../../widgets/completion_badge.dart';

class PatientDetailScreen extends ConsumerWidget {
  const PatientDetailScreen({super.key, required this.patientId});
  final int patientId;

  Future<void> _showReminderDialog(
      BuildContext context, Patient patient) async {
    final pending = await NotificationService.instance.pending();
    final hasReminder = pending.any((n) => n.id == patientId);

    if (!context.mounted) return;

    if (hasReminder) {
      final cancel = await showDialog<bool>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Reminder active'),
          content: Text('A daily reminder is set for ${patient.name}. Cancel it?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: const Text('Keep'),
            ),
            FilledButton(
              onPressed: () => Navigator.pop(ctx, true),
              child: const Text('Cancel reminder'),
            ),
          ],
        ),
      );
      if (cancel == true) {
        await NotificationService.instance.cancel(patientId);
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Reminder cancelled')),
          );
        }
      }
      return;
    }

    // Ask permission first if not yet granted
    final granted = await NotificationService.instance.requestPermission();
    if (!granted) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text(
                  'Enable notifications in Settings to set reminders.')),
        );
      }
      return;
    }

    if (!context.mounted) return;

    // Show test option alongside time picker
    final choice = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Set reminder'),
        content: const Text('Choose a daily time, or send a test notification in 5 seconds.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, 'test'),
            child: const Text('Test (5s)'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, 'pick'),
            child: const Text('Pick time'),
          ),
        ],
      ),
    );

    if (choice == null || !context.mounted) return;

    if (choice == 'test') {
      await NotificationService.instance.testIn5Seconds(patient.name);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Background the app now — notification fires in 5 s')),
        );
      }
      return;
    }

    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: const TimeOfDay(hour: 9, minute: 0),
      helpText: 'Remind me daily at…',
    );
    if (picked == null || !context.mounted) return;

    await NotificationService.instance.scheduleDaily(
      patientId: patientId,
      patientName: patient.name,
      hour: picked.hour,
      minute: picked.minute,
    );

    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              'Reminder set for ${patient.name} at ${picked.format(context)} daily'),
        ),
      );
    }
  }

  Future<void> _confirmDelete(BuildContext context, WidgetRef ref, Patient patient) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete patient?'),
        content: Text(
          'This will permanently delete ${patient.name} and all their form data. This cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
    if (confirmed != true || !context.mounted) return;

    final db = ref.read(databaseProvider);
    await NotificationService.instance.cancel(patientId);
    await db.deletePatientCascade(patientId);
    SyncService.instance.deleteFromCloud(patientId); // fire and forget
    if (context.mounted) context.go('/');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(databaseProvider);

    return FutureBuilder<Patient>(
      future: db.getPatient(patientId),
      builder: (context, snap) {
        if (!snap.hasData) {
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        }
        final patient = snap.data!;

        return Scaffold(
          appBar: AppBar(
            title: Text(patient.name),
            actions: [
              FutureBuilder<List<PendingNotificationRequest>>(
                future: NotificationService.instance.pending(),
                builder: (context, snap) {
                  final hasReminder =
                      snap.data?.any((n) => n.id == patientId) ?? false;
                  return IconButton(
                    icon: Icon(hasReminder
                        ? Icons.notifications_active_rounded
                        : Icons.notifications_none_rounded),
                    tooltip: hasReminder ? 'Reminder active' : 'Set reminder',
                    onPressed: () => _showReminderDialog(context, patient),
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.edit_rounded),
                onPressed: () => context.push('/patient/edit/$patientId'),
              ),
              IconButton(
                icon: const Icon(Icons.delete_outline_rounded),
                tooltip: 'Delete patient',
                onPressed: () => _confirmDelete(context, ref, patient),
              ),
            ],
          ),
          body: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Wrap(
                spacing: 8,
                children: [
                  Chip(label: Text('Age: ${patient.age}')),
                  Chip(label: Text(patient.menstrualStatus)),
                  Chip(label: Text('Parity: ${patient.parity}')),
                ],
              ),
              // ── Phone numbers ──────────────────────────
              if (patient.phone != null && patient.phone!.isNotEmpty) ...[
                const SizedBox(height: 12),
                ...(patient.phone!.split('|').where((s) => s.isNotEmpty))
                    .map((n) => _PhoneTile(number: n)),
              ],
              const SizedBox(height: 20),
              Text('Data Collection Forms',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),

              FutureBuilder(
                future: Future.wait([
                  db.getPreChemo(patientId),
                  db.getPostChemo(patientId),
                  db.getCytoreduction(patientId),
                  db.getRelapse(patientId),
                ]),
                builder: (context, AsyncSnapshot<List<dynamic>> snap) {
                  final pre = snap.data?[0];
                  final post = snap.data?[1];
                  final cyto = snap.data?[2];
                  final relapse = snap.data?[3];

                  return Column(
                    children: [
                      _FormCard(
                        icon: '📝',
                        title: 'Patient Registration',
                        subtitle: 'Complaints, medical & family history',
                        filled: true,
                        onTap: () => context.push('/patient/edit/$patientId'),
                      ),
                      _FormCard(
                        icon: '🩸',
                        title: 'Pre-Chemo Assessment',
                        subtitle: 'Clinical exam + pre-chemo blood values',
                        filled: pre != null,
                        onTap: () =>
                            context.push('/form/pre-chemo/$patientId'),
                      ),
                      _FormCard(
                        icon: '💊',
                        title: 'Post-Chemo Assessment',
                        subtitle: 'NACT cycles + post-chemo bloods + CA125',
                        filled: post != null,
                        onTap: () =>
                            context.push('/form/post-chemo/$patientId'),
                      ),
                      _FormCard(
                        icon: '🔬',
                        title: 'Cytoreduction & CT Findings',
                        subtitle:
                            'Surgery details + 11-organ CT grid + KELIM/CRS',
                        filled: cyto != null,
                        onTap: () =>
                            context.push('/form/cytoreduction/$patientId'),
                      ),
                      _FormCard(
                        icon: '📅',
                        title: 'Relapse Follow-up',
                        subtitle: 'Recurrence, PFI, TFI, OS',
                        filled: relapse != null,
                        enabled: post != null,
                        onTap: () =>
                            context.push('/form/relapse/$patientId'),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class _PhoneTile extends StatelessWidget {
  const _PhoneTile({required this.number});
  final String number;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          Icon(Icons.phone_rounded, size: 16, color: colorScheme.primary),
          const SizedBox(width: 8),
          Text(number, style: Theme.of(context).textTheme.bodyMedium),
          const Spacer(),
          FilledButton.tonalIcon(
            onPressed: () =>
                launchUrl(Uri(scheme: 'tel', path: number)),
            icon: const Icon(Icons.call_rounded, size: 16),
            label: const Text('Call'),
            style: FilledButton.styleFrom(
              visualDensity: VisualDensity.compact,
              padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
          ),
        ],
      ),
    );
  }
}

class _FormCard extends StatelessWidget {
  const _FormCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.filled,
    required this.onTap,
    this.enabled = true,
  });

  final String icon;
  final String title;
  final String subtitle;
  final bool filled;
  final bool enabled;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Opacity(
      opacity: enabled ? 1 : 0.4,
      child: Card(
        elevation: 0,
        margin: const EdgeInsets.only(bottom: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: filled
                ? colorScheme.primary.withValues(alpha: 0.4)
                : colorScheme.outlineVariant,
          ),
        ),
        child: ListTile(
          enabled: enabled,
          onTap: enabled ? onTap : null,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          leading: Text(icon, style: const TextStyle(fontSize: 28)),
          title: Text(title,
              style: const TextStyle(
                  fontWeight: FontWeight.w600, fontSize: 14)),
          subtitle: Text(subtitle, style: const TextStyle(fontSize: 12)),
          trailing: CompletionBadge(filled: filled),
        ),
      ),
    );
  }
}
