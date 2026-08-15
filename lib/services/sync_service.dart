import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
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
    await _db!.enqueueSync(table, patientId);
    unawaited(_flush());
  }

  Future<void> _flush() async {
    if (_flushing) return;
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
        final p = await db.getPatient(item.patientId);
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
