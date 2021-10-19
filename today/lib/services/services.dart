import 'dart:convert';
import 'package:http/http.dart' as http;

class Services {
  final weatherApiKey = 'b339b22bbd287c9802ce04985dca0f34';

  Future<dynamic> getWeather(String lat, String long) async {
    final url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$long&exclude=daily&appid=$weatherApiKey&units=metric');

    var res = await http.get(url);

    Map response = {
      'statusCode': res.statusCode,
      'body': json.decode(res.body),
    };

    return response;
  }
}
