import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/database_provider.dart';
import '../../services/export_service.dart';

enum _ExportType { full, master }

class ExportScreen extends ConsumerStatefulWidget {
  const ExportScreen({super.key});

  @override
  ConsumerState<ExportScreen> createState() => _ExportScreenState();
}

class _ExportScreenState extends ConsumerState<ExportScreen> {
  _ExportType? _exporting;

  Future<void> _run(_ExportType type) async {
    setState(() => _exporting = type);
    try {
      final svc = ExportService(ref.read(databaseProvider));
      if (type == _ExportType.full) {
        await svc.exportAndShare();
      } else {
        await svc.exportMasterAndShare();
      }
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
      if (mounted) setState(() => _exporting = null);
    }
  }

  @override
  Widget build(BuildContext context) {
    final patientCount = ref.watch(patientsProvider).valueOrNull?.length ?? 0;
    final cs = Theme.of(context).colorScheme;
    final disabled = patientCount == 0;

    return Scaffold(
      appBar: AppBar(title: const Text('Export')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
        children: [
          // ── Patient count banner ──────────────────────────
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: cs.primaryContainer,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Icon(Icons.people_rounded, color: cs.primary, size: 22),
                const SizedBox(width: 10),
                Text(
                  '$patientCount patient${patientCount == 1 ? '' : 's'} in database',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: cs.onPrimaryContainer),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // ── Full export card ──────────────────────────────
          _ExportCard(
            icon: Icons.table_chart_rounded,
            iconColor: cs.primary,
            title: 'Full Export',
            description:
                'Complete dataset including patient name, address, and phone numbers. For internal use only.',
            includes: const [
              ('👤', 'Patient name, address & phone numbers'),
              ('🩸', 'Pre-chemo exam & blood values'),
              ('💊', 'Post-chemo assessment & CA125'),
              ('🔬', 'Cytoreduction, CT findings, KELIM & CRS'),
              ('📅', 'Relapse follow-up'),
            ],
            excludes: const [],
            buttonLabel: 'Export Full CSV',
            buttonIcon: Icons.ios_share_rounded,
            buttonColor: cs.primary,
            loading: _exporting == _ExportType.full,
            disabled: disabled || _exporting != null,
            onTap: () => _run(_ExportType.full),
          ),

          const SizedBox(height: 16),

          // ── Master report card ────────────────────────────
          _ExportCard(
            icon: Icons.shield_rounded,
            iconColor: const Color(0xFF10B981),
            title: 'Master Report',
            description:
                'De-identified dataset safe for research sharing, submissions, and publications.',
            includes: const [
              ('👤', 'Patient name, serial & hospital number'),
              ('📊', 'Age, parity, menstrual status'),
              ('🩸', 'Pre-chemo exam & blood values'),
              ('💊', 'Post-chemo assessment & CA125'),
              ('🔬', 'Cytoreduction, CT findings, KELIM & CRS'),
              ('📅', 'Relapse follow-up'),
            ],
            excludes: const ['Phone number', 'Address'],
            buttonLabel: 'Export Master Report',
            buttonIcon: Icons.verified_rounded,
            buttonColor: const Color(0xFF10B981),
            loading: _exporting == _ExportType.master,
            disabled: disabled || _exporting != null,
            onTap: () => _run(_ExportType.master),
          ),

          if (disabled) ...[
            const SizedBox(height: 16),
            Center(
              child: Text(
                'Add at least one patient to export.',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: cs.outline),
              ),
            ),
          ],

          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: cs.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Icon(Icons.info_outline_rounded, size: 16, color: cs.outline),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Both formats are CSV files compatible with Excel, SPSS, and R. Empty fields export as blank cells.',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: cs.outline),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── Export option card ────────────────────────────────────

class _ExportCard extends StatelessWidget {
  const _ExportCard({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.description,
    required this.includes,
    required this.excludes,
    required this.buttonLabel,
    required this.buttonIcon,
    required this.buttonColor,
    required this.loading,
    required this.disabled,
    required this.onTap,
  });

  final IconData icon;
  final Color iconColor;
  final String title;
  final String description;
  final List<(String, String)> includes;
  final List<String> excludes;
  final String buttonLabel;
  final IconData buttonIcon;
  final Color buttonColor;
  final bool loading;
  final bool disabled;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: iconColor.withValues(alpha: 0.3),
          width: 1.5,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: iconColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(icon, color: iconColor, size: 22),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(description,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: cs.onSurfaceVariant)),
            const SizedBox(height: 12),

            // Includes
            ...includes.map((item) => Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Row(
                    children: [
                      Text(item.$1,
                          style: const TextStyle(fontSize: 14)),
                      const SizedBox(width: 8),
                      Text(item.$2,
                          style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ),
                )),

            // Excludes (only for master report)
            if (excludes.isNotEmpty) ...[
              const SizedBox(height: 8),
              Wrap(
                spacing: 6,
                runSpacing: 4,
                children: excludes
                    .map((e) => Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: Colors.red.withValues(alpha: 0.08),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color: Colors.red.withValues(alpha: 0.25)),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.block_rounded,
                                  size: 11, color: Colors.red),
                              const SizedBox(width: 4),
                              Text(e,
                                  style: const TextStyle(
                                      fontSize: 11,
                                      color: Colors.red,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                        ))
                    .toList(),
              ),
            ],

            const SizedBox(height: 16),

            // Button
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: disabled ? null : onTap,
                style: FilledButton.styleFrom(
                  backgroundColor: buttonColor,
                  minimumSize: const Size.fromHeight(46),
                ),
                icon: loading
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(
                            strokeWidth: 2, color: Colors.white),
                      )
                    : Icon(buttonIcon),
                label: Text(loading ? 'Preparing…' : buttonLabel),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
