import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../providers/database_provider.dart';
import '../../db/database.dart';

enum _Filter { all, incomplete, complete }

class PatientListScreen extends ConsumerStatefulWidget {
  const PatientListScreen({super.key});

  @override
  ConsumerState<PatientListScreen> createState() => _PatientListScreenState();
}

class _PatientListScreenState extends ConsumerState<PatientListScreen> {
  String _search = '';
  _Filter _filter = _Filter.all;
  int _page = 0;
  static const _pageSize = 15;

  void _setFilter(_Filter f) => setState(() { _filter = f; _page = 0; });
  void _setSearch(String v) => setState(() { _search = v.toLowerCase(); _page = 0; });

  bool _isComplete(({bool pre, bool post, bool cyto, bool relapse})? c) =>
      c != null && c.pre && c.post && c.cyto && c.relapse;

  @override
  Widget build(BuildContext context) {
    final patientsAsync = ref.watch(patientsProvider);
    final db = ref.watch(databaseProvider);
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Proforma'),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: FilledButton.icon(
              onPressed: () => context.push('/patient/new'),
              icon: const Icon(Icons.person_add_rounded, size: 18),
              label: const Text('New'),
              style: FilledButton.styleFrom(
                visualDensity: VisualDensity.compact,
              ),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
            child: SearchBar(
              hintText: 'Search by name or hospital number…',
              leading: const Icon(Icons.search),
              onChanged: _setSearch,
            ),
          ),
        ),
      ),
      body: patientsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (patients) => FutureBuilder(
          future: db.getCompletionMap(),
          builder: (context, compSnap) {
            final compMap = compSnap.data ?? {};

            // ── Apply search + filter ──────────────────────
            final filtered = patients.where((p) {
              if (_search.isNotEmpty &&
                  !p.name.toLowerCase().contains(_search) &&
                  !p.hospitalNumber.toLowerCase().contains(_search)) {
                return false;
              }
              if (_filter == _Filter.complete) return _isComplete(compMap[p.id]);
              if (_filter == _Filter.incomplete) return !_isComplete(compMap[p.id]);
              return true;
            }).toList();

            final totalPages = max(1, (filtered.length / _pageSize).ceil());
            final safePage = _page.clamp(0, totalPages - 1);
            final pageStart = safePage * _pageSize;
            final pageEnd = min(pageStart + _pageSize, filtered.length);
            final pageItems = filtered.sublist(pageStart, pageEnd);

            final completeCount = patients
                .where((p) => _isComplete(compMap[p.id]))
                .length;
            final incompleteCount = patients.length - completeCount;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ── Stats + filter row ─────────────────────
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
                  child: Row(
                    children: [
                      // Patient count chips
                      _StatChip(
                        label: '${patients.length} total',
                        color: colorScheme.primary,
                      ),
                      const SizedBox(width: 8),
                      _StatChip(
                        label: '$completeCount complete',
                        color: Colors.green,
                      ),
                      const SizedBox(width: 8),
                      _StatChip(
                        label: '$incompleteCount open',
                        color: Colors.orange,
                      ),
                    ],
                  ),
                ),

                // ── Filter chips ───────────────────────────
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 6, 16, 4),
                  child: Row(
                    children: [
                      _FilterChip(
                        label: 'All',
                        selected: _filter == _Filter.all,
                        onTap: () => _setFilter(_Filter.all),
                      ),
                      const SizedBox(width: 8),
                      _FilterChip(
                        label: 'Incomplete',
                        selected: _filter == _Filter.incomplete,
                        onTap: () => _setFilter(_Filter.incomplete),
                      ),
                      const SizedBox(width: 8),
                      _FilterChip(
                        label: 'Complete',
                        selected: _filter == _Filter.complete,
                        onTap: () => _setFilter(_Filter.complete),
                      ),
                    ],
                  ),
                ),

                const Divider(height: 1),

                // ── Patient list ───────────────────────────
                Expanded(
                  child: filtered.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.person_search_rounded,
                                  size: 56,
                                  color: colorScheme.outlineVariant),
                              const SizedBox(height: 12),
                              Text(
                                patients.isEmpty
                                    ? 'No patients yet'
                                    : 'No results',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              if (patients.isEmpty) ...[
                                const SizedBox(height: 6),
                                Text(
                                  'Tap + New Patient to enrol the first patient.',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall,
                                ),
                              ],
                            ],
                          ),
                        )
                      : ListView.separated(
                          padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
                          itemCount: pageItems.length,
                          separatorBuilder: (_, _) =>
                              const SizedBox(height: 8),
                          itemBuilder: (context, i) => _PatientCard(
                            patient: pageItems[i],
                            comp: compMap[pageItems[i].id],
                            onTap: () =>
                                context.push('/patient/${pageItems[i].id}'),
                          ),
                        ),
                ),

                // ── Pagination controls ────────────────────
                if (filtered.length > _pageSize)
                  Container(
                    decoration: BoxDecoration(
                      color: colorScheme.surface,
                      border: Border(
                        top: BorderSide(color: colorScheme.outlineVariant),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Showing ${pageStart + 1}–$pageEnd of ${filtered.length}',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        Row(
                          children: [
                            IconButton.outlined(
                              icon: const Icon(Icons.chevron_left, size: 18),
                              visualDensity: VisualDensity.compact,
                              onPressed: safePage > 0
                                  ? () => setState(() => _page = safePage - 1)
                                  : null,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: Text(
                                '${safePage + 1} / $totalPages',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ),
                            IconButton.outlined(
                              icon: const Icon(Icons.chevron_right, size: 18),
                              visualDensity: VisualDensity.compact,
                              onPressed: safePage < totalPages - 1
                                  ? () => setState(() => _page = safePage + 1)
                                  : null,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}

// ── Widgets ───────────────────────────────────────────────────

class _PhoneRow extends StatelessWidget {
  const _PhoneRow({required this.phone});
  final String phone;

  @override
  Widget build(BuildContext context) {
    final first = phone.split('|').where((s) => s.isNotEmpty).firstOrNull;
    if (first == null) return const SizedBox.shrink();
    final extra = phone.split('|').where((s) => s.isNotEmpty).length - 1;
    return Row(
      children: [
        Icon(Icons.phone_rounded,
            size: 13, color: Theme.of(context).colorScheme.primary),
        const SizedBox(width: 4),
        Text(first,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: Theme.of(context).colorScheme.primary)),
        if (extra > 0)
          Text(' +$extra more',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.outline,
                  )),
        const SizedBox(width: 6),
        InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () => launchUrl(Uri(scheme: 'tel', path: first)),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: Theme.of(context)
                  .colorScheme
                  .primary
                  .withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.call_rounded,
                    size: 11,
                    color: Theme.of(context).colorScheme.primary),
                const SizedBox(width: 3),
                Text('Call',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.primary,
                    )),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _StatChip extends StatelessWidget {
  const _StatChip({required this.label, required this.color});
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip(
      {required this.label, required this.selected, required this.onTap});
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        decoration: BoxDecoration(
          color:
              selected ? colorScheme.primary : colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: selected ? colorScheme.onPrimary : colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}

class _PatientCard extends StatelessWidget {
  const _PatientCard(
      {required this.patient, required this.comp, required this.onTap});
  final Patient patient;
  final ({bool pre, bool post, bool cyto, bool relapse})? comp;
  final VoidCallback onTap;

  bool get _complete =>
      comp != null && comp!.pre && comp!.post && comp!.cyto && comp!.relapse;

  int get _formsComplete {
    if (comp == null) return 1; // registration only
    return 1 +
        (comp!.pre ? 1 : 0) +
        (comp!.post ? 1 : 0) +
        (comp!.cyto ? 1 : 0) +
        (comp!.relapse ? 1 : 0);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: _complete
              ? Colors.green.withValues(alpha: 0.4)
              : colorScheme.outlineVariant,
        ),
      ),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        onTap: onTap,
        leading: CircleAvatar(
          backgroundColor: _complete
              ? Colors.green.withValues(alpha: 0.15)
              : colorScheme.primaryContainer,
          child: Text(
            patient.name.isNotEmpty ? patient.name[0].toUpperCase() : '?',
            style: TextStyle(
              color: _complete ? Colors.green : colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(patient.name,
            style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 2),
            Text(
              'HN: ${patient.hospitalNumber} · ${patient.age}y · ${patient.menstrualStatus}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            if (patient.phone != null && patient.phone!.isNotEmpty) ...[
              const SizedBox(height: 4),
              _PhoneRow(phone: patient.phone!),
            ],
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // Form progress indicator
            Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(5, (i) {
                final filled = i < _formsComplete;
                return Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.only(left: 3),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: filled
                        ? (_complete ? Colors.green : colorScheme.primary)
                        : colorScheme.outlineVariant,
                  ),
                );
              }),
            ),
            const SizedBox(height: 4),
            Text(
              '$_formsComplete/5 forms',
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: _complete ? Colors.green : colorScheme.outline,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            Text(
              DateFormat('d MMM y').format(patient.createdAt),
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: colorScheme.outline,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
