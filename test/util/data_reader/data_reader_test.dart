import 'package:aero_weather_pro_max/models/day_forecast.dart';
import 'package:aero_weather_pro_max/models/hour_forecast.dart';
import 'package:aero_weather_pro_max/models/weather_enum.dart';
import 'package:aero_weather_pro_max/util/data_connection/data_connection.dart';
import 'package:aero_weather_pro_max/util/data_reader/data_reader.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'data_reader_test.mocks.dart';

@GenerateMocks([DataConnection]) // Generate Mocks for DataConnection
void main() {
  group('DataReader', () {
    test('test if loadFromJson returns correct forecast objects', () async {
      final mockDataConnection = MockDataConnection();
      when(mockDataConnection.loadFromJson()).thenAnswer((_) async => [
            {
              "year": 2024,
              "month": 5,
              "day": 10,
              "weather": "cloudy",
              "hourly": [
                {
                  'hour': 0,
                  'precipitation': 0,
                  'windSpeed0': 0,
                  'windDirection0': 0,
                  'windSpeed180': 0,
                  'windDirection180': 0,
                  'visibility': 0,
                  'temperature': 0,
                },
                {
                  'hour': 1,
                  'precipitation': 0,
                  'windSpeed0': 0,
                  'windDirection0': 0,
                  'windSpeed180': 0,
                  'windDirection180': 0,
                  'visibility': 0,
                  'temperature': 0,
                },
              ],
            },
          ]);

      final dataReader = DataReader(dataConnection: mockDataConnection);
      await dataReader.load();
      expect(dataReader.forecasts, [
        const DayForecast(
          2024,
          5,
          10,
          WeatherEnum.cloudy,
          [
            HourForecast(0, 0, 0, 0, 0, 0, 0, 0),
            HourForecast(1, 0, 0, 0, 0, 0, 0, 0),
          ],
        ),
      ]);
    });
  });
}
