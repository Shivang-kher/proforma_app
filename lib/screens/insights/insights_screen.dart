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

  const _InsightsData(this.patients, this.preChemos, this.postChemos);

  // Patients with both pre and post Hb recorded
  List<({String name, double pre, double post})> get hbPairs {
    final preMap = {for (final p in preChemos) p.patientId: p.hemoglobin};
    final postMap = {for (final p in postChemos) p.patientId: p.hemoglobin};
    final patientMap = {for (final p in patients) p.id: p.name};

    return [
      for (final id in preMap.keys)
        if (preMap[id] != null && postMap[id] != null)
          (
            name: patientMap[id] ?? 'P$id',
            pre: preMap[id]!,
            post: postMap[id]!,
          ),
    ];
  }

  // Patients with at least one CA125 reading
  List<({String name, List<double> readings})> get ca125Trends {
    final patientMap = {for (final p in patients) p.id: p.name};
    return [
      for (final post in postChemos)
        if (post.ca125Reading1 != null)
          (
            name: patientMap[post.patientId] ?? 'P${post.patientId}',
            readings: [
              post.ca125Reading1!,
              if (post.ca125Reading2 != null) post.ca125Reading2!,
              if (post.ca125Reading3 != null) post.ca125Reading3!,
            ],
          ),
    ];
  }

  // Complaint frequency map
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
        ]).then((r) => _InsightsData(
              r[0] as List<Patient>,
              r[1] as List<PreChemoAssessment>,
              r[2] as List<PostChemoAssessment>,
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
                  Text('Enrol patients and fill in their forms to see charts.',
                      style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            );
          }

          return ListView(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
            children: [
              _SummaryRow(data: data),
              const SizedBox(height: 20),
              if (data.hbPairs.isNotEmpty) ...[
                _HbBarChart(pairs: data.hbPairs),
                const SizedBox(height: 24),
              ],
              if (data.ca125Trends.isNotEmpty) ...[
                _Ca125LineChart(trends: data.ca125Trends),
                const SizedBox(height: 24),
              ],
              if (data.complaintCounts.isNotEmpty)
                _ComplaintsPieChart(counts: data.complaintCounts),
              if (data.hbPairs.isEmpty &&
                  data.ca125Trends.isEmpty &&
                  data.complaintCounts.isEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Center(
                    child: Text(
                      'Fill in Pre-Chemo and Post-Chemo forms to see charts.',
                      style: Theme.of(context).textTheme.bodySmall,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

// ── Summary row ───────────────────────────────────────────

class _SummaryRow extends StatelessWidget {
  const _SummaryRow({required this.data});
  final _InsightsData data;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final stats = [
      ('Patients', '${data.patients.length}'),
      ('Pre-Chemo', '${data.preChemos.length}'),
      ('Post-Chemo', '${data.postChemos.length}'),
    ];
    return Row(
      children: stats
          .map((s) => Expanded(
                child: Card(
                  elevation: 0,
                  color: cs.primaryContainer,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    child: Column(
                      children: [
                        Text(s.$2,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: cs.primary)),
                        Text(s.$1,
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(color: cs.onPrimaryContainer)),
                      ],
                    ),
                  ),
                ),
              ))
          .toList(),
    );
  }
}

// ── Hb bar chart ──────────────────────────────────────────

class _HbBarChart extends StatelessWidget {
  const _HbBarChart({required this.pairs});
  final List<({String name, double pre, double post})> pairs;

  static const _preColor  = Color(0xFF1A56DB);
  static const _postColor = Color(0xFF0EA5E9);

  @override
  Widget build(BuildContext context) {
    return _ChartCard(
      title: 'Haemoglobin: Pre vs Post Chemo (g/dL)',
      legend: const [
        _LegendDot(color: _preColor,  label: 'Pre'),
        _LegendDot(color: _postColor, label: 'Post'),
      ],
      height: 220,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: pairs
                  .expand((p) => [p.pre, p.post])
                  .fold(0.0, (a, b) => a > b ? a : b) *
              1.2,
          barGroups: pairs.asMap().entries.map((e) {
            final i = e.key;
            final p = e.value;
            return BarChartGroupData(
              x: i,
              barRods: [
                BarChartRodData(toY: p.pre,  color: _preColor,  width: 10, borderRadius: BorderRadius.circular(4)),
                BarChartRodData(toY: p.post, color: _postColor, width: 10, borderRadius: BorderRadius.circular(4)),
              ],
            );
          }).toList(),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (v, _) {
                  final i = v.toInt();
                  if (i < 0 || i >= pairs.length) return const SizedBox();
                  final name = pairs[i].name;
                  return Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Text(
                      name.length > 6 ? '${name.substring(0, 5)}…' : name,
                      style: const TextStyle(fontSize: 10),
                    ),
                  );
                },
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 32,
                getTitlesWidget: (v, _) =>
                    Text(v.toStringAsFixed(0), style: const TextStyle(fontSize: 10)),
              ),
            ),
            topTitles:   const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          gridData: const FlGridData(show: true, drawVerticalLine: false),
          borderData: FlBorderData(show: false),
        ),
      ),
    );
  }
}

// ── CA125 line chart ──────────────────────────────────────

class _Ca125LineChart extends StatelessWidget {
  const _Ca125LineChart({required this.trends});
  final List<({String name, List<double> readings})> trends;

  static const _palette = [
    Color(0xFF1A56DB), Color(0xFF0EA5E9), Color(0xFF10B981),
    Color(0xFFF59E0B), Color(0xFFEF4444), Color(0xFF8B5CF6),
  ];

  @override
  Widget build(BuildContext context) {
    return _ChartCard(
      title: 'CA125 Trend (U/mL)',
      legend: trends.asMap().entries.map((e) => _LegendDot(
        color: _palette[e.key % _palette.length],
        label: e.value.name.length > 8
            ? '${e.value.name.substring(0, 7)}…'
            : e.value.name,
      )).toList(),
      height: 240,
      child: LineChart(
        LineChartData(
          lineBarsData: trends.asMap().entries.map((e) {
            final color = _palette[e.key % _palette.length];
            return LineChartBarData(
              spots: e.value.readings
                  .asMap()
                  .entries
                  .map((r) => FlSpot(r.key.toDouble(), r.value))
                  .toList(),
              isCurved: true,
              color: color,
              barWidth: 2.5,
              dotData: const FlDotData(show: true),
            );
          }).toList(),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (v, _) {
                  const labels = ['I', 'II', 'III'];
                  final i = v.toInt();
                  return Text(
                    i >= 0 && i < labels.length ? labels[i] : '',
                    style: const TextStyle(fontSize: 11),
                  );
                },
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40,
                getTitlesWidget: (v, _) =>
                    Text(v.toStringAsFixed(0), style: const TextStyle(fontSize: 10)),
              ),
            ),
            topTitles:   const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          gridData: const FlGridData(show: true, drawVerticalLine: false),
          borderData: FlBorderData(show: false),
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
    Color(0xFF1A56DB), Color(0xFF0EA5E9), Color(0xFF10B981),
    Color(0xFFF59E0B), Color(0xFFEF4444), Color(0xFF8B5CF6),
    Color(0xFFEC4899), Color(0xFF14B8A6),
  ];

  @override
  Widget build(BuildContext context) {
    final entries = widget.counts.entries.toList();
    final total   = entries.fold(0, (s, e) => s + e.value);

    return _ChartCard(
      title: 'Presenting Complaints',
      height: 260,
      legend: entries.asMap().entries.map((e) => _LegendDot(
        color: _palette[e.key % _palette.length],
        label: '${e.value.key} (${e.value.value})',
      )).toList(),
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
          centerSpaceRadius: 40,
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

// ── Shared card wrapper ───────────────────────────────────

class _ChartCard extends StatelessWidget {
  const _ChartCard({
    required this.title,
    required this.child,
    required this.height,
    this.legend = const [],
  });

  final String title;
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
            decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
        const SizedBox(width: 4),
        Text(label, style: const TextStyle(fontSize: 11)),
      ],
    );
  }
}
