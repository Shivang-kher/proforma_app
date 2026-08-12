# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Common commands

```bash
# Dependencies
flutter pub get                        # or: make get
cd ios && pod install                  # or: make pods (run after adding native plugins)

# Code generation (required after editing database.dart)
dart run build_runner build            # or: make gen
dart run build_runner watch            # or: make watch (continuous)

# Run
flutter run                            # auto-selects available device
flutter run -d ios                     # or: make run-ios

# Quality
flutter analyze                        # or: make analyze
dart fix --apply                       # or: make fix

# Clean
flutter clean                          # or: make clean
# Full reset (pods + pub cache): make deep-clean
```

## Architecture

iOS-only Flutter app. No backend — all data is stored locally in SQLite via Drift ORM.

### State & navigation
- **Riverpod** for state management. Providers are hand-written (no `riverpod_generator`). The two core providers live in `lib/providers/database_provider.dart`: `databaseProvider` (plain `Provider<AppDatabase>`) and `patientsProvider` (`StreamProvider` that watches the patients table).
- **go_router** with a `ShellRoute` for the 3-tab bottom nav (Patients / Insights / Export). Full-screen form routes sit outside the `ShellRoute` so they have no bottom bar. Router defined in `lib/router.dart`.

### Database
- `lib/db/database.dart` — single `AppDatabase` class with 5 Drift tables: `Patients`, `PreChemoAssessments`, `PostChemoAssessments`, `CytoreductionCtFindings`, `RelapseFollowups`.
- `lib/db/database.g.dart` — **auto-generated**, do not edit. Regenerate with `make gen` after any schema change.
- All non-patient forms use `insertOnConflictUpdate` (upsert) so re-saving updates rather than duplicates.
- Incrementing `schemaVersion` and writing a `migration` is required for any table schema change on an existing install.

### Forms flow
One patient → 5 linked forms, each a separate screen:
1. Registration (`form1_registration.dart`) — creates the `Patient` row; required fields validated.
2. Pre-Chemo Assessment (`form2_pre_chemo.dart`) — BMI auto-calculated from height/weight listeners.
3. Post-Chemo Assessment (`form3_post_chemo.dart`)
4. Cytoreduction & CT Findings (`form4_cytoreduction.dart`) — dynamic controllers per organ (11 organs × pre/post).
5. Relapse Follow-up (`form5_relapse.dart`) — gated until Post-Chemo is filled.

Skip logic (conditional fields) uses `AnimatedSwitcher` + `setState`, not a form framework.

### Services
- `lib/services/export_service.dart` — builds an 87-column CSV from all patients + linked forms and triggers the iOS share sheet via `share_plus`.
- `lib/services/notification_service.dart` — wraps `flutter_local_notifications`. Uses `flutter_timezone` to resolve the device's real timezone before scheduling. Reminders are daily repeating (`matchDateTimeComponents: DateTimeComponents.time`), keyed by `patientId` as the notification ID. `testIn5Seconds()` is a dev helper for simulator testing.

### Widgets
Reusable form widgets in `lib/widgets/`:
- `LabeledTextField` — supports a `required: bool` flag that wires a validator.
- `LabeledRadioGroup` — named with `Labeled` prefix to avoid conflict with Flutter Material's own `RadioGroup`.
- `CheckboxGroup` — `FilterChip`-based multi-select.

### Insights screen
`lib/screens/insights/insights_screen.dart` loads all patients + pre/post chemo rows in a single `Future.wait`, computes three derived datasets inline (`hbPairs`, `ca125Trends`, `complaintCounts`), and renders them with `fl_chart`: grouped bar chart (Hb pre/post), line chart (CA125 readings I–III), and pie chart (presenting complaints).

## Key constraints
- **iOS only** — project was scaffolded with `--platforms ios`. Do not add Android/web targets without coordinating pod and permission changes.
- `flutter_local_notifications` uses CocoaPods (not Swift Package Manager). After adding or updating it, run `make pods`.
- Notifications require `WidgetsFlutterBinding.ensureInitialized()` before `runApp` — already present in `main.dart`.
- The `database.g.dart` file must be committed; it is not generated in CI.
