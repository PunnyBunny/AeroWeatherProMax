

import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:aero_weather_pro_max/util/map_handler/map_tile_converter.dart';
import 'package:aero_weather_pro_max/util/rasp_generator/perlin_noise.dart';
import 'package:flutter/material.dart';

class RaspGenerator {
  static String generateRaspCode(String code) {
    return code;
  }

  static int getSeedFromTime(DateTime time) {
    return time.millisecondsSinceEpoch;
  }

  static PerlinNoise getPerlinNoiseObj(
    DateTime time
  ) {
    int seed = getSeedFromTime(time);
    int octaves = 4;
    double persistence = 0.5;
    double lacunarity = 200.1;

    return PerlinNoise(seed, octaves, persistence, lacunarity);

  }

  static List<List<double>> generateNoiseForTile(
    int x, 
    int y, 
    int zoom, 
    DateTime time
  ) {
    PerlinNoise perlinNoise = RaspGenerator.getPerlinNoiseObj(time);
    double topLeftLat = MapTileConverter.tileYToLat(y, zoom);
    double topLeftLon = MapTileConverter.tileXToLon(x, zoom);
    double bottomRightLat = MapTileConverter.tileYToLat(y + 1, zoom);
    double bottomRightLon = MapTileConverter.tileXToLon(x + 1, zoom);

    double latStep = (topLeftLat - bottomRightLat) / 256;
    double lonStep = (bottomRightLon - topLeftLon) / 256;

    List<List<double>> noise = List.generate(256, (i) => List.generate(256, (j) => 0.0));

    for (int i = 0; i < 256; i++) {
      for (int j = 0; j < 256; j++) {
        double lat = topLeftLat + (i * latStep);
        double lon = topLeftLon + (j * lonStep);
        noise[i][j] = perlinNoise.noise(lon, lat);
      }
    }

    return noise;
  }

  static List<List<double>> generateRaspForTile(
    int x, 
    int y, 
    int zoom, 
    DateTime time
  ) {
    PerlinNoise perlinNoise = RaspGenerator.getPerlinNoiseObj(time);

    List<List<double>> noise = generateNoiseForTile(x, y, zoom, time);

    List<List<double>> rasp = List.generate(256, (i) => List.generate(256, (j) => 0.0));

    double maxVal = perlinNoise.getMaxValue();

    for (int i = 0; i < 256; i++) {
      for (int j = 0; j < 256; j++) {
        // Scale to -10 to 10
        rasp[i][j] = noise[i][j] / maxVal * 10;
      }
    }

    return rasp;
  }

  static Future<Image> generateRaspImage(
    int x, 
    int y, 
    int zoom, 
    DateTime time
  ) async {
    PerlinNoise perlinNoise = RaspGenerator.getPerlinNoiseObj(time);

    List<List<double>> rasp = generateNoiseForTile(x, y, zoom, time);

    double maxVal = perlinNoise.getMaxValue();

    List<int> pixels = List.generate(256 * 256 * 4, (i) {
      double val = rasp[(i ~/ 4) ~/ 256][(i ~/ 4) % 256] / maxVal * 10;
      return RaspGenerator.getRaspColor(val, i);
    });
    Completer<ui.Image> c = Completer<ui.Image>();
    ui.decodeImageFromPixels(
      Uint8List.fromList(pixels), 
      256, 
      256,
      ui.PixelFormat.bgra8888,
      (ui.Image result) async {
        c.complete(result);
      }
    );
    return RaspGenerator.convertUiToFlutter(await c.future);
  }

  static int getRaspColor(double value, int i) {

    int r = 255;
    int g = 255;
    int b = 255;

    if (value <0) {
      r = 0;
      b = 255 - (value * 255 / 10).round();
      g = 255 - b;
    } else {
      b = 0;
      g = 255 - (value * 255 / 10).round();
      r = 255 - g;
    }

    if (i % 4 == 0) {
      return b;
    } else if (i % 4 == 1) {
      return g;
    } else if (i % 4 == 2) {
      return r;
    } else {
      return 255;
    }
  }

  static Future<Image> convertUiToFlutter(ui.Image img) async {
    ByteData? byteData = await img.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData!.buffer.asUint8List();
    return Image.memory(pngBytes);
  }
}