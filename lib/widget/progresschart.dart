import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
//import 'package:charts_flutter/flutter.dart' as charts;
import 'package:roqsal_quizapp_2026/model/score.dart';

class ProgressChart extends StatelessWidget {
  final List<Score> scores;

  const ProgressChart({super.key, required this.scores});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: true),
          titlesData: FlTitlesData(show: true),
          borderData: FlBorderData(show: true),
          minX: 0,
          maxX: scores.length.toDouble() - 1,
          minY: 0,
          maxY: 100,
          lineBarsData: [
            LineChartBarData(
              spots: scores.asMap().entries.map((e) {
                return FlSpot(e.key.toDouble(), e.value.score.toDouble());
              }).toList(),
              isCurved: true,
              color: Colors.blue,  // Changed from colors to color
              barWidth: 2,          // Added recommended barWidth
              isStrokeCapRound: true, // Added recommended property
              dotData: FlDotData(show: true),
              belowBarData: BarAreaData(
                show: true,
                color: Colors.blue.withOpacity(0.1), // Added color for area
              ),
            ),
          ],
        ),
      ),
    );
  }
}





//================================ Use syncfusion_flutter_charts ================================================
/*import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:roqsal_quizapp_2026/model/score.dart';

class ProgressChart extends StatelessWidget {
  final List<Score> scores;

  const ProgressChart({super.key, required this.scores});

  @override
  Widget build(BuildContext context) {
    // Sort scores by date (newest first)
    scores.sort((a, b) => b.date.compareTo(a.date));

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(
          title: AxisTitle(text: 'Attempts'),
        ),
        primaryYAxis: NumericAxis(
          minimum: 0,
          maximum: 100,
          interval: 20,
          title: AxisTitle(text: 'Score (%)'),
        ),
        series: <ChartSeries>[
          LineSeries<Score, String>(
            dataSource: scores,
            xValueMapper: (Score score, _) => score.date.split(' ')[0],
            yValueMapper: (Score score, _) => score.score,
            name: 'Scores',
            markerSettings: const MarkerSettings(isVisible: true),
            dataLabelSettings: const DataLabelSettings(isVisible: true),
          )
        ],
        tooltipBehavior: TooltipBehavior(enable: true),
      ),
    );
  }
}*/

/*

//========================================= Use charts_painter ================================
import 'package:flutter/material.dart';
import 'package:charts_painter/chart.dart';
import 'package:roqsal_quizapp_2026/model/score.dart';

class ProgressChart extends StatelessWidget {
  final List<Score> scores;

  const ProgressChart({super.key, required this.scores});

  @override
  Widget build(BuildContext context) {
    final values = scores.map((e) => BarValue(e.score.toDouble())).toList();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        height: 200,
        child: Chart(
          state: ChartState(
            data: ChartData(
              [[...values]],
              dataStrategy: DefaultDataStrategy(),
            ),
            itemOptions: BarItemOptions(
              color: Theme.of(context).primaryColor,
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              radius: BorderRadius.circular(4.0),
            ),
            backgroundDecorations: [
              GridDecoration(
                showVerticalGrid: false,
                horizontalAxisStep: 20,
                gridColor: Colors.grey.withOpacity(0.2),
              ),
            ],
            foregroundDecorations: [
              BarDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.3),
              ),
              ValueDecoration(
                valuePadding: const EdgeInsets.only(bottom: 8.0),
                showValue: true,
                valueStyle: DefaultTextStyle.of(context).style.copyWith(
                  fontSize: 10.0,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/
