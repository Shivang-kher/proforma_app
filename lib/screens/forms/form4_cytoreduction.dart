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

class Form4Cytoreduction extends ConsumerStatefulWidget {
  const Form4Cytoreduction({super.key, required this.patientId});
  final int patientId;

  @override
  ConsumerState<Form4Cytoreduction> createState() => _Form4CytoreductionState();
}

class _Form4CytoreductionState extends ConsumerState<Form4Cytoreduction> {
  bool _loading = false;

  final _crs        = TextEditingController();
  final _pci        = TextEditingController();
  final _cytoLevel  = TextEditingController();
  final _kelim      = TextEditingController();
  final _crsOmentum = TextEditingController();
  final _crsAdnexa  = TextEditingController();
  final _crsOther   = TextEditingController();

  // CT organ controllers: [organKey] -> {pre, post}
  static const _organs = [
    ('liver',           'Liver'),
    ('gallBladder',     'Gall Bladder'),
    ('spleen',          'Spleen'),
    ('pancreas',        'Pancreas'),
    ('suprarenals',     'Suprarenals'),
    ('kidney',          'Kidney'),
    ('bowel',           'Bowel'),
    ('aortaIvc',        'Aorta and IVC'),
    ('urinaryBladder',  'Urinary Bladder'),
    ('uterusOvaries',   'Uterus and Ovaries'),
    ('lymphNodes',      'Lymph Nodes'),
  ];

  late final Map<String, TextEditingController> _ctPre;
  late final Map<String, TextEditingController> _ctPost;

  @override
  void initState() {
    super.initState();
    _ctPre  = {for (final (k, _) in _organs) k: TextEditingController()};
    _ctPost = {for (final (k, _) in _organs) k: TextEditingController()};
    _loadExisting();
  }

  Future<void> _loadExisting() async {
    final e = await ref.read(databaseProvider).getCytoreduction(widget.patientId);
    if (e == null) return;
    setState(() {
      _crs.text       = e.chemoResponseScore ?? '';
      _pci.text       = e.pci?.toString() ?? '';
      _cytoLevel.text = e.cytoreductiveLevel ?? '';
      _kelim.text     = e.kelimScore?.toString() ?? '';
      _crsOmentum.text = e.crsOmentum ?? '';
      _crsAdnexa.text  = e.crsAdnexa ?? '';
      _crsOther.text   = e.crsOtherSites ?? '';

      _ctPre['liver']!.text          = e.ctLiverPre ?? '';
      _ctPost['liver']!.text         = e.ctLiverPost ?? '';
      _ctPre['gallBladder']!.text    = e.ctGallBladderPre ?? '';
      _ctPost['gallBladder']!.text   = e.ctGallBladderPost ?? '';
      _ctPre['spleen']!.text         = e.ctSpleenPre ?? '';
      _ctPost['spleen']!.text        = e.ctSpleenPost ?? '';
      _ctPre['pancreas']!.text       = e.ctPancreasPre ?? '';
      _ctPost['pancreas']!.text      = e.ctPancreasPost ?? '';
      _ctPre['suprarenals']!.text    = e.ctSuprarenalsPre ?? '';
      _ctPost['suprarenals']!.text   = e.ctSuprarenalsPost ?? '';
      _ctPre['kidney']!.text         = e.ctKidneyPre ?? '';
      _ctPost['kidney']!.text        = e.ctKidneyPost ?? '';
      _ctPre['bowel']!.text          = e.ctBowelPre ?? '';
      _ctPost['bowel']!.text         = e.ctBowelPost ?? '';
      _ctPre['aortaIvc']!.text       = e.ctAortaIvcPre ?? '';
      _ctPost['aortaIvc']!.text      = e.ctAortaIvcPost ?? '';
      _ctPre['urinaryBladder']!.text = e.ctUrinaryBladderPre ?? '';
      _ctPost['urinaryBladder']!.text = e.ctUrinaryBladderPost ?? '';
      _ctPre['uterusOvaries']!.text  = e.ctUterusOvariesPre ?? '';
      _ctPost['uterusOvaries']!.text = e.ctUterusOvariesPost ?? '';
      _ctPre['lymphNodes']!.text     = e.ctLymphNodesPre ?? '';
      _ctPost['lymphNodes']!.text    = e.ctLymphNodesPost ?? '';
    });
  }

  String? _nullIfEmpty(String s) => s.trim().isEmpty ? null : s.trim();

  Future<void> _save() async {
    setState(() => _loading = true);
    await ref.read(databaseProvider).upsertCytoreduction(
      CytoreductionCtFindingsCompanion.insert(
        patientId:             widget.patientId,
        chemoResponseScore:    Value(_nullIfEmpty(_crs.text)),
        pci:                   Value(double.tryParse(_pci.text)),
        cytoreductiveLevel:    Value(_nullIfEmpty(_cytoLevel.text)),
        kelimScore:            Value(double.tryParse(_kelim.text)),
        crsOmentum:            Value(_nullIfEmpty(_crsOmentum.text)),
        crsAdnexa:             Value(_nullIfEmpty(_crsAdnexa.text)),
        crsOtherSites:         Value(_nullIfEmpty(_crsOther.text)),
        ctLiverPre:            Value(_nullIfEmpty(_ctPre['liver']!.text)),
        ctLiverPost:           Value(_nullIfEmpty(_ctPost['liver']!.text)),
        ctGallBladderPre:      Value(_nullIfEmpty(_ctPre['gallBladder']!.text)),
        ctGallBladderPost:     Value(_nullIfEmpty(_ctPost['gallBladder']!.text)),
        ctSpleenPre:           Value(_nullIfEmpty(_ctPre['spleen']!.text)),
        ctSpleenPost:          Value(_nullIfEmpty(_ctPost['spleen']!.text)),
        ctPancreasPre:         Value(_nullIfEmpty(_ctPre['pancreas']!.text)),
        ctPancreasPost:        Value(_nullIfEmpty(_ctPost['pancreas']!.text)),
        ctSuprarenalsPre:      Value(_nullIfEmpty(_ctPre['suprarenals']!.text)),
        ctSuprarenalsPost:     Value(_nullIfEmpty(_ctPost['suprarenals']!.text)),
        ctKidneyPre:           Value(_nullIfEmpty(_ctPre['kidney']!.text)),
        ctKidneyPost:          Value(_nullIfEmpty(_ctPost['kidney']!.text)),
        ctBowelPre:            Value(_nullIfEmpty(_ctPre['bowel']!.text)),
        ctBowelPost:           Value(_nullIfEmpty(_ctPost['bowel']!.text)),
        ctAortaIvcPre:         Value(_nullIfEmpty(_ctPre['aortaIvc']!.text)),
        ctAortaIvcPost:        Value(_nullIfEmpty(_ctPost['aortaIvc']!.text)),
        ctUrinaryBladderPre:   Value(_nullIfEmpty(_ctPre['urinaryBladder']!.text)),
        ctUrinaryBladderPost:  Value(_nullIfEmpty(_ctPost['urinaryBladder']!.text)),
        ctUterusOvariesPre:    Value(_nullIfEmpty(_ctPre['uterusOvaries']!.text)),
        ctUterusOvariesPost:   Value(_nullIfEmpty(_ctPost['uterusOvaries']!.text)),
        ctLymphNodesPre:       Value(_nullIfEmpty(_ctPre['lymphNodes']!.text)),
        ctLymphNodesPost:      Value(_nullIfEmpty(_ctPost['lymphNodes']!.text)),
      ),
    );
    unawaited(SyncService.instance.enqueue('cytoreduction', widget.patientId));
    setState(() => _loading = false);
    if (mounted) context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cytoreduction & CT Findings')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const FormSectionHeader(title: 'Cytoreductive Details'),
          LabeledTextField(label: 'Chemotherapy Response Score Details', controller: _crs, maxLines: 3),
          LabeledTextField(
            label: 'PCI (Peritoneal Cancer Index)',
            controller: _pci,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))],
          ),
          LabeledTextField(label: 'Level of Cytoreductive Surgery', controller: _cytoLevel),

          const FormSectionHeader(title: 'CT Findings — Pre & Post Chemotherapy'),
          for (final (key, label) in _organs) ...[
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 4),
              child: Text(label,
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
            ),
            Row(
              children: [
                Expanded(child: LabeledTextField(label: 'Pre', controller: _ctPre[key]!)),
                const SizedBox(width: 12),
                Expanded(child: LabeledTextField(label: 'Post', controller: _ctPost[key]!)),
              ],
            ),
          ],

          const FormSectionHeader(title: 'KELIM Score & CRS'),
          LabeledTextField(
            label: 'KELIM Score',
            controller: _kelim,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))],
          ),
          LabeledTextField(label: 'CRS — Omentum', controller: _crsOmentum),
          LabeledTextField(label: 'CRS — Adnexa', controller: _crsAdnexa),
          LabeledTextField(label: 'CRS — Other Tumor Sites', controller: _crsOther),

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
    for (final c in [_crs, _pci, _cytoLevel, _kelim, _crsOmentum, _crsAdnexa, _crsOther]) {
      c.dispose();
    }
    for (final c in [..._ctPre.values, ..._ctPost.values]) {
      c.dispose();
    }
    super.dispose();
  }
}
