import 'dart:math';

class PerlinNoise {
  final int _seed;
  final int _octaves;
  final double _persistence;
  final double _lacunarity;

  PerlinNoise(this._seed, this._octaves, this._persistence, this._lacunarity);

  double getMaxValue() {
    double amplitude = 1;
    double frequency = 1;
    double maxValue = 0;

    for (int i = 0; i < _octaves; i++) {
      maxValue += amplitude;
      amplitude *= _persistence;
      frequency *= _lacunarity;
    }

    return maxValue;
  }

  double getMinValue() {
    return -getMaxValue();
  }

  double noise(double x, double y) {
    double total = 0;
    double frequency = 1;
    double amplitude = 1;
    double maxValue = 0;

    for (int i = 0; i < _octaves; i++) {
      total += _interpolatedNoise(x * frequency, y * frequency) * amplitude;

      maxValue += amplitude;

      amplitude *= _persistence;
      frequency *= _lacunarity;
    }

    return total / maxValue;
  }

  double _interpolatedNoise(double x, double y) {
    int intX = x.floor();
    int intY = y.floor();
    double fracX = x - intX;
    double fracY = y - intY;

    double v1 = _smoothNoise(intX, intY);
    double v2 = _smoothNoise(intX + 1, intY);
    double v3 = _smoothNoise(intX, intY + 1);
    double v4 = _smoothNoise(intX + 1, intY + 1);

    double i1 = _cosineInterpolate(v1, v2, fracX);
    double i2 = _cosineInterpolate(v3, v4, fracX);

    return _cosineInterpolate(i1, i2, fracY);
  }

  double _smoothNoise(int x, int y) {
    double corners = (_noise(x - 1, y - 1) + _noise(x + 1, y - 1) + _noise(x - 1, y + 1) + _noise(x + 1, y + 1)) / 16;
    double sides = (_noise(x - 1, y) + _noise(x + 1, y) + _noise(x, y - 1) + _noise(x, y + 1)) / 8;
    double center = _noise(x, y) / 4;

    return corners + sides + center;
  }

  double _noise(int x, int y) {
    int n = x + y * 57;
    n = (n << 13) ^ n;
    return (1.0 - ((n * (n * n * _seed + 19990303) + 1376312589) & 0x7fffffff) / 1073741824.0);
  }

  double _cosineInterpolate(double a, double b, double x) {
    double ft = x * 3.1415927;
    double f = (1 - (a + b) / 2) * sin(ft) + (b - a) / 2 * cos(ft);
    return a + f;
  }


}