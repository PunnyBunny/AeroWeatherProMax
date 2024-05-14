import 'dart:typed_data';

import 'package:aero_weather_pro_max/api/map_tiles_api/api.dart' as api;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MapTilesApiHandler {
  static Future<http.Response> getMapTiles({
    required int zoom,
    required int x,
    required int y,
  }) async {
    return await api.Api.getMapTiles(zoom: zoom, x: x, y: y);
  }

  static Uint8List getImageFromResponse(http.Response response) {
    if (response.statusCode != 200) {
      throw Exception('Failed to load map tile');
    }
    return response.bodyBytes;
  }

  static Image getPngFromResponse(Uint8List response) {
    return Image.memory(response);
  }

  static Future<Image> getMapTile({
    required int zoom,
    required int x,
    required int y,
  }) async {
    return getPngFromResponse(
      getImageFromResponse(
        await getMapTiles(zoom: zoom, x: x, y: y)
        ));
  }
}