import 'package:aero_weather_pro_max/pages/forecast_page.dart';
import 'package:aero_weather_pro_max/pages/home_page.dart';
import 'package:aero_weather_pro_max/pages/rasp_page.dart';
import 'package:flutter/material.dart';

class BaseNavigation extends StatefulWidget {
  const BaseNavigation({super.key});

  @override
  State<BaseNavigation> createState() => _BaseNavigationState();
}

class _BaseNavigationState extends State<BaseNavigation> {
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.grey[200]!, Colors.blueAccent],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        bottomNavigationBar: NavigationBar(
          selectedIndex: _currentPageIndex,
          onDestinationSelected: (int index) {
            setState(() {
              _currentPageIndex = index;
            });
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.calendar_today),
              label: 'Forecast',
            ),
            NavigationDestination(
              icon: Icon(Icons.map),
              label: 'Map',
            ),
          ],
        ),
        body: [
          const HomePage(),
          const ForecastPage(),
          const RaspPage(),
        ][_currentPageIndex],
      ),
    );
  }
}
