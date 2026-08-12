import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../db/database.dart';
import '../../providers/database_provider.dart';
import '../../widgets/form_section_header.dart';
import '../../widgets/labeled_text_field.dart';
import '../../widgets/checkbox_group.dart';
import '../../widgets/radio_group.dart' show LabeledRadioGroup;

class Form1Registration extends ConsumerStatefulWidget {
  const Form1Registration({super.key, this.patientId});
  final int? patientId; // null = new patient

  @override
  ConsumerState<Form1Registration> createState() => _Form1RegistrationState();
}

class _Form1RegistrationState extends ConsumerState<Form1Registration> {
  final _formKey = GlobalKey<FormState>();
  bool _loading = false;

  // Controllers
  final _serialNo = TextEditingController();
  final _hospitalNo = TextEditingController();
  final _unit = TextEditingController();
  final _name = TextEditingController();
  final _age = TextEditingController();
  final _parity = TextEditingController();
  final _address = TextEditingController();
  final _phone = TextEditingController();
  final _ageMenarche = TextEditingController();
  final _ageMenopause = TextEditingController();
  final _complaintsDetail = TextEditingController();
  final _medicalOthers = TextEditingController();
  final _surgicalOthers = TextEditingController();
  final _familyOthers = TextEditingController();

  // State
  String? _menstrualStatus;
  List<String> _complaints = [];
  List<String> _medHistory = [];
  List<String> _surgHistory = [];
  List<String> _famHistory = [];

  @override
  void initState() {
    super.initState();
    if (widget.patientId != null) _loadExisting();
  }

  Future<void> _loadExisting() async {
    final db = ref.read(databaseProvider);
    final p = await db.getPatient(widget.patientId!);
    setState(() {
      _serialNo.text = p.serialNumber;
      _hospitalNo.text = p.hospitalNumber;
      _unit.text = p.unit;
      _name.text = p.name;
      _age.text = p.age.toString();
      _parity.text = p.parity;
      _address.text = p.address ?? '';
      _phone.text = p.phone ?? '';
      _menstrualStatus = p.menstrualStatus;
      _ageMenarche.text = p.ageAtMenarche?.toString() ?? '';
      _ageMenopause.text = p.ageAtMenopause?.toString() ?? '';
      _complaints = p.presentingComplaints.split(',').where((s) => s.isNotEmpty).toList();
      _complaintsDetail.text = p.complaintsDetails ?? '';
      _medHistory = p.medicalHistory.split(',').where((s) => s.isNotEmpty).toList();
      _medicalOthers.text = p.medicalHistoryOthers ?? '';
      _surgHistory = p.surgicalHistory.split(',').where((s) => s.isNotEmpty).toList();
      _surgicalOthers.text = p.surgicalHistoryOthers ?? '';
      _famHistory = p.familyHistory.split(',').where((s) => s.isNotEmpty).toList();
      _familyOthers.text = p.familyHistoryOthers ?? '';
    });
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _loading = true);

    final db = ref.read(databaseProvider);
    final companion = PatientsCompanion.insert(
      serialNumber: _serialNo.text.trim(),
      hospitalNumber: _hospitalNo.text.trim(),
      unit: _unit.text.trim(),
      name: _name.text.trim(),
      age: int.parse(_age.text.trim()),
      parity: _parity.text.trim(),
      address: Value(_address.text.trim().isEmpty ? null : _address.text.trim()),
      phone: Value(_phone.text.trim().isEmpty ? null : _phone.text.trim()),
      menstrualStatus: _menstrualStatus ?? 'premenopausal',
      ageAtMenarche: Value(int.tryParse(_ageMenarche.text)),
      ageAtMenopause: Value(int.tryParse(_ageMenopause.text)),
      presentingComplaints: _complaints.join(','),
      complaintsDetails: Value(
        _complaintsDetail.text.trim().isEmpty ? null : _complaintsDetail.text.trim(),
      ),
      medicalHistory: _medHistory.join(','),
      medicalHistoryOthers: Value(
        _medicalOthers.text.trim().isEmpty ? null : _medicalOthers.text.trim(),
      ),
      surgicalHistory: _surgHistory.join(','),
      surgicalHistoryOthers: Value(
        _surgicalOthers.text.trim().isEmpty ? null : _surgicalOthers.text.trim(),
      ),
      familyHistory: _famHistory.join(','),
      familyHistoryOthers: Value(
        _familyOthers.text.trim().isEmpty ? null : _familyOthers.text.trim(),
      ),
    );

    if (widget.patientId == null) {
      final newId = await db.insertPatient(companion);
      if (mounted) context.pushReplacement('/patient/$newId');
    } else {
      await db.updatePatient(companion.copyWith(id: Value(widget.patientId!)));
      if (mounted) context.pop();
    }
    setState(() => _loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.patientId == null ? 'New Patient' : 'Edit Registration')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const FormSectionHeader(title: 'Patient Information'),
            LabeledTextField(label: 'Serial Number', controller: _serialNo, required: true),
            LabeledTextField(label: 'Hospital Number', controller: _hospitalNo, required: true),
            LabeledTextField(label: 'Unit', controller: _unit, required: true),
            LabeledTextField(label: 'Name', controller: _name, required: true),
            LabeledTextField(
              label: 'Age (years)',
              controller: _age,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              required: true,
            ),
            LabeledTextField(label: 'Parity', controller: _parity, required: true),
            LabeledTextField(label: 'Address', controller: _address, maxLines: 2),
            LabeledTextField(
              label: 'Phone Number',
              controller: _phone,
              keyboardType: TextInputType.phone,
            ),

            const FormSectionHeader(title: 'Menstrual Status'),
            LabeledRadioGroup(
              label: 'Menstrual Status *',
              options: const ['Premenopausal', 'Postmenopausal'],
              selected: _menstrualStatus,
              onChanged: (v) => setState(() => _menstrualStatus = v?.toLowerCase()),
            ),
            LabeledTextField(
              label: 'Age at Menarche',
              controller: _ageMenarche,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: _menstrualStatus == 'postmenopausal'
                  ? LabeledTextField(
                      key: const ValueKey('menopause'),
                      label: 'Age at Menopause',
                      controller: _ageMenopause,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    )
                  : const SizedBox.shrink(key: ValueKey('none')),
            ),

            const FormSectionHeader(title: 'Presenting Complaints'),
            CheckboxGroup(
              label: 'Select all that apply',
              options: const [
                'Pain',
                'Menstrual Symptoms',
                'Loss of Weight / Appetite',
                'GI Symptoms',
                'Urinary Symptoms',
                'Others',
              ],
              selected: _complaints,
              onChanged: (v) => setState(() => _complaints = v),
            ),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: _complaints.contains('Others')
                  ? LabeledTextField(
                      key: const ValueKey('comp-other'),
                      label: 'Others — specify',
                      controller: _complaintsDetail,
                    )
                  : const SizedBox.shrink(key: ValueKey('none2')),
            ),

            const FormSectionHeader(title: 'Medical History'),
            CheckboxGroup(
              label: 'Select all that apply',
              options: const ['HTN', 'DM', 'TB', 'Hormonal Therapy', 'Others'],
              selected: _medHistory,
              onChanged: (v) => setState(() => _medHistory = v),
            ),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: _medHistory.contains('Others')
                  ? LabeledTextField(
                      key: const ValueKey('med-other'),
                      label: 'Others — specify',
                      controller: _medicalOthers,
                    )
                  : const SizedBox.shrink(key: ValueKey('none3')),
            ),

            const FormSectionHeader(title: 'Surgical History'),
            CheckboxGroup(
              label: 'Select all that apply',
              options: const ['Tubectomy', 'Others'],
              selected: _surgHistory,
              onChanged: (v) => setState(() => _surgHistory = v),
            ),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: _surgHistory.contains('Others')
                  ? LabeledTextField(
                      key: const ValueKey('surg-other'),
                      label: 'Others — specify',
                      controller: _surgicalOthers,
                    )
                  : const SizedBox.shrink(key: ValueKey('none4')),
            ),

            const FormSectionHeader(title: 'Family History of Malignancy'),
            CheckboxGroup(
              label: 'Select all that apply',
              options: const ['Uterine', 'Ovarian', 'Breast', 'Others'],
              selected: _famHistory,
              onChanged: (v) => setState(() => _famHistory = v),
            ),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: _famHistory.contains('Others')
                  ? LabeledTextField(
                      key: const ValueKey('fam-other'),
                      label: 'Others — specify',
                      controller: _familyOthers,
                    )
                  : const SizedBox.shrink(key: ValueKey('none5')),
            ),

            const SizedBox(height: 32),
            FilledButton.icon(
              onPressed: _loading ? null : _save,
              icon: _loading
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                    )
                  : const Icon(Icons.save_rounded),
              label: Text(widget.patientId == null ? 'Save & Continue' : 'Save Changes'),
              style: FilledButton.styleFrom(minimumSize: const Size.fromHeight(50)),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    for (final c in [
      _serialNo,
      _hospitalNo,
      _unit,
      _name,
      _age,
      _parity,
      _address,
      _phone,
      _ageMenarche,
      _ageMenopause,
      _complaintsDetail,
      _medicalOthers,
      _surgicalOthers,
      _familyOthers,
    ]) {
      c.dispose();
    }
    super.dispose();
  }
}
