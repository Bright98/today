import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:today/variables/colors.dart';
import 'package:today/widgets/widgets.dart';

class WindItems extends StatefulWidget {
  String windSpeed;
  String cloudNumber;

  WindItems({
    Key? key,
    this.windSpeed = '0',
    this.cloudNumber = '0',
  }) : super(key: key);

  @override
  _WindItemsState createState() => _WindItemsState();
}

class _WindItemsState extends State<WindItems> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          CardContent(
            title: 'تعداد ابر',
            value: widget.cloudNumber,
            unit: '٪',
            color: primary,
            animationPart: CloudNumberAnimate(),
          ),
          CardContent(
            title: 'سرعت باد',
            value: widget.windSpeed,
            unit: 'متر بر ثانیه',
            color: primary,
            animationPart: WindAnimate(),
          ),
        ],
      ),
    );
  }
}
