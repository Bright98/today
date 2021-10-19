import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:today/variables/colors.dart';
import 'package:today/widgets/widgets.dart';

class Sun extends StatefulWidget {
  String sunset;
  String sunrise;

  Sun({
    Key? key,
    this.sunset = '0:0',
    this.sunrise = '0:0',
  }) : super(key: key);

  @override
  _SunState createState() => _SunState();
}

class _SunState extends State<Sun> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          CardContent(
            title: 'طلوع خورشید',
            value: widget.sunrise,
            unit: '',
            color: primary,
            animationPart: SunriseAnimate(),
          ),
          CardContent(
            title: 'غروب خورشید',
            value: widget.sunset,
            unit: '',
            color: primary,
            animationPart: SunsetAnimate(),
          ),
        ],
      ),
    );
  }
}
