import 'dart:collection';
import 'package:today/variables/response.dart';

Response getData(data) {
  Map<dynamic, dynamic> map = HashMap.from(data as Map);
  Map<dynamic, dynamic> body = HashMap.from(map['body'] as Map);
  Response response = Response(
    statusCode: map['statusCode'],
    body: body,
  );
  return response;
}
