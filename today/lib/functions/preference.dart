import 'package:shared_preferences/shared_preferences.dart';

getPreference(value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var data = prefs.getString(value);
  return data;
}

setPreference(key, value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return await prefs.setString(key, value);
}
