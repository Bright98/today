import 'package:flutter/material.dart';

class TCard extends StatelessWidget {
  final child;
  final Color color;

  TCard({
    Key? key,
    this.child,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 24.0,
      ),
      decoration: BoxDecoration(
        // color: accent,
        color: color,
        borderRadius: const BorderRadius.all(
          Radius.circular(20.0),
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 1),
            blurRadius: 8,
            color: color,
          ),
        ],
      ),
      child: child,
    );
  }
}
