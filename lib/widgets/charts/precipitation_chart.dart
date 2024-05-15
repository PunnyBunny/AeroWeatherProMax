import 'package:aero_weather_pro_max/widgets/charts/base_chart.dart';
import 'package:flutter/material.dart';

class PrecipitationChart extends StatelessWidget {
  final List<double> precipitationData;

  const PrecipitationChart(this.precipitationData, {super.key});

  @override
  Widget build(BuildContext context) {
    // return a bar chart
    return BaseChart(
        30, [precipitationData], [Theme.of(context).primaryColor]);
  }
}
