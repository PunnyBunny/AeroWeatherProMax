import 'package:aero_weather_pro_max/widgets/day_forecast.dart';
import 'package:flutter/material.dart';

class ForecastPage extends StatelessWidget {
  const ForecastPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.center,
          child: Text('7-Day Forecast'),
        ),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Calendar List',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(
                  7,
                  (index) => DayForecastWidget(
                    indexOfDate: index,
                    date: DateTime.now().add(Duration(days: index)),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
