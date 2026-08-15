import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../db/database.dart';

final databaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(db.close);
  return db;
});

final patientsProvider = StreamProvider<List<Patient>>((ref) {
  return ref.watch(databaseProvider).watchAllPatients();
});

// Refreshes whenever the patients list changes so filters stay accurate.
final completionMapProvider =
    FutureProvider<Map<int, ({bool pre, bool post, bool cyto, bool relapse})>>(
        (ref) async {
  ref.watch(patientsProvider); // invalidate when patients stream emits
  return ref.read(databaseProvider).getCompletionMap();
});
