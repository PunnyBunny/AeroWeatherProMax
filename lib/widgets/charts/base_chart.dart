import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BaseChart extends StatelessWidget {
  final double barWidth;
  final List<List<double>> data;
  final List<Color> colors;

  // data[0][0], data[1][0], ..., data[k-1][0] is the first bar
  // data[0][1], data[1][1], ..., data[k-1][1] is the second bar, and so on

  BaseChart(this.barWidth, this.data, this.colors, {super.key}) {
    assert(data.isNotEmpty);
    assert(data[0].isNotEmpty);
    assert(data.every((element) => element.length == data[0].length));
  }

  @override
  Widget build(BuildContext context) {
    // return a bar chart
    return Container(
      width: (barWidth * data.length + 16) * data[0].length,
      padding: const EdgeInsets.all(16.0),
      child: BarChart(
        BarChartData(
          gridData: FlGridData(show: false),
          baselineY: 100,
          borderData: FlBorderData(show: false),
          maxY: 100,
          barTouchData: BarTouchData(
            touchTooltipData: BarTouchTooltipData(
              tooltipBgColor: Colors.transparent,
              tooltipMargin: 0,
              tooltipPadding: const EdgeInsets.all(0),
              getTooltipItem: (group, groupIndex, rod, rodIndex) {
                return BarTooltipItem(
                  rod.toY.round().toString(),
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                );
              },
            ),
          ),
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
              ),
            ),
          ),
          barGroups: _getBarGroups(),
        ),
      ),
    );
  }

  List<BarChartGroupData> _getBarGroups() {
    return List.generate(
      data[0].length,
      (i) => BarChartGroupData(
        x: i,
        showingTooltipIndicators: List.generate(data.length, (j) => j),
        barRods: List.generate(
          data.length,
          (j) => BarChartRodData(
            toY: data[j][i],
            width: barWidth,
            color: colors[j],
            borderRadius: BorderRadius.circular(7),
          ),
        ),
      ),
    );
  }
}
