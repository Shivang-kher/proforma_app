import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../db/database.dart';
import '../../providers/database_provider.dart';
import '../../theme/app_theme.dart';
import '../../widgets/segmented_pill.dart';

class ExerciseLogSheet extends ConsumerStatefulWidget {
  const ExerciseLogSheet({super.key, required this.date, this.existing});
  final DateTime date;
  final ExerciseEntry? existing;

  @override
  ConsumerState<ExerciseLogSheet> createState() => _ExerciseLogSheetState();
}

class _ExerciseLogSheetState extends ConsumerState<ExerciseLogSheet> {
  final _type = TextEditingController();
  final _sets = TextEditingController();
  final _reps = TextEditingController();
  final _weight = TextEditingController();
  final _duration = TextEditingController();
  final _notes = TextEditingController();

  bool _byDuration = false;
  TimeOfDay? _time;
  bool _saving = false;

  static const _suggestions = [
    'Bench Press', 'Squats', 'Pull-ups', 'Deadlift', 'Running',
    'Cycling', 'Plank', 'Rows', 'Lunges', 'Treadmill',
  ];

  @override
  void initState() {
    super.initState();
    final e = widget.existing;
    if (e != null) {
      _type.text = e.exerciseType;
      _notes.text = e.notes ?? '';
      _byDuration = e.durationMinutes != null;
      if (_byDuration) {
        _duration.text = '${e.durationMinutes}';
      } else {
        if (e.sets != null) _sets.text = '${e.sets}';
        if (e.reps != null) _reps.text = '${e.reps}';
      }
      if (e.weightKg != null) {
        final w = e.weightKg!;
        _weight.text = '${w == w.roundToDouble() ? w.toInt() : w}';
      }
      if (e.minuteOfDay != null) {
        _time = TimeOfDay(hour: e.minuteOfDay! ~/ 60, minute: e.minuteOfDay! % 60);
      }
    } else {
      _time = TimeOfDay.now();
    }
  }

  @override
  void dispose() {
    for (final c in [_type, _sets, _reps, _weight, _duration, _notes]) {
      c.dispose();
    }
    super.dispose();
  }

  Future<void> _pickTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: _time ?? TimeOfDay.now(),
    );
    if (picked != null) setState(() => _time = picked);
  }

  Future<void> _save() async {
    final name = _type.text.trim();
    if (name.isEmpty) return;
    setState(() => _saving = true);

    final db = ref.read(databaseProvider);
    final companion = ExerciseEntriesCompanion.insert(
      date: DateTime(widget.date.year, widget.date.month, widget.date.day),
      exerciseType: name,
      sets: Value(_byDuration ? null : int.tryParse(_sets.text)),
      reps: Value(_byDuration ? null : int.tryParse(_reps.text)),
      weightKg: Value(_byDuration ? null : double.tryParse(_weight.text)),
      durationMinutes: Value(_byDuration ? int.tryParse(_duration.text) : null),
      minuteOfDay: Value(_time == null ? null : _time!.hour * 60 + _time!.minute),
      notes: Value(_notes.text.trim().isEmpty ? null : _notes.text.trim()),
    );

    if (widget.existing != null) {
      await db.updateExercise(companion.copyWith(id: Value(widget.existing!.id)));
    } else {
      await db.insertExercise(companion);
    }
    if (mounted) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final insets = MediaQuery.of(context).viewInsets.bottom;

    return Padding(
      padding: EdgeInsets.only(bottom: insets),
      child: Container(
        decoration: const BoxDecoration(
          color: kGround,
          borderRadius: BorderRadius.vertical(top: Radius.circular(kRadSheet)),
        ),
        child: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const _GrabHandle(),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(widget.existing != null ? 'Edit exercise' : 'Log exercise',
                        style: kTitle()),
                    const Spacer(),
                    Text(
                      DateFormat('EEE d MMM').format(widget.date),
                      style: kArchivo(size: 12.5, weight: FontWeight.w600, color: kExercise),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.fromLTRB(20, 18, 20, 0),
                  children: [
                    _Label('Exercise'),
                    TextField(
                      controller: _type,
                      textCapitalization: TextCapitalization.words,
                      style: kArchivo(size: 15, weight: FontWeight.w600),
                      decoration: const InputDecoration(hintText: 'e.g. Bench Press'),
                    ),
                    const SizedBox(height: 9),
                    SizedBox(
                      height: 32,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: _suggestions.length,
                        separatorBuilder: (_, i) => const SizedBox(width: 7),
                        itemBuilder: (_, i) {
                          final s = _suggestions[i];
                          final on = _type.text.trim() == s;
                          return _Pill(
                            label: s,
                            selected: on,
                            accent: kExercise,
                            onTap: () => setState(() => _type.text = s),
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 18),
                    _Label('Measure by'),
                    SegmentedPill(
                      selected: _byDuration ? 1 : 0,
                      options: const [
                        SegmentOption(label: 'Sets & reps'),
                        SegmentOption(label: 'Duration'),
                      ],
                      onSelect: (i) => setState(() => _byDuration = i == 1),
                    ),

                    const SizedBox(height: 14),
                    if (!_byDuration)
                      Row(
                        spacing: 10,
                        children: [
                          Expanded(child: _NumberField(label: 'Sets', controller: _sets)),
                          Expanded(child: _NumberField(label: 'Reps', controller: _reps)),
                          Expanded(child: _NumberField(label: 'Kg', controller: _weight, decimal: true)),
                        ],
                      )
                    else
                      _NumberField(label: 'Minutes', controller: _duration),

                    const SizedBox(height: 14),
                    _RowCard(
                      icon: Icons.schedule_rounded,
                      label: 'Time',
                      value: _time == null ? 'Not set' : _time!.format(context),
                      accent: kExercise,
                      onTap: _pickTime,
                    ),

                    const SizedBox(height: 14),
                    _Label('Notes'),
                    TextField(
                      controller: _notes,
                      style: kArchivo(size: 13.5),
                      decoration: const InputDecoration(hintText: 'Optional'),
                    ),
                    const SizedBox(height: 4),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
                child: Row(
                  spacing: 10,
                  children: [
                    SizedBox(
                      width: 108,
                      child: OutlinedButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('Cancel'),
                      ),
                    ),
                    Expanded(
                      child: FilledButton(
                        onPressed: _saving ? null : _save,
                        style: FilledButton.styleFrom(
                          backgroundColor: kExercise,
                          foregroundColor: Colors.white,
                        ),
                        child: _saving
                            ? const SizedBox(
                                width: 18,
                                height: 18,
                                child: CircularProgressIndicator(
                                    strokeWidth: 2, color: Colors.white),
                              )
                            : const Text('Save entry'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Shared sheet parts ────────────────────────────────────

class _GrabHandle extends StatelessWidget {
  const _GrabHandle();
  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(top: 10),
        width: 38,
        height: 4,
        decoration: BoxDecoration(
          color: kDisabled,
          borderRadius: BorderRadius.circular(kRadPill),
        ),
      );
}

class _Label extends StatelessWidget {
  const _Label(this.text);
  final String text;
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 7),
        child: Text(text, style: kFieldLabel()),
      );
}

class _NumberField extends StatelessWidget {
  const _NumberField({required this.label, required this.controller, this.decimal = false});
  final String label;
  final TextEditingController controller;
  final bool decimal;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _Label(label),
        TextField(
          controller: controller,
          keyboardType: TextInputType.numberWithOptions(decimal: decimal),
          style: kArchivo(size: 18, weight: FontWeight.w700),
        ),
      ],
    );
  }
}

class _Pill extends StatelessWidget {
  const _Pill({
    required this.label,
    required this.selected,
    required this.accent,
    required this.onTap,
  });
  final String label;
  final bool selected;
  final Color accent;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected ? accent : kCard,
      shape: const StadiumBorder(),
      child: InkWell(
        onTap: onTap,
        customBorder: const StadiumBorder(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13),
          child: Center(
            child: Text(
              label,
              style: kArchivo(
                size: 12,
                weight: selected ? FontWeight.w600 : FontWeight.w400,
                color: selected ? Colors.white : kInk,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _RowCard extends StatelessWidget {
  const _RowCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.accent,
    required this.onTap,
  });
  final IconData icon;
  final String label;
  final String value;
  final Color accent;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: kCard,
      borderRadius: BorderRadius.circular(kRadCard),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(kRadCard),
        child: SizedBox(
          height: 52,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Icon(icon, size: 17, color: kMuted),
                const SizedBox(width: 11),
                Expanded(child: Text(label, style: kRow())),
                Text(
                  value,
                  style: kArchivo(size: 14, weight: FontWeight.w600, color: accent),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
