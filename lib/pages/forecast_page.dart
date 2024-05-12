import 'package:aero_weather_pro_max/widgets/day_forecast.dart';
import 'package:flutter/material.dart';

class ForecastPage extends StatelessWidget {
  const ForecastPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('7 - day Forecast'),
      ),
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: 7, // Forecast for 7 days
                    itemBuilder: (context, index) {
                      return DayForecastWidget(date: DateTime.now().add(Duration(days: index)));
                    },
                  ),
                ],
              )
            )  
          )
        ]
      )
    );
  }
}
