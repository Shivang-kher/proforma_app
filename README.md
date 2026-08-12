# Proforma App

iOS app for clinical data collection — PGRMC gynecological oncology thesis (Dr. Shivang Kher).

Built with Flutter + Drift (SQLite). All data is stored locally on-device; no backend or internet connection required.

## What it does

- **Enrol patients** across 5 linked forms: Registration, Pre-Chemo Assessment, Post-Chemo Assessment, Cytoreduction & CT Findings, Relapse Follow-up
- **Export** all patient data as a single CSV (87 columns, one row per patient) — share to Files, AirDrop, or email
- **Reminders** — schedule a daily local notification per patient for follow-up
- **Insights** — Hb pre/post bar chart, CA125 trend line chart, presenting complaints pie chart

## Setup

Requires Flutter 3.x and Xcode with an iOS simulator or device.

```bash
flutter pub get
cd ios && pod install
flutter run
```

After any change to `lib/db/database.dart`:

```bash
dart run build_runner build
```

See `Makefile` for all available shortcuts (`make help`).

## Tech stack

| Concern | Package |
|---|---|
| Database | Drift (SQLite) + `sqlite3_flutter_libs` |
| State | flutter_riverpod |
| Navigation | go_router |
| Export | csv + share_plus |
| Notifications | flutter_local_notifications + flutter_timezone |
| Charts | fl_chart |

## Data model

```
Patient (1)
  └── PreChemoAssessment  (0–1)
  └── PostChemoAssessment (0–1)
  └── CytoreductionCtFinding (0–1)
  └── RelapseFollowup     (0–1, gated on PostChemo)
```

All non-patient forms use upsert — saving again overwrites, never duplicates.
