// https://openweathermap.org/weather-conditions#Weather-Condition-Codes-2

class WeatherStatus {
  int id;
  WeatherStatusType status;

  WeatherStatus({
    this.id = 0,
    this.status = WeatherStatusType.sunny,
  });
}

class Weather {
  WeatherStatusType status;
  String name;
  var icon;

  Weather({
    this.name = '',
    this.status = WeatherStatusType.sunny,
    this.icon,
  });
}

List<WeatherStatus> weatherList = [
  // group: Thunderstorm
  WeatherStatus(
    id: 200,
    status: WeatherStatusType.storm,
  ),
  WeatherStatus(
    id: 201,
    status: WeatherStatusType.storm,
  ),
  WeatherStatus(
    id: 202,
    status: WeatherStatusType.storm,
  ),
  WeatherStatus(
    id: 210,
    status: WeatherStatusType.storm,
  ),
  WeatherStatus(
    id: 211,
    status: WeatherStatusType.storm,
  ),
  WeatherStatus(
    id: 212,
    status: WeatherStatusType.storm,
  ),
  WeatherStatus(
    id: 221,
    status: WeatherStatusType.storm,
  ),
  WeatherStatus(
    id: 230,
    status: WeatherStatusType.storm,
  ),
  WeatherStatus(
    id: 231,
    status: WeatherStatusType.storm,
  ),
  WeatherStatus(
    id: 232,
    status: WeatherStatusType.storm,
  ),

  // group: Drizzle
  WeatherStatus(
    id: 300,
    status: WeatherStatusType.rainy,
  ),
  WeatherStatus(
    id: 301,
    status: WeatherStatusType.rainy,
  ),
  WeatherStatus(
    id: 302,
    status: WeatherStatusType.heavyRainy,
  ),
  WeatherStatus(
    id: 310,
    status: WeatherStatusType.heavyRainy,
  ),
  WeatherStatus(
    id: 311,
    status: WeatherStatusType.heavyRainy,
  ),
  WeatherStatus(
    id: 312,
    status: WeatherStatusType.heavyRainy,
  ),
  WeatherStatus(
    id: 313,
    status: WeatherStatusType.heavyRainy,
  ),
  WeatherStatus(
    id: 314,
    status: WeatherStatusType.heavyRainy,
  ),
  WeatherStatus(
    id: 321,
    status: WeatherStatusType.heavyRainy,
  ),

  // group: Rain
  WeatherStatus(
    id: 500,
    status: WeatherStatusType.rainy,
  ),
  WeatherStatus(
    id: 501,
    status: WeatherStatusType.rainy,
  ),
  WeatherStatus(
    id: 502,
    status: WeatherStatusType.rainy,
  ),
  WeatherStatus(
    id: 503,
    status: WeatherStatusType.rainy,
  ),
  WeatherStatus(
    id: 504,
    status: WeatherStatusType.rainy,
  ),
  WeatherStatus(
    id: 511,
    status: WeatherStatusType.snowy,
  ),
  WeatherStatus(
    id: 520,
    status: WeatherStatusType.heavyRainy,
  ),
  WeatherStatus(
    id: 521,
    status: WeatherStatusType.heavyRainy,
  ),
  WeatherStatus(
    id: 522,
    status: WeatherStatusType.heavyRainy,
  ),
  WeatherStatus(
    id: 531,
    status: WeatherStatusType.heavyRainy,
  ),

  // group: Snow
  WeatherStatus(
    id: 600,
    status: WeatherStatusType.snowy,
  ),
  WeatherStatus(
    id: 601,
    status: WeatherStatusType.snowy,
  ),
  WeatherStatus(
    id: 602,
    status: WeatherStatusType.heavySnowy,
  ),
  WeatherStatus(
    id: 611,
    status: WeatherStatusType.heavySnowy,
  ),
  WeatherStatus(
    id: 612,
    status: WeatherStatusType.heavySnowy,
  ),
  WeatherStatus(
    id: 613,
    status: WeatherStatusType.heavySnowy,
  ),
  WeatherStatus(
    id: 615,
    status: WeatherStatusType.heavySnowy,
  ),
  WeatherStatus(
    id: 616,
    status: WeatherStatusType.heavySnowy,
  ),
  WeatherStatus(
    id: 620,
    status: WeatherStatusType.heavySnowy,
  ),
  WeatherStatus(
    id: 621,
    status: WeatherStatusType.heavySnowy,
  ),
  WeatherStatus(
    id: 622,
    status: WeatherStatusType.heavySnowy,
  ),

  // group: Atmosphere
  WeatherStatus(
    id: 701,
    status: WeatherStatusType.mist,
  ),
  WeatherStatus(
    id: 711,
    status: WeatherStatusType.mist,
  ),
  WeatherStatus(
    id: 721,
    status: WeatherStatusType.mist,
  ),
  WeatherStatus(
    id: 731,
    status: WeatherStatusType.sunny,
  ),
  WeatherStatus(
    id: 741,
    status: WeatherStatusType.sunny,
  ),
  WeatherStatus(
    id: 751,
    status: WeatherStatusType.mist,
  ),
  WeatherStatus(
    id: 761,
    status: WeatherStatusType.mist,
  ),
  WeatherStatus(
    id: 762,
    status: WeatherStatusType.mist,
  ),
  WeatherStatus(
    id: 771,
    status: WeatherStatusType.mist,
  ),
  WeatherStatus(
    id: 781,
    status: WeatherStatusType.mist,
  ),

  // group: clear
  WeatherStatus(
    id: 800,
    status: WeatherStatusType.sunny,
  ),

  // group: Clouds
  WeatherStatus(
    id: 801,
    status: WeatherStatusType.partlyCloudy,
  ),
  WeatherStatus(
    id: 802,
    status: WeatherStatusType.cloudy,
  ),
  WeatherStatus(
    id: 803,
    status: WeatherStatusType.heavyCloudy,
  ),
  WeatherStatus(
    id: 804,
    status: WeatherStatusType.heavyCloudy,
  ),
];

enum WeatherStatusType {
  sunny,
  partlyCloudy,
  cloudy,
  heavyCloudy,
  snowy,
  heavySnowy,
  rainy,
  heavyRainy,
  storm,
  mist,
}
