export 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:today/variables/colors.dart';

class Line extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = text
      ..strokeWidth = 2;
    canvas.drawLine(
      const Offset(0.0, 0.0),
      Offset(size.width, 0.0),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
