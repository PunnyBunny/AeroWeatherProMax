import 'dart:ffi';

import 'package:aero_weather_pro_max/util/data_reader/data_reader.dart';
import 'package:aero_weather_pro_max/widgets/charts/precipitation_chart.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  int? _tabIndex = 0;
  var paramNames = ['Wind Speed', 'Precipitation', 'Visibility'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Text('Home Page'),
      ),
    );
  }
}
