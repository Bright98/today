import 'package:flutter/material.dart';
import 'package:today/variables/colors.dart';

SnackBar tSnackbar(String title, icon) {
  return SnackBar(
    content: Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Icon(
            icon,
            color: warning,
          ),
        ),
        Text(
          title,
          style: TextStyle(
            color: warning,
            fontFamily: 'Shabnam',
          ),
        ),
      ],
    ),
    behavior: SnackBarBehavior.floating,
    backgroundColor: text,
    elevation: 0,
  );
}
