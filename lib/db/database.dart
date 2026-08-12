import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';

// ── Tables ────────────────────────────────────────────────

class Patients extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get serialNumber => text()();
  TextColumn get hospitalNumber => text()();
  TextColumn get unit => text()();
  TextColumn get name => text()();
  IntColumn get age => integer()();
  TextColumn get parity => text()();
  TextColumn get address => text().nullable()();
  TextColumn get phone => text().nullable()();
  TextColumn get menstrualStatus => text()(); // 'premenopausal' | 'postmenopausal'
  IntColumn get ageAtMenarche => integer().nullable()();
  IntColumn get ageAtMenopause => integer().nullable()();
  TextColumn get presentingComplaints => text()(); // comma-separated
  TextColumn get complaintsDetails => text().nullable()();
  TextColumn get medicalHistory => text()(); // comma-separated
  TextColumn get medicalHistoryOthers => text().nullable()();
  TextColumn get surgicalHistory => text()(); // comma-separated
  TextColumn get surgicalHistoryOthers => text().nullable()();
  TextColumn get familyHistory => text()(); // comma-separated
  TextColumn get familyHistoryOthers => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

class PreChemoAssessments extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get patientId => integer().references(Patients, #id)();
  RealColumn get height => real().nullable()();
  RealColumn get weight => real().nullable()();
  RealColumn get bmi => real().nullable()();
  TextColumn get pallor => text().nullable()();
  TextColumn get icterus => text().nullable()();
  TextColumn get lymphadenopathy => text().nullable()();
  TextColumn get abdominalExam => text().nullable()();
  TextColumn get pelvicExam => text().nullable()();
  TextColumn get perRectalExam => text().nullable()();
  TextColumn get otherExam => text().nullable()();
  RealColumn get hemoglobin => real().nullable()();
  RealColumn get plateletCount => real().nullable()();
  RealColumn get plr => real().nullable()();
  RealColumn get albumin => real().nullable()();
  RealColumn get neutrophil => real().nullable()();
  RealColumn get lymphocyte => real().nullable()();
  RealColumn get nlr => real().nullable()();
  RealColumn get sii => real().nullable()();
  DateTimeColumn get recordedAt => dateTime().withDefault(currentDateAndTime)();
}

class PostChemoAssessments extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get patientId => integer().references(Patients, #id)();
  IntColumn get nactCycles => integer().nullable()();
  TextColumn get nactDates => text().nullable()();
  TextColumn get nactNature => text().nullable()();
  TextColumn get secondLine => text().nullable()();
  TextColumn get fnacAscitic => text().nullable()();
  TextColumn get complications => text().nullable()();
  BoolColumn get needGcsf => boolean().nullable()();
  BoolColumn get needBloodTransfusion => boolean().nullable()();
  RealColumn get hemoglobin => real().nullable()();
  RealColumn get plateletCount => real().nullable()();
  RealColumn get plr => real().nullable()();
  RealColumn get albumin => real().nullable()();
  RealColumn get neutrophil => real().nullable()();
  RealColumn get lymphocyte => real().nullable()();
  RealColumn get nlr => real().nullable()();
  RealColumn get sii => real().nullable()();
  RealColumn get ca125Reading1 => real().nullable()();
  RealColumn get ca125Reading2 => real().nullable()();
  RealColumn get ca125Reading3 => real().nullable()();
  DateTimeColumn get recordedAt => dateTime().withDefault(currentDateAndTime)();
}

class CytoreductionCtFindings extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get patientId => integer().references(Patients, #id)();
  TextColumn get chemoResponseScore => text().nullable()();
  RealColumn get pci => real().nullable()();
  TextColumn get cytoreductiveLevel => text().nullable()();
  // CT findings — 11 organs × pre/post
  TextColumn get ctLiverPre => text().nullable()();
  TextColumn get ctLiverPost => text().nullable()();
  TextColumn get ctGallBladderPre => text().nullable()();
  TextColumn get ctGallBladderPost => text().nullable()();
  TextColumn get ctSpleenPre => text().nullable()();
  TextColumn get ctSpleenPost => text().nullable()();
  TextColumn get ctPancreasPre => text().nullable()();
  TextColumn get ctPancreasPost => text().nullable()();
  TextColumn get ctSuprarenalsPre => text().nullable()();
  TextColumn get ctSuprarenalsPost => text().nullable()();
  TextColumn get ctKidneyPre => text().nullable()();
  TextColumn get ctKidneyPost => text().nullable()();
  TextColumn get ctBowelPre => text().nullable()();
  TextColumn get ctBowelPost => text().nullable()();
  TextColumn get ctAortaIvcPre => text().nullable()();
  TextColumn get ctAortaIvcPost => text().nullable()();
  TextColumn get ctUrinaryBladderPre => text().nullable()();
  TextColumn get ctUrinaryBladderPost => text().nullable()();
  TextColumn get ctUterusOvariesPre => text().nullable()();
  TextColumn get ctUterusOvariesPost => text().nullable()();
  TextColumn get ctLymphNodesPre => text().nullable()();
  TextColumn get ctLymphNodesPost => text().nullable()();
  RealColumn get kelimScore => real().nullable()();
  TextColumn get crsOmentum => text().nullable()();
  TextColumn get crsAdnexa => text().nullable()();
  TextColumn get crsOtherSites => text().nullable()();
  DateTimeColumn get recordedAt => dateTime().withDefault(currentDateAndTime)();
}

class RelapseFollowups extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get patientId => integer().references(Patients, #id)();
  DateTimeColumn get recurrenceDate => dateTime().nullable()();
  TextColumn get relapseType => text().nullable()();
  TextColumn get secondLineNeed => text().nullable()();
  TextColumn get pfi => text().nullable()();
  TextColumn get tfi => text().nullable()();
  TextColumn get os => text().nullable()();
  DateTimeColumn get recordedAt => dateTime().withDefault(currentDateAndTime)();
}

// ── Database ──────────────────────────────────────────────

@DriftDatabase(tables: [
  Patients,
  PreChemoAssessments,
  PostChemoAssessments,
  CytoreductionCtFindings,
  RelapseFollowups,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // ── Patients ──
  Future<List<Patient>> getAllPatients() => select(patients).get();

  Stream<List<Patient>> watchAllPatients() => select(patients).watch();

  Future<Patient> getPatient(int id) =>
      (select(patients)..where((p) => p.id.equals(id))).getSingle();

  Future<int> insertPatient(PatientsCompanion p) => into(patients).insert(p);

  Future<bool> updatePatient(PatientsCompanion p) => update(patients).replace(p);

  Future<int> deletePatient(int id) =>
      (delete(patients)..where((p) => p.id.equals(id))).go();

  // ── Pre-chemo ──
  Future<PreChemoAssessment?> getPreChemo(int patientId) =>
      (select(preChemoAssessments)..where((t) => t.patientId.equals(patientId)))
          .getSingleOrNull();

  Future<int> upsertPreChemo(PreChemoAssessmentsCompanion entry) =>
      into(preChemoAssessments).insertOnConflictUpdate(entry);

  // ── Post-chemo ──
  Future<PostChemoAssessment?> getPostChemo(int patientId) =>
      (select(postChemoAssessments)..where((t) => t.patientId.equals(patientId)))
          .getSingleOrNull();

  Future<int> upsertPostChemo(PostChemoAssessmentsCompanion entry) =>
      into(postChemoAssessments).insertOnConflictUpdate(entry);

  // ── Cytoreduction / CT ──
  Future<CytoreductionCtFinding?> getCytoreduction(int patientId) =>
      (select(cytoreductionCtFindings)..where((t) => t.patientId.equals(patientId)))
          .getSingleOrNull();

  Future<int> upsertCytoreduction(CytoreductionCtFindingsCompanion entry) =>
      into(cytoreductionCtFindings).insertOnConflictUpdate(entry);

  // ── Bulk queries for insights ──
  Future<List<PreChemoAssessment>> getAllPreChemos() =>
      select(preChemoAssessments).get();

  Future<List<PostChemoAssessment>> getAllPostChemos() =>
      select(postChemoAssessments).get();

  // ── Relapse ──
  Future<RelapseFollowup?> getRelapse(int patientId) =>
      (select(relapseFollowups)..where((t) => t.patientId.equals(patientId)))
          .getSingleOrNull();

  Future<int> upsertRelapse(RelapseFollowupsCompanion entry) =>
      into(relapseFollowups).insertOnConflictUpdate(entry);
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'proforma.db'));
    return NativeDatabase.createInBackground(file);
  });
}
