import 'dart:math';

class MapTileConverter {
  static const int TILE_SIZE = 256;
  static const int MAX_ZOOM = 19;
  static const int TILE_SIZE_MASK = TILE_SIZE - 1;

  static double latToY(double lat, int zoom) {
    return (1 - log(tan(lat * pi / 180) + 1 / cos(lat * pi / 180)) / pi) / 2 * (1 << zoom);
  }

  static double sinh(double x) {
    return (pow(e, x) - pow(e, -x)) / 2;
  }

  static double lonToX(double lon, int zoom) {
    return (lon + 180) / 360 * (1 << zoom);
  }

  static double yToLat(int y, int zoom) {
    return atan(sinh(pi * (1 - 2 * y / (1 << zoom)))) * 180 / pi;
  }

  static double xToLon(int x, int zoom) {
    return x / (1 << zoom) * 360 - 180;
  }

  static int xToTileX(double x, int zoom) {
    return (x).floor();
  }

  static int yToTileY(double y, int zoom) {
    return (y).floor();
  }

  static int tileXToX(int tileX, int zoom) {
    return tileX;
  }

  static int tileYToY(int tileY, int zoom) {
    return tileY;
  }

  static double tileXToLon(int tileX, int zoom) {
    return xToLon(tileXToX(tileX, zoom), zoom);
  }

  static double tileYToLat(int tileY, int zoom) {
    return yToLat(tileYToY(tileY, zoom), zoom);
  }

  static int lonToTileX(double lon, int zoom) {
    return xToTileX(lonToX(lon, zoom), zoom);
  }

  static int latToTileY(double lat, int zoom) {
    return yToTileY(latToY(lat, zoom), zoom);
  }

  static int maxTile(int zoom) {
    return (1 << zoom);
  }
}