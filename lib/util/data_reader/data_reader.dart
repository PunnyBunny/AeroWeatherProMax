import 'package:aero_weather_pro_max/models/day_forecast.dart';
import 'package:aero_weather_pro_max/util/data_connection/data_connection.dart';

// singleton class to read data from the data connection
// access the singleton instance using DataReader()
class DataReader {
  static DataReader? _instance;
  final DataConnection _dataConnection;
  late List<DayForecast> forecasts; // MUST call load() before accessing

  factory DataReader({DataConnection? dataConnection}) {
    dataConnection ??= DataConnection();
    _instance ??= DataReader._internal(dataConnection);
    return _instance!;
  }

  DataReader._internal(this._dataConnection);

  Future<void> load() async {
    List forecastsJson = await _dataConnection.loadFromJson();
    forecasts = forecastsJson
        .map((forecast) => DayForecast.fromJson(forecast))
        .toList();
  }
}
