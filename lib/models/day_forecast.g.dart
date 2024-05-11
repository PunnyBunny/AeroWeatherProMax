// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_forecast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DayForecast _$DayForecastFromJson(Map<String, dynamic> json) => DayForecast(
      (json['year'] as num).toInt(),
      (json['month'] as num).toInt(),
      (json['day'] as num).toInt(),
      $enumDecode(_$WeatherEnumEnumMap, json['weather']),
      (json['hourly'] as List<dynamic>)
          .map((e) => HourForecast.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DayForecastToJson(DayForecast instance) =>
    <String, dynamic>{
      'year': instance.year,
      'month': instance.month,
      'day': instance.day,
      'weather': _$WeatherEnumEnumMap[instance.weather]!,
      'hourly': instance.hourForecasts,
    };

const _$WeatherEnumEnumMap = {
  WeatherEnum.clear: 'clear',
  WeatherEnum.partlyCloudy: 'partly_cloudy',
  WeatherEnum.cloudy: 'cloudy',
  WeatherEnum.fog: 'fog',
  WeatherEnum.lightRain: 'light_rain',
  WeatherEnum.rain: 'rain',
  WeatherEnum.thunderstorm: 'thunderstorm',
  WeatherEnum.snow: 'snow',
  WeatherEnum.hail: 'hail',
  WeatherEnum.sleet: 'sleet',
  WeatherEnum.wind: 'wind',
  WeatherEnum.unknown: 'unknown',
};
