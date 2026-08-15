import 'dart:async';
import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../db/database.dart';
import '../../providers/database_provider.dart';
import '../../services/sync_service.dart';
import '../../widgets/form_section_header.dart';
import '../../widgets/labeled_text_field.dart';

class Form5Relapse extends ConsumerStatefulWidget {
  const Form5Relapse({super.key, required this.patientId});
  final int patientId;

  @override
  ConsumerState<Form5Relapse> createState() => _Form5RelapseState();
}

class _Form5RelapseState extends ConsumerState<Form5Relapse> {
  bool _loading = false;
  DateTime? _recurrenceDate;

  final _relapseType    = TextEditingController();
  final _secondLineNeed = TextEditingController();
  final _pfi            = TextEditingController();
  final _tfi            = TextEditingController();
  final _os             = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadExisting();
  }

  Future<void> _loadExisting() async {
    final e = await ref.read(databaseProvider).getRelapse(widget.patientId);
    if (e == null) return;
    setState(() {
      _recurrenceDate    = e.recurrenceDate;
      _relapseType.text  = e.relapseType ?? '';
      _secondLineNeed.text = e.secondLineNeed ?? '';
      _pfi.text          = e.pfi ?? '';
      _tfi.text          = e.tfi ?? '';
      _os.text           = e.os ?? '';
    });
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _recurrenceDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (picked != null) setState(() => _recurrenceDate = picked);
  }

  Future<void> _save() async {
    setState(() => _loading = true);
    await ref.read(databaseProvider).upsertRelapse(
      RelapseFollowupsCompanion.insert(
        patientId:      widget.patientId,
        recurrenceDate: Value(_recurrenceDate),
        relapseType:    Value(_relapseType.text.trim().isEmpty ? null : _relapseType.text.trim()),
        secondLineNeed: Value(_secondLineNeed.text.trim().isEmpty ? null : _secondLineNeed.text.trim()),
        pfi:            Value(_pfi.text.trim().isEmpty ? null : _pfi.text.trim()),
        tfi:            Value(_tfi.text.trim().isEmpty ? null : _tfi.text.trim()),
        os:             Value(_os.text.trim().isEmpty ? null : _os.text.trim()),
      ),
    );
    unawaited(SyncService.instance.enqueue('relapse', widget.patientId));
    setState(() => _loading = false);
    if (mounted) context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Relapse Follow-up')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const FormSectionHeader(title: 'Relapse Details'),

          // Date picker field
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Recurrence Date',
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w600)),
                const SizedBox(height: 6),
                InkWell(
                  onTap: _pickDate,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                    decoration: BoxDecoration(
                      border: Border.all(color: Theme.of(context).colorScheme.outlineVariant),
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).colorScheme.surface,
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.calendar_today_rounded,
                            size: 18, color: Theme.of(context).colorScheme.primary),
                        const SizedBox(width: 10),
                        Text(
                          _recurrenceDate != null
                              ? DateFormat('d MMMM yyyy').format(_recurrenceDate!)
                              : 'Select date',
                          style: TextStyle(
                            color: _recurrenceDate != null
                                ? Theme.of(context).colorScheme.onSurface
                                : Theme.of(context).colorScheme.outline,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          LabeledTextField(label: 'Type of Relapse', controller: _relapseType),
          LabeledTextField(
            label: 'Need for Second Line Chemotherapy / Surgical Cytoreduction',
            controller: _secondLineNeed,
            maxLines: 2,
          ),
          LabeledTextField(label: 'PFI (Platinum Free Interval)', controller: _pfi),
          LabeledTextField(label: 'TFI (Treatment Free Interval)', controller: _tfi),
          LabeledTextField(label: 'Survival — OS (Overall Survival)', controller: _os),

          const SizedBox(height: 32),
          FilledButton.icon(
            onPressed: _loading ? null : _save,
            icon: _loading
                ? const SizedBox(width: 18, height: 18, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                : const Icon(Icons.save_rounded),
            label: const Text('Save'),
            style: FilledButton.styleFrom(minimumSize: const Size.fromHeight(50)),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  @override
  void dispose() {
    for (final c in [_relapseType, _secondLineNeed, _pfi, _tfi, _os]) {
      c.dispose();
    }
    super.dispose();
  }
}
