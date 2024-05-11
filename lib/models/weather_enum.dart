import 'package:json_annotation/json_annotation.dart';

@JsonEnum()
enum WeatherEnum {
  @JsonValue('clear')
  clear,
  @JsonValue('partly_cloudy')
  partlyCloudy,
  @JsonValue('cloudy')
  cloudy,
  @JsonValue('fog')
  fog,
  @JsonValue('light_rain')
  lightRain,
  @JsonValue('rain')
  rain,
  @JsonValue('thunderstorm')
  thunderstorm,
  @JsonValue('snow')
  snow,
  @JsonValue('hail')
  hail,
  @JsonValue('sleet')
  sleet,
  @JsonValue('wind')
  wind,
  @JsonValue('unknown')
  unknown,
}
