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
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        destinations: [
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
        HomePage(),
        ForecastPage(),
        RaspPage(),
      ][_currentPageIndex],
    );
  }
}
