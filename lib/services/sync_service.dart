import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:drift/drift.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';
import '../db/database.dart';

class SyncService {
  static final instance = SyncService._();
  SyncService._();

  AppDatabase? _db;
  String? _deviceId;
  StreamSubscription? _connectivitySub;
  bool _flushing = false;

  Future<void> init(AppDatabase db) async {
    _db = db;
    _deviceId = await _getOrCreateDeviceId();
    await _restoreIfNewDevice();
    unawaited(_flush());
    _connectivitySub = Connectivity().onConnectivityChanged.listen((results) {
      if (results.any((r) => r != ConnectivityResult.none)) {
        unawaited(_flush());
      }
    });
  }

  void dispose() => _connectivitySub?.cancel();

  Future<String> _getOrCreateDeviceId() async {
    final prefs = await SharedPreferences.getInstance();
    var id = prefs.getString('proforma_device_id');
    if (id == null) {
      id = const Uuid().v4();
      await prefs.setString('proforma_device_id', id);
    }
    return id;
  }

  // ── Cloud restore (new device onboarding) ──────────────────

  Future<void> _restoreIfNewDevice() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('proforma_cloud_restored') == true) return;

    final count = await _db!.getPatientCount();
    if (count > 0) {
      await prefs.setBool('proforma_cloud_restored', true);
      return;
    }

    try {
      await _restoreFromCloud();
      await prefs.setBool('proforma_cloud_restored', true);
    } catch (_) {
      // Network unavailable or Supabase error — will retry next launch.
    }
  }

  Future<void> _restoreFromCloud() async {
    final client = Supabase.instance.client;
    final db = _db!;

    final patientRows =
        await client.from('patients').select() as List<dynamic>;
    if (patientRows.isEmpty) return;

    final results = await Future.wait([
      client.from('pre_chemo_assessments').select() as Future<dynamic>,
      client.from('post_chemo_assessments').select() as Future<dynamic>,
      client.from('cytoreduction_ct_findings').select() as Future<dynamic>,
      client.from('relapse_followups').select() as Future<dynamic>,
    ]);

    final preRows = results[0] as List<dynamic>;
    final postRows = results[1] as List<dynamic>;
    final cytoRows = results[2] as List<dynamic>;
    final relapseRows = results[3] as List<dynamic>;

    // Deduplicate by hospital_number — keep most recently created row as canonical.
    // All (device_id, local_id) variants for the same hospital_number map to one
    // local patient so child forms from any device are merged correctly.
    final Map<String, List<Map<String, dynamic>>> byHospitalNumber = {};
    for (final raw in patientRows) {
      final row = raw as Map<String, dynamic>;
      final hn = (row['hospital_number'] as String?) ?? '';
      byHospitalNumber.putIfAbsent(hn, () => []).add(row);
    }

    final Map<String, int> idMap = {};

    for (final group in byHospitalNumber.values) {
      // Pick the most recently created entry as the one to insert.
      group.sort((a, b) => _parseDateTime(b['created_at'])
          .compareTo(_parseDateTime(a['created_at'])));
      final canonical = group.first;

      final newId = await db.insertPatient(PatientsCompanion.insert(
        serialNumber: canonical['serial_number'] as String? ?? '',
        hospitalNumber: canonical['hospital_number'] as String? ?? '',
        unit: canonical['unit'] as String? ?? '',
        name: canonical['name'] as String? ?? '',
        age: canonical['age'] as int? ?? 0,
        parity: canonical['parity'] as String? ?? '',
        address: Value(canonical['address'] as String?),
        phone: Value(canonical['phone'] as String?),
        menstrualStatus: canonical['menstrual_status'] as String? ?? '',
        ageAtMenarche: Value(canonical['age_at_menarche'] as int?),
        ageAtMenopause: Value(canonical['age_at_menopause'] as int?),
        presentingComplaints: canonical['presenting_complaints'] as String? ?? '',
        complaintsDetails: Value(canonical['complaints_details'] as String?),
        medicalHistory: canonical['medical_history'] as String? ?? '',
        medicalHistoryOthers: Value(canonical['medical_history_others'] as String?),
        surgicalHistory: canonical['surgical_history'] as String? ?? '',
        surgicalHistoryOthers: Value(canonical['surgical_history_others'] as String?),
        familyHistory: canonical['family_history'] as String? ?? '',
        familyHistoryOthers: Value(canonical['family_history_others'] as String?),
        createdAt: Value(_parseDateTime(canonical['created_at'])),
      ));

      // Map every (device_id, local_id) in this group to the same new local ID.
      for (final row in group) {
        idMap['${row['device_id']}:${row['local_id']}'] = newId;
      }
    }

    for (final raw in preRows) {
      final row = raw as Map<String, dynamic>;
      final localId = idMap['${row['device_id']}:${row['patient_local_id']}'];
      if (localId == null) continue;
      await db.upsertPreChemo(PreChemoAssessmentsCompanion.insert(
        patientId: localId,
        height: Value(_toDouble(row['height'])),
        weight: Value(_toDouble(row['weight'])),
        bmi: Value(_toDouble(row['bmi'])),
        pallor: Value(row['pallor'] as String?),
        icterus: Value(row['icterus'] as String?),
        lymphadenopathy: Value(row['lymphadenopathy'] as String?),
        abdominalExam: Value(row['abdominal_exam'] as String?),
        pelvicExam: Value(row['pelvic_exam'] as String?),
        perRectalExam: Value(row['per_rectal_exam'] as String?),
        otherExam: Value(row['other_exam'] as String?),
        hemoglobin: Value(_toDouble(row['hemoglobin'])),
        plateletCount: Value(_toDouble(row['platelet_count'])),
        plr: Value(_toDouble(row['plr'])),
        albumin: Value(_toDouble(row['albumin'])),
        neutrophil: Value(_toDouble(row['neutrophil'])),
        lymphocyte: Value(_toDouble(row['lymphocyte'])),
        nlr: Value(_toDouble(row['nlr'])),
        sii: Value(_toDouble(row['sii'])),
        recordedAt: Value(_parseDateTime(row['recorded_at'])),
      ));
    }

    for (final raw in postRows) {
      final row = raw as Map<String, dynamic>;
      final localId = idMap['${row['device_id']}:${row['patient_local_id']}'];
      if (localId == null) continue;
      await db.upsertPostChemo(PostChemoAssessmentsCompanion.insert(
        patientId: localId,
        nactCycles: Value(row['nact_cycles'] as int?),
        nactDates: Value(row['nact_dates'] as String?),
        nactNature: Value(row['nact_nature'] as String?),
        secondLine: Value(row['second_line'] as String?),
        fnacAscitic: Value(row['fnac_ascitic'] as String?),
        complications: Value(row['complications'] as String?),
        needGcsf: Value(row['need_gcsf'] as bool?),
        needBloodTransfusion: Value(row['need_blood_transfusion'] as bool?),
        hemoglobin: Value(_toDouble(row['hemoglobin'])),
        plateletCount: Value(_toDouble(row['platelet_count'])),
        plr: Value(_toDouble(row['plr'])),
        albumin: Value(_toDouble(row['albumin'])),
        neutrophil: Value(_toDouble(row['neutrophil'])),
        lymphocyte: Value(_toDouble(row['lymphocyte'])),
        nlr: Value(_toDouble(row['nlr'])),
        sii: Value(_toDouble(row['sii'])),
        ca125Reading1: Value(_toDouble(row['ca125_reading1'])),
        ca125Reading2: Value(_toDouble(row['ca125_reading2'])),
        ca125Reading3: Value(_toDouble(row['ca125_reading3'])),
        recordedAt: Value(_parseDateTime(row['recorded_at'])),
      ));
    }

    for (final raw in cytoRows) {
      final row = raw as Map<String, dynamic>;
      final localId = idMap['${row['device_id']}:${row['patient_local_id']}'];
      if (localId == null) continue;
      await db.upsertCytoreduction(CytoreductionCtFindingsCompanion.insert(
        patientId: localId,
        chemoResponseScore: Value(row['chemo_response_score'] as String?),
        pci: Value(_toDouble(row['pci'])),
        cytoreductiveLevel: Value(row['cytoreductive_level'] as String?),
        ctLiverPre: Value(row['ct_liver_pre'] as String?),
        ctLiverPost: Value(row['ct_liver_post'] as String?),
        ctGallBladderPre: Value(row['ct_gall_bladder_pre'] as String?),
        ctGallBladderPost: Value(row['ct_gall_bladder_post'] as String?),
        ctSpleenPre: Value(row['ct_spleen_pre'] as String?),
        ctSpleenPost: Value(row['ct_spleen_post'] as String?),
        ctPancreasPre: Value(row['ct_pancreas_pre'] as String?),
        ctPancreasPost: Value(row['ct_pancreas_post'] as String?),
        ctSuprarenalsPre: Value(row['ct_suprarenals_pre'] as String?),
        ctSuprarenalsPost: Value(row['ct_suprarenals_post'] as String?),
        ctKidneyPre: Value(row['ct_kidney_pre'] as String?),
        ctKidneyPost: Value(row['ct_kidney_post'] as String?),
        ctBowelPre: Value(row['ct_bowel_pre'] as String?),
        ctBowelPost: Value(row['ct_bowel_post'] as String?),
        ctAortaIvcPre: Value(row['ct_aorta_ivc_pre'] as String?),
        ctAortaIvcPost: Value(row['ct_aorta_ivc_post'] as String?),
        ctUrinaryBladderPre: Value(row['ct_urinary_bladder_pre'] as String?),
        ctUrinaryBladderPost: Value(row['ct_urinary_bladder_post'] as String?),
        ctUterusOvariesPre: Value(row['ct_uterus_ovaries_pre'] as String?),
        ctUterusOvariesPost: Value(row['ct_uterus_ovaries_post'] as String?),
        ctLymphNodesPre: Value(row['ct_lymph_nodes_pre'] as String?),
        ctLymphNodesPost: Value(row['ct_lymph_nodes_post'] as String?),
        kelimScore: Value(_toDouble(row['kelim_score'])),
        crsOmentum: Value(row['crs_omentum'] as String?),
        crsAdnexa: Value(row['crs_adnexa'] as String?),
        crsOtherSites: Value(row['crs_other_sites'] as String?),
        recordedAt: Value(_parseDateTime(row['recorded_at'])),
      ));
    }

    for (final raw in relapseRows) {
      final row = raw as Map<String, dynamic>;
      final localId = idMap['${row['device_id']}:${row['patient_local_id']}'];
      if (localId == null) continue;
      await db.upsertRelapse(RelapseFollowupsCompanion.insert(
        patientId: localId,
        recurrenceDate: Value(_parseDateTimeNullable(row['recurrence_date'])),
        relapseType: Value(row['relapse_type'] as String?),
        secondLineNeed: Value(row['second_line_need'] as String?),
        pfi: Value(row['pfi'] as String?),
        tfi: Value(row['tfi'] as String?),
        os: Value(row['os'] as String?),
        recordedAt: Value(_parseDateTime(row['recorded_at'])),
      ));
    }
  }

  double? _toDouble(dynamic v) => (v as num?)?.toDouble();

  DateTime _parseDateTime(dynamic v) =>
      v != null ? DateTime.parse(v as String) : DateTime.now();

  DateTime? _parseDateTimeNullable(dynamic v) =>
      v != null ? DateTime.parse(v as String) : null;

  // ── Cloud push (outbound sync) ─────────────────────────────

  Future<void> deleteFromCloud(int patientId) async {
    if (_deviceId == null) return;
    final client = Supabase.instance.client;
    final did = _deviceId!;
    try {
      await client.from('pre_chemo_assessments').delete().match({'device_id': did, 'patient_local_id': patientId});
      await client.from('post_chemo_assessments').delete().match({'device_id': did, 'patient_local_id': patientId});
      await client.from('cytoreduction_ct_findings').delete().match({'device_id': did, 'patient_local_id': patientId});
      await client.from('relapse_followups').delete().match({'device_id': did, 'patient_local_id': patientId});
      await client.from('patients').delete().match({'device_id': did, 'local_id': patientId});
    } catch (_) {
      // Best-effort — local record is already gone.
    }
  }

  Future<void> enqueue(String table, int patientId) async {
    if (_db == null) return;
    await _db!.enqueueSync(table, patientId);
    unawaited(_flush());
  }

  Future<void> _flush() async {
    if (_db == null || _flushing) return;
    _flushing = true;
    try {
      final pending = await _db!.getPendingSync();
      for (final item in pending) {
        try {
          await _push(item);
          await _db!.markSyncDone(item.id);
        } catch (_) {
          // Network unavailable — leave in queue for next flush.
        }
      }
    } finally {
      _flushing = false;
    }
  }

  Future<void> _push(SyncQueueData item) async {
    final client = Supabase.instance.client;
    final did = _deviceId!;
    final db = _db!;

    switch (item.syncTable) {
      case 'patients':
        final p = await db.getPatientOrNull(item.patientId);
        if (p == null) return;
        await client.from('patients').upsert({
          'device_id': did,
          'local_id': p.id,
          'serial_number': p.serialNumber,
          'hospital_number': p.hospitalNumber,
          'unit': p.unit,
          'name': p.name,
          'age': p.age,
          'parity': p.parity,
          'address': p.address,
          'phone': p.phone,
          'menstrual_status': p.menstrualStatus,
          'age_at_menarche': p.ageAtMenarche,
          'age_at_menopause': p.ageAtMenopause,
          'presenting_complaints': p.presentingComplaints,
          'complaints_details': p.complaintsDetails,
          'medical_history': p.medicalHistory,
          'medical_history_others': p.medicalHistoryOthers,
          'surgical_history': p.surgicalHistory,
          'surgical_history_others': p.surgicalHistoryOthers,
          'family_history': p.familyHistory,
          'family_history_others': p.familyHistoryOthers,
          'created_at': p.createdAt.toIso8601String(),
        });

      case 'pre_chemo':
        final r = await db.getPreChemo(item.patientId);
        if (r == null) return;
        await client.from('pre_chemo_assessments').upsert({
          'device_id': did,
          'patient_local_id': item.patientId,
          'height': r.height,
          'weight': r.weight,
          'bmi': r.bmi,
          'pallor': r.pallor,
          'icterus': r.icterus,
          'lymphadenopathy': r.lymphadenopathy,
          'abdominal_exam': r.abdominalExam,
          'pelvic_exam': r.pelvicExam,
          'per_rectal_exam': r.perRectalExam,
          'other_exam': r.otherExam,
          'hemoglobin': r.hemoglobin,
          'platelet_count': r.plateletCount,
          'plr': r.plr,
          'albumin': r.albumin,
          'neutrophil': r.neutrophil,
          'lymphocyte': r.lymphocyte,
          'nlr': r.nlr,
          'sii': r.sii,
          'recorded_at': r.recordedAt.toIso8601String(),
        });

      case 'post_chemo':
        final r = await db.getPostChemo(item.patientId);
        if (r == null) return;
        await client.from('post_chemo_assessments').upsert({
          'device_id': did,
          'patient_local_id': item.patientId,
          'nact_cycles': r.nactCycles,
          'nact_dates': r.nactDates,
          'nact_nature': r.nactNature,
          'second_line': r.secondLine,
          'fnac_ascitic': r.fnacAscitic,
          'complications': r.complications,
          'need_gcsf': r.needGcsf,
          'need_blood_transfusion': r.needBloodTransfusion,
          'hemoglobin': r.hemoglobin,
          'platelet_count': r.plateletCount,
          'plr': r.plr,
          'albumin': r.albumin,
          'neutrophil': r.neutrophil,
          'lymphocyte': r.lymphocyte,
          'nlr': r.nlr,
          'sii': r.sii,
          'ca125_reading1': r.ca125Reading1,
          'ca125_reading2': r.ca125Reading2,
          'ca125_reading3': r.ca125Reading3,
          'recorded_at': r.recordedAt.toIso8601String(),
        });

      case 'cytoreduction':
        final r = await db.getCytoreduction(item.patientId);
        if (r == null) return;
        await client.from('cytoreduction_ct_findings').upsert({
          'device_id': did,
          'patient_local_id': item.patientId,
          'chemo_response_score': r.chemoResponseScore,
          'pci': r.pci,
          'cytoreductive_level': r.cytoreductiveLevel,
          'ct_liver_pre': r.ctLiverPre,
          'ct_liver_post': r.ctLiverPost,
          'ct_gall_bladder_pre': r.ctGallBladderPre,
          'ct_gall_bladder_post': r.ctGallBladderPost,
          'ct_spleen_pre': r.ctSpleenPre,
          'ct_spleen_post': r.ctSpleenPost,
          'ct_pancreas_pre': r.ctPancreasPre,
          'ct_pancreas_post': r.ctPancreasPost,
          'ct_suprarenals_pre': r.ctSuprarenalsPre,
          'ct_suprarenals_post': r.ctSuprarenalsPost,
          'ct_kidney_pre': r.ctKidneyPre,
          'ct_kidney_post': r.ctKidneyPost,
          'ct_bowel_pre': r.ctBowelPre,
          'ct_bowel_post': r.ctBowelPost,
          'ct_aorta_ivc_pre': r.ctAortaIvcPre,
          'ct_aorta_ivc_post': r.ctAortaIvcPost,
          'ct_urinary_bladder_pre': r.ctUrinaryBladderPre,
          'ct_urinary_bladder_post': r.ctUrinaryBladderPost,
          'ct_uterus_ovaries_pre': r.ctUterusOvariesPre,
          'ct_uterus_ovaries_post': r.ctUterusOvariesPost,
          'ct_lymph_nodes_pre': r.ctLymphNodesPre,
          'ct_lymph_nodes_post': r.ctLymphNodesPost,
          'kelim_score': r.kelimScore,
          'crs_omentum': r.crsOmentum,
          'crs_adnexa': r.crsAdnexa,
          'crs_other_sites': r.crsOtherSites,
          'recorded_at': r.recordedAt.toIso8601String(),
        });

      case 'relapse':
        final r = await db.getRelapse(item.patientId);
        if (r == null) return;
        await client.from('relapse_followups').upsert({
          'device_id': did,
          'patient_local_id': item.patientId,
          'recurrence_date': r.recurrenceDate?.toIso8601String(),
          'relapse_type': r.relapseType,
          'second_line_need': r.secondLineNeed,
          'pfi': r.pfi,
          'tfi': r.tfi,
          'os': r.os,
          'recorded_at': r.recordedAt.toIso8601String(),
        });
    }
  }
}
