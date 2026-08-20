import 'dart:async';
import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../db/database.dart';
import '../../providers/database_provider.dart';
import '../../services/sync_service.dart';
import '../../widgets/form_section_header.dart';
import '../../widgets/labeled_text_field.dart';

class Form2PreChemo extends ConsumerStatefulWidget {
  const Form2PreChemo({super.key, required this.patientId});
  final int patientId;

  @override
  ConsumerState<Form2PreChemo> createState() => _Form2PreChemoState();
}

class _Form2PreChemoState extends ConsumerState<Form2PreChemo> {
  bool _loading = false;

  final _height     = TextEditingController();
  final _weight     = TextEditingController();
  final _bmi        = TextEditingController();
  final _pallor     = TextEditingController();
  final _icterus    = TextEditingController();
  final _lymph      = TextEditingController();
  final _abdominal  = TextEditingController();
  final _pelvic     = TextEditingController();
  final _perRectal  = TextEditingController();
  final _otherExam  = TextEditingController();
  final _hb         = TextEditingController();
  final _platelets  = TextEditingController();
  final _totalWbc   = TextEditingController();
  final _albumin    = TextEditingController();
  final _neutrophil = TextEditingController();
  final _lymphocyte = TextEditingController();
  // Read-only — auto-calculated
  final _nlr        = TextEditingController();
  final _plr        = TextEditingController();
  final _sii        = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadExisting();
    _height.addListener(_calcBmi);
    _weight.addListener(_calcBmi);
    _platelets.addListener(_calcInflammatory);
    _totalWbc.addListener(_calcInflammatory);
    _neutrophil.addListener(_calcInflammatory);
    _lymphocyte.addListener(_calcInflammatory);
  }

  void _calcBmi() {
    final h = double.tryParse(_height.text);
    final w = double.tryParse(_weight.text);
    if (h != null && h > 0 && w != null) {
      _bmi.text = (w / ((h / 100) * (h / 100))).toStringAsFixed(1);
    }
  }

  void _calcInflammatory() {
    final plt  = double.tryParse(_platelets.text);
    final wbc  = double.tryParse(_totalWbc.text);
    final neut = double.tryParse(_neutrophil.text);
    final lymp = double.tryParse(_lymphocyte.text);

    if (neut != null && lymp != null && lymp > 0) {
      _nlr.text = (neut / lymp).toStringAsFixed(2);
    } else {
      _nlr.text = '';
    }

    if (plt != null && wbc != null && lymp != null && lymp > 0) {
      final absLymp = (lymp / 100) * wbc;
      _plr.text = absLymp > 0 ? (plt / absLymp).toStringAsFixed(2) : '';
    } else {
      _plr.text = '';
    }

    if (plt != null && neut != null && lymp != null && lymp > 0) {
      _sii.text = (plt * neut / lymp).toStringAsFixed(2);
    } else {
      _sii.text = '';
    }
  }

  Future<void> _loadExisting() async {
    final existing = await ref.read(databaseProvider).getPreChemo(widget.patientId);
    if (existing == null) return;
    setState(() {
      _height.text     = existing.height?.toString() ?? '';
      _weight.text     = existing.weight?.toString() ?? '';
      _bmi.text        = existing.bmi?.toStringAsFixed(1) ?? '';
      _pallor.text     = existing.pallor ?? '';
      _icterus.text    = existing.icterus ?? '';
      _lymph.text      = existing.lymphadenopathy ?? '';
      _abdominal.text  = existing.abdominalExam ?? '';
      _pelvic.text     = existing.pelvicExam ?? '';
      _perRectal.text  = existing.perRectalExam ?? '';
      _otherExam.text  = existing.otherExam ?? '';
      _hb.text         = existing.hemoglobin?.toString() ?? '';
      _platelets.text  = existing.plateletCount?.toString() ?? '';
      _totalWbc.text   = existing.totalWbc?.toString() ?? '';
      _albumin.text    = existing.albumin?.toString() ?? '';
      _neutrophil.text = existing.neutrophil?.toString() ?? '';
      _lymphocyte.text = existing.lymphocyte?.toString() ?? '';
      _nlr.text        = existing.nlr?.toString() ?? '';
      _plr.text        = existing.plr?.toString() ?? '';
      _sii.text        = existing.sii?.toString() ?? '';
    });
  }

  Future<void> _save() async {
    setState(() => _loading = true);
    await ref.read(databaseProvider).upsertPreChemo(
      PreChemoAssessmentsCompanion.insert(
        patientId:       widget.patientId,
        height:          Value(double.tryParse(_height.text)),
        weight:          Value(double.tryParse(_weight.text)),
        bmi:             Value(double.tryParse(_bmi.text)),
        pallor:          Value(_pallor.text.trim().isEmpty ? null : _pallor.text.trim()),
        icterus:         Value(_icterus.text.trim().isEmpty ? null : _icterus.text.trim()),
        lymphadenopathy: Value(_lymph.text.trim().isEmpty ? null : _lymph.text.trim()),
        abdominalExam:   Value(_abdominal.text.trim().isEmpty ? null : _abdominal.text.trim()),
        pelvicExam:      Value(_pelvic.text.trim().isEmpty ? null : _pelvic.text.trim()),
        perRectalExam:   Value(_perRectal.text.trim().isEmpty ? null : _perRectal.text.trim()),
        otherExam:       Value(_otherExam.text.trim().isEmpty ? null : _otherExam.text.trim()),
        hemoglobin:      Value(double.tryParse(_hb.text)),
        plateletCount:   Value(double.tryParse(_platelets.text)),
        totalWbc:        Value(double.tryParse(_totalWbc.text)),
        albumin:         Value(double.tryParse(_albumin.text)),
        neutrophil:      Value(double.tryParse(_neutrophil.text)),
        lymphocyte:      Value(double.tryParse(_lymphocyte.text)),
        nlr:             Value(double.tryParse(_nlr.text)),
        plr:             Value(double.tryParse(_plr.text)),
        sii:             Value(double.tryParse(_sii.text)),
      ),
    );
    unawaited(SyncService.instance.enqueue('pre_chemo', widget.patientId));
    setState(() => _loading = false);
    if (mounted) context.pop();
  }

  Widget _numField(String label, TextEditingController ctrl) => LabeledTextField(
        label: label,
        controller: ctrl,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pre-Chemo Assessment')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const FormSectionHeader(title: 'Clinical Examination'),
          _numField('Height (cm)', _height),
          _numField('Weight (kg)', _weight),
          LabeledTextField(label: 'BMI (kg/m²)', controller: _bmi, readOnly: true),

          const FormSectionHeader(title: 'General Examination'),
          LabeledTextField(label: 'Pallor', controller: _pallor),
          LabeledTextField(label: 'Icterus', controller: _icterus),
          LabeledTextField(label: 'Lymphadenopathy', controller: _lymph),

          const FormSectionHeader(title: 'System Examination'),
          LabeledTextField(label: 'Abdominal Examination', controller: _abdominal, maxLines: 3),
          LabeledTextField(label: 'Pelvic Examination', controller: _pelvic, maxLines: 3),
          LabeledTextField(label: 'Per Rectal Examination', controller: _perRectal, maxLines: 3),
          LabeledTextField(label: 'Other Findings', controller: _otherExam, maxLines: 3),

          const FormSectionHeader(title: 'Blood Investigations — Pre Chemotherapy'),
          _numField('Hemoglobin (g/dL)', _hb),
          _numField('Platelet Count (K/µL)', _platelets),
          _numField('Total WBC (K/µL)', _totalWbc),
          _numField('Albumin (g/dL)', _albumin),
          _numField('Neutrophil (%)', _neutrophil),
          _numField('Lymphocyte (%)', _lymphocyte),
          LabeledTextField(label: 'NLR (auto-calculated)', controller: _nlr, readOnly: true),
          LabeledTextField(label: 'PLR (auto-calculated)', controller: _plr, readOnly: true),
          LabeledTextField(label: 'SII (auto-calculated)', controller: _sii, readOnly: true),

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
    for (final c in [_height, _weight, _bmi, _pallor, _icterus, _lymph, _abdominal, _pelvic, _perRectal, _otherExam, _hb, _platelets, _totalWbc, _albumin, _neutrophil, _lymphocyte, _nlr, _plr, _sii]) {
      c.dispose();
    }
    super.dispose();
  }
}
