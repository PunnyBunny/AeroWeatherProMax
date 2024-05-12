import 'package:flutter/material.dart';

class DayForecastWidget extends StatelessWidget {
  final DateTime date;

  const DayForecastWidget({Key? key, required this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double GAP = 12.0;
    WeatherInfo weatherInfo = getWeatherForDate(date);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        elevation: 2, // Elevation for a shadow effect
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Rounded corners
        ),
        color: Colors.grey[100], // Background colour of the card
        child: ExpansionTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _formatDate(date), // Display date
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(width: GAP), // Spacing between date and weather icon
              Image.asset(
                weatherInfo.icon, // Weather icon
                height: 24,
                width: 24,
              ),
              const SizedBox(width: GAP), // Adding spacing between weather icon and rain icon
              Image.asset(
                'assets/icons/raindrop.png', // Raindrop icon
                height: 24,
                width: 24,
              ),
              Text(
                '${weatherInfo.rainAmount} mm', // Rain amount
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(width: GAP), // Adding spacing between rain icon and wind icon
              Image.asset(
                'assets/icons/wind.png', // Wind icon
                height: 24,
                width: 24,
              ),
              Text(
                '${weatherInfo.windDirection} ${weatherInfo.windSpeed} m/s', // Wind direction and speed
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
          children: const <Widget>[
            // Content for the dropdown tile
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: <Widget>[
                  Text('Insert graph here'),// Placeholder
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
    return '${date.day}/${date.month}/${date.year}';
  }

  WeatherInfo getWeatherForDate(DateTime date) {
    // Dummy method to get weather info
    if (date.day % 2 == 0) {
      return WeatherInfo('assets/icons/sunny.png', 0, 'N', 10.0);
    } 
    else {
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
