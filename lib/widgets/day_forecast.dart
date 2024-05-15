import 'package:flutter/material.dart';

import './box_view.dart';

class DayForecastWidget extends StatelessWidget {
  final DateTime date;
  final int indexOfDate;

  const DayForecastWidget({
    Key? key,
    required this.date,
    required this.indexOfDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double GAP = 10.0;
    WeatherInfo weatherInfo = getWeatherForDate(date);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        elevation: 2, // Elevation for a shadow effect
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Rounded corners
        ),
        color: Theme.of(context).canvasColor, // Background colour of the card
        child: ExpansionTile(
          // childrenPadding: const EdgeInsets.all(16),
          shape: const Border(),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _formatDate(date), // Display date
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(width: GAP),
              // Spacing between date and weather icon
              Image.asset(
                weatherInfo.icon, // Weather icon
                height: 24,
                width: 24,
              ),
              const SizedBox(width: GAP),
              // Adding spacing between weather icon and rain and wind info
              Column(
                children: [
                  Row(children: [
                    Image.asset(
                      'assets/icons/raindrop.png', // Raindrop icon
                      height: 24,
                      width: 24,
                    ),
                    Text(
                      '${weatherInfo.rainAmount} mm', // Rain amount
                      style: const TextStyle(fontSize: 16),
                    ),
                  ]),
                  Row(
                    children: [
                      const SizedBox(width: GAP + 4),
                      Image.asset(
                        'assets/icons/wind.png', // Wind icon
                        height: 24,
                        width: 24,
                      ),
                      Text(
                        '${weatherInfo.windDirection} ${weatherInfo.windSpeed} m/s',
                        // Wind direction and speed
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
          children: <Widget>[
            const Divider(),
            // Content for the dropdown tile
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
              child: Column(
                children: <Widget>[
                  BoxView(indexOfDate),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    // Function to format the date
    return '${date.day}/${date.month}';
  }

  WeatherInfo getWeatherForDate(DateTime date) {
    // Dummy method to get weather info
    if (date.day % 2 == 0) {
      return WeatherInfo('assets/icons/sunny.png', 0, 'N', 10.0);
    } else {
      return WeatherInfo('assets/icons/cloudy.png', 5.0, 'E', 15.0);
    }
  }
}

class WeatherInfo {
  final String icon;
  final double rainAmount;
  final String windDirection;
  final double windSpeed;

  WeatherInfo(this.icon, this.rainAmount, this.windDirection, this.windSpeed);
}
