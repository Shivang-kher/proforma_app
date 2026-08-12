import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../db/database.dart';
import '../../providers/database_provider.dart';
import '../../widgets/form_section_header.dart';
import '../../widgets/labeled_text_field.dart';
import '../../widgets/radio_group.dart' show LabeledRadioGroup;

class Form3PostChemo extends ConsumerStatefulWidget {
  const Form3PostChemo({super.key, required this.patientId});
  final int patientId;

  @override
  ConsumerState<Form3PostChemo> createState() => _Form3PostChemoState();
}

class _Form3PostChemoState extends ConsumerState<Form3PostChemo> {
  bool _loading = false;

  final _cycles      = TextEditingController();
  final _dates       = TextEditingController();
  final _nature      = TextEditingController();
  final _secondLine  = TextEditingController();
  final _fnac        = TextEditingController();
  final _complications = TextEditingController();
  bool? _needGcsf;
  bool? _needBlood;

  final _hb          = TextEditingController();
  final _platelets   = TextEditingController();
  final _plr         = TextEditingController();
  final _albumin     = TextEditingController();
  final _neutrophil  = TextEditingController();
  final _lymphocyte  = TextEditingController();
  final _nlr         = TextEditingController();
  final _sii         = TextEditingController();
  final _ca125_1     = TextEditingController();
  final _ca125_2     = TextEditingController();
  final _ca125_3     = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadExisting();
  }

  Future<void> _loadExisting() async {
    final e = await ref.read(databaseProvider).getPostChemo(widget.patientId);
    if (e == null) return;
    setState(() {
      _cycles.text       = e.nactCycles?.toString() ?? '';
      _dates.text        = e.nactDates ?? '';
      _nature.text       = e.nactNature ?? '';
      _secondLine.text   = e.secondLine ?? '';
      _fnac.text         = e.fnacAscitic ?? '';
      _complications.text = e.complications ?? '';
      _needGcsf  = e.needGcsf;
      _needBlood = e.needBloodTransfusion;
      _hb.text        = e.hemoglobin?.toString() ?? '';
      _platelets.text = e.plateletCount?.toString() ?? '';
      _plr.text       = e.plr?.toString() ?? '';
      _albumin.text   = e.albumin?.toString() ?? '';
      _neutrophil.text = e.neutrophil?.toString() ?? '';
      _lymphocyte.text = e.lymphocyte?.toString() ?? '';
      _nlr.text       = e.nlr?.toString() ?? '';
      _sii.text       = e.sii?.toString() ?? '';
      _ca125_1.text   = e.ca125Reading1?.toString() ?? '';
      _ca125_2.text   = e.ca125Reading2?.toString() ?? '';
      _ca125_3.text   = e.ca125Reading3?.toString() ?? '';
    });
  }

  Future<void> _save() async {
    setState(() => _loading = true);
    await ref.read(databaseProvider).upsertPostChemo(
      PostChemoAssessmentsCompanion.insert(
        patientId:           widget.patientId,
        nactCycles:          Value(int.tryParse(_cycles.text)),
        nactDates:           Value(_dates.text.trim().isEmpty ? null : _dates.text.trim()),
        nactNature:          Value(_nature.text.trim().isEmpty ? null : _nature.text.trim()),
        secondLine:          Value(_secondLine.text.trim().isEmpty ? null : _secondLine.text.trim()),
        fnacAscitic:         Value(_fnac.text.trim().isEmpty ? null : _fnac.text.trim()),
        complications:       Value(_complications.text.trim().isEmpty ? null : _complications.text.trim()),
        needGcsf:            Value(_needGcsf),
        needBloodTransfusion: Value(_needBlood),
        hemoglobin:          Value(double.tryParse(_hb.text)),
        plateletCount:       Value(double.tryParse(_platelets.text)),
        plr:                 Value(double.tryParse(_plr.text)),
        albumin:             Value(double.tryParse(_albumin.text)),
        neutrophil:          Value(double.tryParse(_neutrophil.text)),
        lymphocyte:          Value(double.tryParse(_lymphocyte.text)),
        nlr:                 Value(double.tryParse(_nlr.text)),
        sii:                 Value(double.tryParse(_sii.text)),
        ca125Reading1:       Value(double.tryParse(_ca125_1.text)),
        ca125Reading2:       Value(double.tryParse(_ca125_2.text)),
        ca125Reading3:       Value(double.tryParse(_ca125_3.text)),
      ),
    );
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
      appBar: AppBar(title: const Text('Post-Chemo Assessment')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const FormSectionHeader(title: 'Chemotherapy Cycle (NACT)'),
          LabeledTextField(
            label: 'Number of Cycles',
            controller: _cycles,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
          LabeledTextField(label: 'Date of Each Cycle', controller: _dates),
          LabeledTextField(label: 'Nature of Cycle', controller: _nature),
          LabeledTextField(label: 'Second Line', controller: _secondLine),
          LabeledTextField(label: 'FNAC / Ascitic Cytology', controller: _fnac),

          const FormSectionHeader(title: 'Complications & Supportive Care'),
          LabeledTextField(label: 'Complications', controller: _complications, maxLines: 3),
          LabeledRadioGroup(
            label: 'Need for GCSF',
            options: const ['Yes', 'No'],
            selected: _needGcsf == null ? null : (_needGcsf! ? 'Yes' : 'No'),
            onChanged: (v) => setState(() => _needGcsf = v == 'Yes'),
          ),
          LabeledRadioGroup(
            label: 'Need for Blood Transfusion',
            options: const ['Yes', 'No'],
            selected: _needBlood == null ? null : (_needBlood! ? 'Yes' : 'No'),
            onChanged: (v) => setState(() => _needBlood = v == 'Yes'),
          ),

          const FormSectionHeader(title: 'Blood Investigations — Post Chemotherapy'),
          _numField('Hemoglobin (g/dL)', _hb),
          _numField('Platelet Count', _platelets),
          _numField('Platelet Lymphocytic Ratio (PLR)', _plr),
          _numField('Albumin (g/dL)', _albumin),
          _numField('Neutrophil', _neutrophil),
          _numField('Lymphocyte', _lymphocyte),
          _numField('Neutrophilic Lymphocytic Ratio (NLR)', _nlr),
          _numField('Systemic Inflammatory Index (SII)', _sii),

          const FormSectionHeader(title: 'CA 125 Levels'),
          _numField('CA 125 — Reading I', _ca125_1),
          _numField('CA 125 — Reading II', _ca125_2),
          _numField('CA 125 — Reading III', _ca125_3),

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
    for (final c in [_cycles, _dates, _nature, _secondLine, _fnac, _complications, _hb, _platelets, _plr, _albumin, _neutrophil, _lymphocyte, _nlr, _sii, _ca125_1, _ca125_2, _ca125_3]) {
      c.dispose();
    }
    super.dispose();
  }
}
