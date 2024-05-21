import 'package:flutter/material.dart';
import 'package:aero_weather_pro_max/widgets/map/map.dart';

class RaspPage extends StatelessWidget {
  const RaspPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RASP Score Map'),
      ),
      body: Map()
    );
  }
}