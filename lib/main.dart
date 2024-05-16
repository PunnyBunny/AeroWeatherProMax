import 'package:aero_weather_pro_max/navigation.dart';
import 'package:aero_weather_pro_max/themes/theme.dart';
import 'package:aero_weather_pro_max/util/data_reader/data_reader.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

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
      home: AnimatedSplashScreen(
        splashIconSize: 200,
        splash: const Column(
          children: [
            Icon(Icons.airplanemode_active, size: 80),
            Text(
              'Aero Weather Pro Max',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        curve: Curves.easeInOutCubic,
        customTween: Tween<Offset>(
          begin: const Offset(0, 1),
          end: const Offset(0, 0),
        ),
        splashTransition: SplashTransition.slideTransition,
        duration: 200,
        pageTransitionType: PageTransitionType.fade,
        nextScreen: const BaseNavigation(),
      ),
    );
  }
}
