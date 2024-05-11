// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hour_forecast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HourForecast _$HourForecastFromJson(Map<String, dynamic> json) => HourForecast(
      (json['hour'] as num).toInt(),
      (json['precipitation'] as num).toInt(),
      (json['windSpeed0'] as num).toInt(),
      (json['windDirection0'] as num).toInt(),
      (json['windSpeed180'] as num).toInt(),
      (json['windDirection180'] as num).toInt(),
      (json['visibility'] as num).toInt(),
      (json['temperature'] as num).toInt(),
    );

Map<String, dynamic> _$HourForecastToJson(HourForecast instance) =>
    <String, dynamic>{
      'hour': instance.hour,
      'precipitation': instance.precipitation,
      'windSpeed0': instance.windSpeed0,
      'windDirection0': instance.windDirection0,
      'windSpeed180': instance.windSpeed180,
      'windDirection180': instance.windDirection180,
      'visibility': instance.visibility,
      'temperature': instance.temperature,
    };
