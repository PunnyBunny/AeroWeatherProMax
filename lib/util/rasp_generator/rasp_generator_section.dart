
import 'package:flutter/material.dart';

class RaspGeneratorSection {
  static const String IMAGE_PATH = 'assets/maps/rasp/';

  static String createImageName(int x, int y) {
    return 'section-0${x % 10}-0${y % 10}.png';
  }

  static getImagePath(int x, int y) {
    return '$IMAGE_PATH${createImageName(x, y)}';
  }

  static Future<Image> generateRaspImage(int x, int y) async {
    return Image.asset(getImagePath(x, y));
  }

  static Future<double> getAverageRaspValueForTile(int x, int y) async {
    // This is a placeholder for a more complex algorithm
    return 6.6;
  }
}
