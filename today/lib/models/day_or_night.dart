import 'package:flutter/material.dart';

class DayOrNight extends ChangeNotifier {
  bool night = false;

  setDayOrNight(sunset, sunrise) {
    var _sunset = DateTime.fromMillisecondsSinceEpoch(sunset * 1000);
    var _sunrise = DateTime.fromMillisecondsSinceEpoch(sunrise * 1000);

    if (_sunrise.hour < DateTime.now().hour &&
        DateTime.now().hour < _sunset.hour) {
      night = false;
    } else {
      night = true;
    }

    notifyListeners();
  }
}
