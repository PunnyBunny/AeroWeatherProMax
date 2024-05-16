import 'package:aero_weather_pro_max/widgets/charts/base_chart.dart';
import 'package:flutter/material.dart';

class VisibilityChart extends StatelessWidget {
  final List<double> visibilityData;

  const VisibilityChart(this.visibilityData, {super.key});

  @override
  Widget build(BuildContext context) {
    // return a bar chart
    return BaseChart(
        30, [visibilityData], [Theme.of(context).colorScheme.primary]);
  }
}
