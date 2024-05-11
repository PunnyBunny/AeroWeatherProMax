import 'package:aero_weather_pro_max/models/weather_enum.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'hour_forecast.dart';

part 'day_forecast.g.dart';

@JsonSerializable()
class DayForecast extends Equatable {
  final int year;
  final int month;
  final int day;
  final WeatherEnum weather;
  @JsonKey(name: 'hourly')
  final List<HourForecast> hourForecasts;

  const DayForecast(this.year, this.month, this.day, this.weather, this.hourForecasts);

  factory DayForecast.fromJson(Map<String, dynamic> json) =>
      _$DayForecastFromJson(json);

  Map<String, dynamic> toJson() => _$DayForecastToJson(this);

  @override
  List<Object?> get props => [year, month, day, weather, hourForecasts];
}
