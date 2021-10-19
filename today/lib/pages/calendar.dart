import 'package:flutter/material.dart';
import 'package:today/variables/colors.dart';
import 'package:today/variables/weather_status.dart';
import 'package:today/widgets/line/line.dart';
import 'package:today/widgets/widgets.dart';

class Calendar extends StatefulWidget {
  Weather weatherStatus;

  Calendar({
    Key? key,
    required this.weatherStatus,
  }) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CalendarInfo(),
          CardContent(
            title: 'وضعیت هوا',
            value: widget.weatherStatus.name,
            unit: '',
            color: primary,
            textValue: true,
            animationPart: widget.weatherStatus.icon,
          ),
        ],
      ),
    );
  }
}
