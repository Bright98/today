String timeFormated(int timestamp) {
  var _timestamp = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  String time = '${_timestamp.minute} :${_timestamp.hour}';

  return time;
}
