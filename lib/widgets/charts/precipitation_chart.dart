import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PrecipitationChart extends StatelessWidget {
  static const double BAR_WIDTH = 30.0;
  final List<double> precipitationData;
  const PrecipitationChart(this.precipitationData, {super.key});

  @override
  Widget build(BuildContext context) {
    // return a bar chart
    return Container(
      width: (BAR_WIDTH + 16) * 24,
      padding: const EdgeInsets.all(16.0),
      child: BarChart(
        BarChartData(
          gridData: FlGridData(show: false),
          baselineY: 100,
          borderData: FlBorderData(show: false),
          maxY: 100,
          titlesData: FlTitlesData(
            // show: false,
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
                sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (x, meta) {
                final hour = x.toInt().toString().padLeft(2, '0');
                return SideTitleWidget(
                  axisSide: meta.axisSide,
                  space: 8.0,
                  child: Text('$hour:00'),
                );
              },
              reservedSize: 24,
            )),
          ),
          barGroups: _getBarGroups(),
        ),
      ),
    );
  }

  List<BarChartGroupData> _getBarGroups() {
    return List.generate(
      precipitationData.length,
      (i) => BarChartGroupData(
        x: i,
        barRods: [
          BarChartRodData(
            toY: precipitationData[i],
            width: BAR_WIDTH,
            color: Colors.blue,
            borderRadius: BorderRadius.circular(7),
          ),
        ],
      ),
    );
  }
}
