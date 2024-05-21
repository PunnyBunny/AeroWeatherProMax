import 'package:aero_weather_pro_max/util/data_reader/data_reader.dart';
import 'package:aero_weather_pro_max/widgets/charts/precipitation_chart.dart';
import 'package:aero_weather_pro_max/widgets/charts/visibility_chart.dart';
import 'package:aero_weather_pro_max/widgets/charts/wind_speed_chart.dart';
import 'package:flutter/material.dart';

class BoxView extends StatefulWidget {
  final int day;

  const BoxView(this.day, {super.key});

  @override
  @override
  State<BoxView> createState() => _BoxView();
}

class _BoxView extends State<BoxView> {
  int? _tabIndex = 0;
  var paramNames = ['Wind Speed(mph)', 'Precipitation(% chance)', 'Visibility(metres)'];

  @override
  Widget build(BuildContext context) {
    return Container(
      // hourly forecast
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.tertiary,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Align(
              // alignment: const Alignment(-0.7, 0.5),
              child: SingleChildScrollView(
                // select wind speed, precipitation, or visibility
                scrollDirection: Axis.horizontal,
                child: Wrap(
                  spacing: 5.0,
                  children: List<Widget>.generate(
                    3,
                    (int index) {
                      return ChoiceChip(
                        backgroundColor: Colors.transparent,
                        disabledColor: Theme.of(context).colorScheme.secondary,
                        selectedColor: Theme.of(context).primaryColor,
                        label: Text(paramNames[index]),
                        selected: _tabIndex == index,
                        onSelected: (bool selected) {
                          setState(() {
                            _tabIndex = selected ? index : _tabIndex;
                          });
                        },
                      );
                    },
                  ).toList(),
                ),
              ),
            ),
          ),
          Container(
            // chart for the selected parameter
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: BorderRadius.circular(10),
            ),
            height: 300,
            alignment: Alignment.center,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: _getChart(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getChart() {
    final hourlyForecasts = DataReader().forecasts[0].hourForecasts;
    if (_tabIndex == 0) {
      return WindSpeedChart(
        hourlyForecasts.map((e) => e.windSpeed0.toDouble()).toList(),
        hourlyForecasts.map((e) => e.windSpeed180.toDouble()).toList(),
      );
    }
    if (_tabIndex == 1) {
      return PrecipitationChart(
        hourlyForecasts.map((e) => e.precipitation.toDouble()).toList(),
      );
    }
    return VisibilityChart(
      hourlyForecasts.map((e) => e.visibility.toDouble()).toList(),
    );
  }
}
