import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hour_forecast.g.dart';

@JsonSerializable()
class HourForecast extends Equatable {
  final int hour;
  final int precipitation;
  final int windSpeed0;
  final int windDirection0;
  final int windSpeed180;
  final int windDirection180;
  final int visibility;
  final int temperature;

  const HourForecast(
    this.hour,
    this.precipitation,
    this.windSpeed0,
    this.windDirection0,
    this.windSpeed180,
    this.windDirection180,
    this.visibility,
    this.temperature,
  );

  factory HourForecast.fromJson(Map<String, dynamic> json) =>
      _$HourForecastFromJson(json);

  Map<String, dynamic> toJson() => _$HourForecastToJson(this);

  @override
  List<Object?> get props => [
        hour,
        precipitation,
        windSpeed0,
        windDirection0,
        windSpeed180,
        windDirection180,
        visibility,
        temperature,
      ];
}
