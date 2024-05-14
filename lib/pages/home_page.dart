import 'package:aero_weather_pro_max/widgets/box_view.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: ListView(
          // entire page is scrollable
          padding: const EdgeInsets.all(16.0),
          children: [
            Center(
              // big icon for the weather
              child: Icon(
                Icons.sunny,
                color: Colors.orange,
                size: MediaQuery.of(context).size.height / 5,
              ),
            ),
            const Center(
              // brief description of weather now
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Text('Wind speed: N/A    Precipitation: N/A'),
              ),
            ),
            Container(
              alignment: const Alignment(-1, 0.0),
              padding: const EdgeInsets.all(8.0),
              child: const Text(
                'Hourly Forecast',
                style: TextStyle(fontSize: 24.0),
              ),
            ),
            const BoxView(),
          ],
        ),
      ),
    );
  }
}
