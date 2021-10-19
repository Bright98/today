import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:today/models/day_or_night.dart';
import 'package:today/variables/weather_status.dart';
import 'package:today/widgets/widgets.dart';

String weatherStatusName(status) {
  String statusName = '';

  switch (status) {
    case WeatherStatusType.sunny:
      statusName = 'صاف';
      break;
    case WeatherStatusType.partlyCloudy:
      statusName = 'نیمه ابری';
      break;
    case WeatherStatusType.cloudy:
      statusName = 'ابری';
      break;
    case WeatherStatusType.heavyCloudy:
      statusName = 'ابری';
      break;
    case WeatherStatusType.snowy:
      statusName = 'برفی';
      break;
    case WeatherStatusType.heavySnowy:
      statusName = 'برف شدید';
      break;
    case WeatherStatusType.rainy:
      statusName = 'بارانی';
      break;
    case WeatherStatusType.heavyRainy:
      statusName = 'باران شدید';
      break;
    case WeatherStatusType.storm:
      statusName = 'صاعقه / طوفان';
      break;
    case WeatherStatusType.mist:
      statusName = 'غبار';
      break;
    default:
      statusName = 'صاف';
      break;
  }

  return statusName;
}

Widget weatherStatusIcon(status) {
  Widget statusName = Container();

  switch (status) {
    case WeatherStatusType.sunny:
      statusName = SunnyAnimate();
      break;
    case WeatherStatusType.partlyCloudy:
      statusName = PartlyCloudyAnimate();
      break;
    case WeatherStatusType.cloudy:
      statusName = CloudyAnimate();
      break;
    case WeatherStatusType.heavyCloudy:
      statusName = HeavyCloudyAnimate();
      break;
    case WeatherStatusType.snowy:
      statusName = SnowyAnimate();
      break;
    case WeatherStatusType.heavySnowy:
      statusName = HeavySnowyAnimate();
      break;
    case WeatherStatusType.rainy:
      statusName = RainyAnimate();
      break;
    case WeatherStatusType.heavyRainy:
      statusName = HeavyRainyAnimate();
      break;
    case WeatherStatusType.storm:
      statusName = StormAnimate();
      break;
    case WeatherStatusType.mist:
      statusName = MistAnimate();
      break;
    default:
      statusName = SunnyAnimate();
      break;
  }

  return statusName;
}

Weather weatherStaus(id) {
  for (int i = 0; i < weatherList.length; i++) {
    if (id == weatherList[i].id) {
      return Weather(
        status: weatherList[i].status,
        name: weatherStatusName(weatherList[i].status),
        icon: weatherStatusIcon(weatherList[i].status),
      );
    }
  }

  return Weather(
    status: WeatherStatusType.sunny,
    name: weatherStatusName(WeatherStatusType.sunny),
    icon: weatherStatusIcon(WeatherStatusType.snowy),
  );
}
