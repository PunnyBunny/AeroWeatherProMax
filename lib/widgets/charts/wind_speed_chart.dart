import 'package:aero_weather_pro_max/widgets/charts/base_chart.dart';
import 'package:flutter/material.dart';

class WindSpeedChart extends StatelessWidget {
  final List<double> windSpeedData0, windSpeedData180;

  const WindSpeedChart(this.windSpeedData0, this.windSpeedData180, {super.key});

  @override
  Widget build(BuildContext context) {
    // return a bar chart
    return Stack(
      children: [
        Card(
          margin: const EdgeInsets.all(16),
          child: Container(
            padding: const EdgeInsets.all(8),
            height: 60,
            width: 75,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    SizedBox(width: 10),
                    Text("0m"),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                    SizedBox(width: 10),
                    Text("180m"),
                  ],
                ),
              ],
            ),
          ),
        ),
        BaseChart(
          20,
          [windSpeedData0, windSpeedData180],
          [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.secondary
          ],
        ),
      ],
    );
  }
}
