import 'package:aero_weather_pro_max/util/data_reader/data_reader.dart';
import 'package:aero_weather_pro_max/widgets/charts/precipitation_chart.dart';
import 'package:flutter/material.dart';

class BoxView extends StatefulWidget {
  const BoxView({super.key});
  State<BoxView> createState() => _BoxView();
}

class _BoxView extends State<BoxView> {
  int? _tabIndex = 0;
  var paramNames = ['Wind Speed', 'Precipitation', 'Visibility'];

  @override
  Widget build(BuildContext context) {
    return Container(
      // hourly forecast
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color(0xcc82c4ff),
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
                        disabledColor: Colors.blue,
                        selectedColor: Colors.red,
                        label: Text(paramNames[index]),
                        selected: _tabIndex == index,
                        onSelected: (bool selected) {
                          setState(() {
                            _tabIndex = selected ? index : null;
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
              color: const Color(0xff85a9ff),
              borderRadius: BorderRadius.circular(10),
            ),
            height: 300,
            alignment: Alignment.center,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: PrecipitationChart(
                DataReader()
                    .forecasts[0]
                    .hourForecasts
                    .map((e) => e.precipitation.toDouble())
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}