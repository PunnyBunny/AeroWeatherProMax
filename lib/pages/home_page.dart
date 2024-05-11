import 'package:aero_weather_pro_max/util/data_reader/data_reader.dart';
import 'package:aero_weather_pro_max/widgets/charts/precipitation_chart.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<int> data = DataReader()
        .forecasts[0]
        .hourForecasts
        .map((forecast) => forecast.precipitation)
        .toList();
    return SizedBox(
      height: 200.0,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: PrecipitationChart(
          data.map((e) => e.toDouble()).toList(),
        ),
      ),
    );
  }
}
