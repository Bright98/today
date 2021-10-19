class Response {
  final int statusCode;
  final Map<dynamic, dynamic> body;

  Response({
    this.statusCode = 0,
    required this.body,
  });
}
