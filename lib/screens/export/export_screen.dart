import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/database_provider.dart';
import '../../services/export_service.dart';

class ExportScreen extends ConsumerStatefulWidget {
  const ExportScreen({super.key});

  @override
  ConsumerState<ExportScreen> createState() => _ExportScreenState();
}

class _ExportScreenState extends ConsumerState<ExportScreen> {
  bool _exporting = false;

  Future<void> _export() async {
    setState(() => _exporting = true);
    try {
      final db = ref.read(databaseProvider);
      await ExportService(db).exportAndShare();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Export failed: $e'),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _exporting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final patientsAsync = ref.watch(patientsProvider);
    final patientCount  = patientsAsync.valueOrNull?.length ?? 0;
    final colorScheme   = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Export')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Info card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.table_chart_rounded,
                      size: 36, color: colorScheme.primary),
                  const SizedBox(height: 12),
                  Text(
                    '$patientCount patient${patientCount == 1 ? '' : 's'} in database',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: colorScheme.onPrimaryContainer,
                        ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Exports all enrolled patients and their form data as a single CSV file. One row per patient, all fields as columns.',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: colorScheme.onPrimaryContainer.withValues(alpha: 0.8),
                        ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // What's included
            Text('What\'s included',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(fontWeight: FontWeight.w700)),
            const SizedBox(height: 12),
            ...[
              ('👤', 'Patient registration & history'),
              ('🩸', 'Pre-chemo clinical exam & blood values'),
              ('💊', 'Post-chemo assessment & CA125'),
              ('🔬', 'Cytoreduction, CT findings, KELIM & CRS'),
              ('📅', 'Relapse follow-up data'),
            ].map(
              (item) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  children: [
                    Text(item.$1, style: const TextStyle(fontSize: 18)),
                    const SizedBox(width: 12),
                    Text(item.$2,
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 12),

            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Icon(Icons.info_outline_rounded,
                      size: 16, color: colorScheme.outline),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Empty fields are exported as blank cells. Compatible with Excel, SPSS, and R.',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: colorScheme.outline,
                          ),
                    ),
                  ),
                ],
              ),
            ),

            const Spacer(),

            FilledButton.icon(
              onPressed: (patientCount == 0 || _exporting) ? null : _export,
              icon: _exporting
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                          strokeWidth: 2, color: Colors.white),
                    )
                  : const Icon(Icons.ios_share_rounded),
              label: Text(_exporting ? 'Preparing…' : 'Export & Share CSV'),
              style: FilledButton.styleFrom(
                minimumSize: const Size.fromHeight(54),
              ),
            ),

            if (patientCount == 0) ...[
              const SizedBox(height: 8),
              Center(
                child: Text(
                  'Add at least one patient to export.',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: colorScheme.outline,
                      ),
                ),
              ),
            ],

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
