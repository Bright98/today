import 'package:today/variables/weather_status.dart';

class WeatherVariable {
  String sunset;
  String sunrise;
  String temperature;
  String humidity;
  String windSpeed;
  String cloudNumber;
  Weather weatherStatus;

  WeatherVariable({
    this.sunset = '0',
    this.sunrise = '0',
    this.temperature = '0',
    this.humidity = '0',
    this.windSpeed = '0',
    this.cloudNumber = '0',
    required this.weatherStatus,
  });
}
