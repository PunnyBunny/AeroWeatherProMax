import 'package:aero_weather_pro_max/navigation.dart';
import 'package:aero_weather_pro_max/util/data_reader/data_reader.dart';
import 'package:aero_weather_pro_max/themes/theme.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DataReader().load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: const MaterialTheme(TextTheme()).light(),
      home: const BaseNavigation(),
    );
  }
}
