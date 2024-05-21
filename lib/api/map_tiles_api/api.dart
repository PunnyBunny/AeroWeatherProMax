import 'package:http/http.dart' as http;

class Api {
  static const uri = 'https://maptiles.p.rapidapi.com/en/map/';
  static const version = 'v1';

  // Should not be a class variable but I am lazy and security is not essential here
  static const apiKey = 'f20fd8c009mshfc56699b889c56bp139f2djsndaf51c407f29';
  static const apiHost = 'maptiles.p.rapidapi.com';

  static const maxZoom = 19;
  static const minZoom = 0;

  static const double tileSize = 256; // pxs

  // As this is a global api we must limit it to a certain x y and z tile.
  static const cambridgeLatitude = 52.2053;
  static const cambridgeLongitude = 0.1218;

  static String getBaseUrl() {
    return '$uri$version';
  }

  static String getMapUrl({
    required int zoom,
    required int x,
    required int y,
  }) {
    return '${Api.getBaseUrl()}/$zoom/$x/$y.png';
  }

  static Future<http.Response> getMapTiles({
    required int zoom,
    required int x,
    required int y,
  }) async {
    final Uri url = Uri.parse(Api.getMapUrl(zoom: zoom, x: x, y: y));
    final response = await http.get(
      url,
      headers: {
        'X-RapidAPI-Key': Api.apiKey,
        'X-RapidAPI-Host': Api.apiHost,
      },
    );
    return response;
  }
}

