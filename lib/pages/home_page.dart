import 'package:aero_weather_pro_max/widgets/box_view.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: false);

  @override
  Widget build(BuildContext context) {
    const double smallLogo = 100;
    const double bigLogo = 200;
    final Size biggest = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.center,
          child: Text('Hey Gliders!'),
        ),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.transparent,
      body: Center(
        child: ListView(
          // entire page is scrollable
          padding: const EdgeInsets.all(16.0),
          children: [
            Center(
              // big icon for the weather
              child: Stack(
                children: [
                  /*Icon(
                    Icons.sunny,
                    color: Colors.orange,
                    size: MediaQuery.of(context).size.height / 5,
                  ),*/
                  Positioned(
                    child: Transform.rotate(
                      angle: 0,
                      child: Icon(
                        Icons.flight_rounded,
                        shadows: const [
                          Shadow(
                            blurRadius: 15.0,
                            offset: Offset(8, 8),
                            color: Colors.blueGrey,
                          ),
                        ],
                        color: Colors.white,
                        size: MediaQuery.of(context).size.height / 5,
                      ),
                    ),
                  ),
                ],
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
            const BoxView(0), // day 0 is the current day
          ],
        ),
      ),
    );
  }
}
