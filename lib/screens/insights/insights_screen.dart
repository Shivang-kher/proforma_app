import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../providers/database_provider.dart';
import '../../db/database.dart';

// ── Data model ────────────────────────────────────────────

class _InsightsData {
  final List<Patient> patients;
  final List<PreChemoAssessment> preChemos;
  final List<PostChemoAssessment> postChemos;
  final Map<int, ({bool pre, bool post, bool cyto, bool relapse})> completionMap;

  const _InsightsData(
      this.patients, this.preChemos, this.postChemos, this.completionMap);

  // ── Hb aggregate stats ──────────────────────────────────
  List<({double pre, double post})> get hbPairs {
    final preMap = {for (final p in preChemos) p.patientId: p.hemoglobin};
    final postMap = {for (final p in postChemos) p.patientId: p.hemoglobin};
    return [
      for (final id in preMap.keys)
        if (preMap[id] != null && postMap[id] != null)
          (pre: preMap[id]!, post: postMap[id]!),
    ];
  }

  double get hbMeanPre => hbPairs.isEmpty
      ? 0
      : hbPairs.map((p) => p.pre).reduce((a, b) => a + b) / hbPairs.length;

  double get hbMeanPost => hbPairs.isEmpty
      ? 0
      : hbPairs.map((p) => p.post).reduce((a, b) => a + b) / hbPairs.length;

  double _sd(List<double> vals) {
    if (vals.length < 2) return 0;
    final m = vals.reduce((a, b) => a + b) / vals.length;
    return sqrt(vals.map((v) => pow(v - m, 2)).reduce((a, b) => a + b) /
        vals.length);
  }

  double get hbSdPre => _sd(hbPairs.map((p) => p.pre).toList());
  double get hbSdPost => _sd(hbPairs.map((p) => p.post).toList());
  int get hbImproved => hbPairs.where((p) => p.post > p.pre).length;
  int get hbDeclined => hbPairs.where((p) => p.post < p.pre).length;

  // ── CA125 distribution ───────────────────────────────────
  Map<String, int> get ca125Buckets {
    final buckets = <String, int>{
      '<100': 0,
      '100–300': 0,
      '300–500': 0,
      '500–1000': 0,
      '>1000': 0,
    };
    for (final p in postChemos) {
      final v = p.ca125Reading1;
      if (v == null) continue;
      if (v < 100) {
        buckets['<100'] = buckets['<100']! + 1;
      } else if (v < 300) {
        buckets['100–300'] = buckets['100–300']! + 1;
      } else if (v < 500) {
        buckets['300–500'] = buckets['300–500']! + 1;
      } else if (v < 1000) {
        buckets['500–1000'] = buckets['500–1000']! + 1;
      } else {
        buckets['>1000'] = buckets['>1000']! + 1;
      }
    }
    return buckets;
  }

  double get ca125Median {
    final vals = postChemos
        .where((p) => p.ca125Reading1 != null)
        .map((p) => p.ca125Reading1!)
        .toList()
      ..sort();
    if (vals.isEmpty) return 0;
    final mid = vals.length ~/ 2;
    return vals.length.isOdd
        ? vals[mid]
        : (vals[mid - 1] + vals[mid]) / 2;
  }

  // ── Complaint counts ─────────────────────────────────────
  Map<String, int> get complaintCounts {
    final counts = <String, int>{};
    for (final p in patients) {
      for (final c in p.presentingComplaints.split(',')) {
        final label = c.trim();
        if (label.isNotEmpty && label != 'None') {
          counts[label] = (counts[label] ?? 0) + 1;
        }
      }
    }
    return Map.fromEntries(
      counts.entries.toList()..sort((a, b) => b.value.compareTo(a.value)),
    );
  }

  // ── Completion counts ────────────────────────────────────
  int get cytoCount =>
      completionMap.values.where((c) => c.cyto).length;
  int get relapseCount =>
      completionMap.values.where((c) => c.relapse).length;
  int get completeCount =>
      completionMap.values
          .where((c) => c.pre && c.post && c.cyto && c.relapse)
          .length;
}

// ── Screen ────────────────────────────────────────────────

class InsightsScreen extends ConsumerWidget {
  const InsightsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(databaseProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Insights'),
        centerTitle: false,
      ),
      body: FutureBuilder<_InsightsData>(
        future: Future.wait([
          db.getAllPatients(),
          db.getAllPreChemos(),
          db.getAllPostChemos(),
          db.getCompletionMap(),
        ]).then((r) => _InsightsData(
              r[0] as List<Patient>,
              r[1] as List<PreChemoAssessment>,
              r[2] as List<PostChemoAssessment>,
              r[3] as Map<int, ({bool pre, bool post, bool cyto, bool relapse})>,
            )),
        builder: (context, snap) {
          if (!snap.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final data = snap.data!;

          if (data.patients.isEmpty) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.bar_chart_rounded,
                      size: 64,
                      color: Theme.of(context).colorScheme.outlineVariant),
                  const SizedBox(height: 16),
                  Text('No data yet',
                      style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 8),
                  const Text(
                      'Enrol patients and fill in their forms to see charts.'),
                ],
              ),
            );
          }

          return ListView(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
            children: [
              _SummaryGrid(data: data),
              const SizedBox(height: 20),
              if (data.hbPairs.isNotEmpty) ...[
                _HbAggregateCard(data: data),
                const SizedBox(height: 16),
              ],
              if (data.ca125Buckets.values.any((v) => v > 0)) ...[
                _Ca125DistributionCard(data: data),
                const SizedBox(height: 16),
              ],
              if (data.complaintCounts.isNotEmpty)
                _ComplaintsPieChart(counts: data.complaintCounts),
            ],
          );
        },
      ),
    );
  }
}

// ── Summary grid (2×2) ────────────────────────────────────

class _SummaryGrid extends StatelessWidget {
  const _SummaryGrid({required this.data});
  final _InsightsData data;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final stats = [
      (Icons.people_rounded, 'Enrolled', '${data.patients.length}',
          cs.primary),
      (Icons.science_rounded, 'Pre-Chemo', '${data.preChemos.length}',
          const Color(0xFF0EA5E9)),
      (Icons.medication_rounded, 'Post-Chemo', '${data.postChemos.length}',
          const Color(0xFF10B981)),
      (Icons.check_circle_rounded, 'Complete', '${data.completeCount}',
          const Color(0xFF8B5CF6)),
    ];

    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      childAspectRatio: 2.2,
      children: stats
          .map((s) => _StatCard(
                icon: s.$1,
                label: s.$2,
                value: s.$3,
                color: s.$4,
              ))
          .toList(),
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard(
      {required this.icon,
      required this.label,
      required this.value,
      required this.color});
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      child: Row(
        children: [
          Icon(icon, color: color, size: 26),
          const SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(value,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: color,
                      height: 1.1)),
              Text(label,
                  style: TextStyle(
                      fontSize: 11,
                      color: color.withValues(alpha: 0.8),
                      fontWeight: FontWeight.w500)),
            ],
          ),
        ],
      ),
    );
  }
}

// ── Hb aggregate card ─────────────────────────────────────

class _HbAggregateCard extends StatelessWidget {
  const _HbAggregateCard({required this.data});
  final _InsightsData data;

  static const _preColor  = Color(0xFF1A56DB);
  static const _postColor = Color(0xFF0EA5E9);

  @override
  Widget build(BuildContext context) {
    final maxY = [data.hbMeanPre, data.hbMeanPost].reduce(max) * 1.4;

    return _ChartCard(
      title: 'Haemoglobin: Pre vs Post NACT',
      subtitle: 'Mean values  ·  n = ${data.hbPairs.length} patients',
      height: 180,
      child: Column(
        children: [
          Expanded(
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: maxY,
                barGroups: [
                  BarChartGroupData(x: 0, barRods: [
                    BarChartRodData(
                      toY: data.hbMeanPre,
                      color: _preColor,
                      width: 40,
                      borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(6)),
                    ),
                  ]),
                  BarChartGroupData(x: 1, barRods: [
                    BarChartRodData(
                      toY: data.hbMeanPost,
                      color: _postColor,
                      width: 40,
                      borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(6)),
                    ),
                  ]),
                ],
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (v, _) {
                        final labels = ['Pre-NACT', 'Post-NACT'];
                        final i = v.toInt();
                        return Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child: Text(
                            i >= 0 && i < labels.length ? labels[i] : '',
                            style: const TextStyle(
                                fontSize: 11, fontWeight: FontWeight.w600),
                          ),
                        );
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 32,
                      getTitlesWidget: (v, _) => Text(
                          v.toStringAsFixed(0),
                          style: const TextStyle(fontSize: 10)),
                    ),
                  ),
                  topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false)),
                  rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false)),
                ),
                gridData: const FlGridData(
                    show: true, drawVerticalLine: false),
                borderData: FlBorderData(show: false),
                barTouchData: BarTouchData(
                  touchTooltipData: BarTouchTooltipData(
                    getTooltipItem: (group, groupIdx, rod, rodIdx) {
                      final label =
                          group.x == 0 ? 'Pre-NACT' : 'Post-NACT';
                      return BarTooltipItem(
                        '$label\n${rod.toY.toStringAsFixed(1)} g/dL',
                        const TextStyle(
                            color: Colors.white, fontSize: 12),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          // ── Stat strip ───────────────────────────────────
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _MiniStat(
                label: 'Pre mean',
                value: '${data.hbMeanPre.toStringAsFixed(1)} g/dL',
                color: _preColor,
              ),
              _MiniStat(
                label: 'Post mean',
                value: '${data.hbMeanPost.toStringAsFixed(1)} g/dL',
                color: _postColor,
              ),
              _MiniStat(
                label: 'Improved',
                value: '${data.hbImproved}',
                color: Colors.green,
              ),
              _MiniStat(
                label: 'Declined',
                value: '${data.hbDeclined}',
                color: Colors.orange,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MiniStat extends StatelessWidget {
  const _MiniStat(
      {required this.label, required this.value, required this.color});
  final String label;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value,
            style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: color)),
        Text(label,
            style: TextStyle(
                fontSize: 10,
                color: Theme.of(context).colorScheme.outline)),
      ],
    );
  }
}

// ── CA125 distribution card ───────────────────────────────

class _Ca125DistributionCard extends StatelessWidget {
  const _Ca125DistributionCard({required this.data});
  final _InsightsData data;

  static const _bucketColors = [
    Color(0xFF10B981),
    Color(0xFF0EA5E9),
    Color(0xFFF59E0B),
    Color(0xFFEF4444),
    Color(0xFF8B5CF6),
  ];

  @override
  Widget build(BuildContext context) {
    final buckets = data.ca125Buckets;
    final keys = buckets.keys.toList();
    final maxVal = buckets.values.reduce(max).toDouble();
    final n = buckets.values.reduce((a, b) => a + b);

    return _ChartCard(
      title: 'CA125 Distribution — Pre NACT',
      subtitle:
          'n = $n patients  ·  median ${data.ca125Median.toStringAsFixed(0)} U/mL',
      height: 220,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: maxVal * 1.3,
          barGroups: keys.asMap().entries.map((e) {
            final count = buckets[e.value]!.toDouble();
            return BarChartGroupData(
              x: e.key,
              barRods: [
                BarChartRodData(
                  toY: count,
                  color: _bucketColors[e.key % _bucketColors.length],
                  width: 32,
                  borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(6)),
                ),
              ],
            );
          }).toList(),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (v, _) {
                  final i = v.toInt();
                  if (i < 0 || i >= keys.length) return const SizedBox();
                  return Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Text(keys[i],
                        style: const TextStyle(fontSize: 10)),
                  );
                },
              ),
            ),
            leftTitles: AxisTitles(
              axisNameWidget: const Padding(
                padding: EdgeInsets.only(right: 4),
                child:
                    Text('Patients', style: TextStyle(fontSize: 10)),
              ),
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 28,
                interval: maxVal > 10 ? (maxVal / 5).roundToDouble() : 1,
                getTitlesWidget: (v, _) => Text(
                    v.toInt().toString(),
                    style: const TextStyle(fontSize: 10)),
              ),
            ),
            topTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false)),
            rightTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false)),
          ),
          gridData:
              const FlGridData(show: true, drawVerticalLine: false),
          borderData: FlBorderData(show: false),
          barTouchData: BarTouchData(
            touchTooltipData: BarTouchTooltipData(
              getTooltipItem: (group, groupIdx, rod, rodIdx) {
                final label = keys[group.x];
                return BarTooltipItem(
                  '$label U/mL\n${rod.toY.toInt()} patients',
                  const TextStyle(color: Colors.white, fontSize: 12),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

// ── Complaints pie chart ──────────────────────────────────

class _ComplaintsPieChart extends StatefulWidget {
  const _ComplaintsPieChart({required this.counts});
  final Map<String, int> counts;

  @override
  State<_ComplaintsPieChart> createState() => _ComplaintsPieChartState();
}

class _ComplaintsPieChartState extends State<_ComplaintsPieChart> {
  int _touched = -1;

  static const _palette = [
    Color(0xFF1A56DB),
    Color(0xFF0EA5E9),
    Color(0xFF10B981),
    Color(0xFFF59E0B),
    Color(0xFFEF4444),
    Color(0xFF8B5CF6),
    Color(0xFFEC4899),
    Color(0xFF14B8A6),
  ];

  @override
  Widget build(BuildContext context) {
    final entries = widget.counts.entries.toList();
    final total = entries.fold(0, (s, e) => s + e.value);

    return _ChartCard(
      title: 'Presenting Complaints',
      subtitle: '$total complaint entries across ${entries.length} categories',
      height: 220,
      legend: entries
          .asMap()
          .entries
          .map((e) => _LegendDot(
                color: _palette[e.key % _palette.length],
                label: '${e.value.key} (${e.value.value})',
              ))
          .toList(),
      child: PieChart(
        PieChartData(
          pieTouchData: PieTouchData(
            touchCallback: (event, response) {
              setState(() {
                _touched = (event.isInterestedForInteractions &&
                        response?.touchedSection != null)
                    ? response!.touchedSection!.touchedSectionIndex
                    : -1;
              });
            },
          ),
          sectionsSpace: 2,
          centerSpaceRadius: 36,
          sections: entries.asMap().entries.map((e) {
            final pct = e.value.value / total * 100;
            final isTouched = e.key == _touched;
            return PieChartSectionData(
              color: _palette[e.key % _palette.length],
              value: e.value.value.toDouble(),
              title: '${pct.toStringAsFixed(0)}%',
              radius: isTouched ? 72 : 60,
              titleStyle: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            );
          }).toList(),
        ),
      ),
    );
  }
}

// ── Shared chart card ─────────────────────────────────────

class _ChartCard extends StatelessWidget {
  const _ChartCard({
    required this.title,
    required this.child,
    required this.height,
    this.subtitle,
    this.legend = const [],
  });

  final String title;
  final String? subtitle;
  final Widget child;
  final double height;
  final List<Widget> legend;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: cs.outlineVariant),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(fontWeight: FontWeight.w700)),
            if (subtitle != null)
              Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Text(subtitle!,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: cs.outline)),
              ),
            if (legend.isNotEmpty) ...[
              const SizedBox(height: 8),
              Wrap(spacing: 12, runSpacing: 4, children: legend),
            ],
            const SizedBox(height: 16),
            SizedBox(height: height, child: child),
          ],
        ),
      ),
    );
  }
}

class _LegendDot extends StatelessWidget {
  const _LegendDot({required this.color, required this.label});
  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
            width: 10,
            height: 10,
            decoration:
                BoxDecoration(color: color, shape: BoxShape.circle)),
        const SizedBox(width: 4),
        Text(label, style: const TextStyle(fontSize: 11)),
      ],
    );
  }
}
