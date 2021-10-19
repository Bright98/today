String weekDays(int day) {
  String weekday = '';

  switch (day) {
    case 1:
      weekday = '۲شنبه';
      break;
    case 2:
      weekday = '۳شنبه';
      break;
    case 3:
      weekday = '۴شنبه';
      break;
    case 4:
      weekday = '۵شنبه';
      break;
    case 5:
      weekday = 'جمعه';
      break;
    case 6:
      weekday = 'شنبه';
      break;
    case 7:
      weekday = '۱شنبه';
      break;
    default:
      weekday = 'شنبه';
      break;
  }

  return weekday;
}
