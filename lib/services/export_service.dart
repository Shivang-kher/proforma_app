import 'dart:io';
import 'package:csv/csv.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import '../db/database.dart';

class ExportService {
  final AppDatabase db;
  ExportService(this.db);

  static const _headers = [
    // Patient
    'Serial Number', 'Hospital Number', 'Unit', 'Name', 'Age', 'Parity',
    'Address', 'Phone Number(s)', 'Menstrual Status', 'Age at Menarche', 'Age at Menopause',
    'Presenting Complaints', 'Complaints Details',
    'Medical History', 'Medical History Others',
    'Surgical History', 'Surgical History Others',
    'Family History', 'Family History Others',
    'Enrolled On',
    // Pre-chemo
    'Height (cm)', 'Weight (kg)', 'BMI',
    'Pallor', 'Icterus', 'Lymphadenopathy',
    'Abdominal Exam', 'Pelvic Exam', 'Per Rectal Exam', 'Other Exam',
    'Pre Hb', 'Pre Platelets', 'Pre PLR', 'Pre Albumin',
    'Pre Neutrophil', 'Pre Lymphocyte', 'Pre NLR', 'Pre SII',
    // Post-chemo
    'NACT Cycles', 'NACT Dates', 'NACT Nature', 'Second Line', 'FNAC/Ascitic',
    'Complications', 'Need GCSF', 'Need Blood Transfusion',
    'Post Hb', 'Post Platelets', 'Post PLR', 'Post Albumin',
    'Post Neutrophil', 'Post Lymphocyte', 'Post NLR', 'Post SII',
    'CA125 I', 'CA125 II', 'CA125 III',
    // Cytoreduction
    'Chemo Response Score', 'PCI', 'Cytoreductive Level',
    'CT Liver Pre', 'CT Liver Post',
    'CT Gall Bladder Pre', 'CT Gall Bladder Post',
    'CT Spleen Pre', 'CT Spleen Post',
    'CT Pancreas Pre', 'CT Pancreas Post',
    'CT Suprarenals Pre', 'CT Suprarenals Post',
    'CT Kidney Pre', 'CT Kidney Post',
    'CT Bowel Pre', 'CT Bowel Post',
    'CT Aorta IVC Pre', 'CT Aorta IVC Post',
    'CT Urinary Bladder Pre', 'CT Urinary Bladder Post',
    'CT Uterus Ovaries Pre', 'CT Uterus Ovaries Post',
    'CT Lymph Nodes Pre', 'CT Lymph Nodes Post',
    'KELIM Score', 'CRS Omentum', 'CRS Adnexa', 'CRS Other Sites',
    // Relapse
    'Recurrence Date', 'Relapse Type', 'Second Line Need', 'PFI', 'TFI', 'OS',
  ];

  // ── Shared row builder ──────────────────────────────────

  Future<List<dynamic>> _buildRow(
    Patient p, {
    required bool anonymise,
    required Map<int, PreChemoAssessment> preMap,
    required Map<int, PostChemoAssessment> postMap,
    required Map<int, CytoreductionCtFinding> cytoMap,
    required Map<int, RelapseFollowup> relapseMap,
  }) async {
    final pre     = preMap[p.id];
    final post    = postMap[p.id];
    final cyto    = cytoMap[p.id];
    final relapse = relapseMap[p.id];

    return [
      // Patient identity
      p.serialNumber,
      p.hospitalNumber,
      p.unit,
      p.name,
      p.age,
      p.parity,
      anonymise ? '' : (p.address ?? ''),
      anonymise ? '' : (p.phone?.replaceAll('|', ' / ') ?? ''),
      p.menstrualStatus,
      p.ageAtMenarche ?? '',
      p.ageAtMenopause ?? '',
      p.presentingComplaints,
      p.complaintsDetails ?? '',
      p.medicalHistory,
      p.medicalHistoryOthers ?? '',
      p.surgicalHistory,
      p.surgicalHistoryOthers ?? '',
      p.familyHistory,
      p.familyHistoryOthers ?? '',
      DateFormat('yyyy-MM-dd').format(p.createdAt),
      // Pre-chemo
      pre?.height ?? '', pre?.weight ?? '', pre?.bmi ?? '',
      pre?.pallor ?? '', pre?.icterus ?? '', pre?.lymphadenopathy ?? '',
      pre?.abdominalExam ?? '', pre?.pelvicExam ?? '',
      pre?.perRectalExam ?? '', pre?.otherExam ?? '',
      pre?.hemoglobin ?? '', pre?.plateletCount ?? '', pre?.plr ?? '',
      pre?.albumin ?? '', pre?.neutrophil ?? '', pre?.lymphocyte ?? '',
      pre?.nlr ?? '', pre?.sii ?? '',
      // Post-chemo
      post?.nactCycles ?? '', post?.nactDates ?? '', post?.nactNature ?? '',
      post?.secondLine ?? '', post?.fnacAscitic ?? '',
      post?.complications ?? '',
      post?.needGcsf == null ? '' : (post!.needGcsf! ? 'Yes' : 'No'),
      post?.needBloodTransfusion == null
          ? ''
          : (post!.needBloodTransfusion! ? 'Yes' : 'No'),
      post?.hemoglobin ?? '', post?.plateletCount ?? '', post?.plr ?? '',
      post?.albumin ?? '', post?.neutrophil ?? '', post?.lymphocyte ?? '',
      post?.nlr ?? '', post?.sii ?? '',
      post?.ca125Reading1 ?? '', post?.ca125Reading2 ?? '',
      post?.ca125Reading3 ?? '',
      // Cytoreduction
      cyto?.chemoResponseScore ?? '', cyto?.pci ?? '',
      cyto?.cytoreductiveLevel ?? '',
      cyto?.ctLiverPre ?? '', cyto?.ctLiverPost ?? '',
      cyto?.ctGallBladderPre ?? '', cyto?.ctGallBladderPost ?? '',
      cyto?.ctSpleenPre ?? '', cyto?.ctSpleenPost ?? '',
      cyto?.ctPancreasPre ?? '', cyto?.ctPancreasPost ?? '',
      cyto?.ctSuprarenalsPre ?? '', cyto?.ctSuprarenalsPost ?? '',
      cyto?.ctKidneyPre ?? '', cyto?.ctKidneyPost ?? '',
      cyto?.ctBowelPre ?? '', cyto?.ctBowelPost ?? '',
      cyto?.ctAortaIvcPre ?? '', cyto?.ctAortaIvcPost ?? '',
      cyto?.ctUrinaryBladderPre ?? '', cyto?.ctUrinaryBladderPost ?? '',
      cyto?.ctUterusOvariesPre ?? '', cyto?.ctUterusOvariesPost ?? '',
      cyto?.ctLymphNodesPre ?? '', cyto?.ctLymphNodesPost ?? '',
      cyto?.kelimScore ?? '', cyto?.crsOmentum ?? '',
      cyto?.crsAdnexa ?? '', cyto?.crsOtherSites ?? '',
      // Relapse
      relapse?.recurrenceDate != null
          ? DateFormat('yyyy-MM-dd').format(relapse!.recurrenceDate!)
          : '',
      relapse?.relapseType ?? '', relapse?.secondLineNeed ?? '',
      relapse?.pfi ?? '', relapse?.tfi ?? '', relapse?.os ?? '',
    ];
  }

  Future<void> _export({
    required bool anonymise,
    required String filePrefix,
    required String subject,
  }) async {
    final results = await Future.wait([
      db.getAllPatients(),
      db.getAllPreChemos(),
      db.getAllPostChemos(),
      db.getAllCytoreductions(),
      db.getAllRelapses(),
    ]);
    final patients   = results[0] as List<Patient>;
    final preMap     = {for (final r in results[1] as List<PreChemoAssessment>)    r.patientId: r};
    final postMap    = {for (final r in results[2] as List<PostChemoAssessment>)   r.patientId: r};
    final cytoMap    = {for (final r in results[3] as List<CytoreductionCtFinding>) r.patientId: r};
    final relapseMap = {for (final r in results[4] as List<RelapseFollowup>)       r.patientId: r};

    final rows = <List<dynamic>>[_headers];
    for (final p in patients) {
      rows.add(await _buildRow(p,
          anonymise: anonymise,
          preMap: preMap,
          postMap: postMap,
          cytoMap: cytoMap,
          relapseMap: relapseMap));
    }

    final csv = const ListToCsvConverter().convert(rows);
    final dir = await getTemporaryDirectory();
    final timestamp = DateFormat('yyyyMMdd_HHmmss').format(DateTime.now());
    final file = File('${dir.path}/${filePrefix}_$timestamp.csv');
    await file.writeAsString(csv);

    await SharePlus.instance.share(
      ShareParams(
        files: [XFile(file.path, mimeType: 'text/csv')],
        subject: '$subject — $timestamp',
      ),
    );
  }

  // ── Full export (all fields) ────────────────────────────

  Future<void> exportAndShare() => _export(
        anonymise: false,
        filePrefix: 'proforma_full',
        subject: 'Proforma Full Export',
      );

  // ── Master report (de-identified) ──────────────────────

  Future<void> exportMasterAndShare() => _export(
        anonymise: true,
        filePrefix: 'proforma_master',
        subject: 'Proforma Master Report',
      );
}
