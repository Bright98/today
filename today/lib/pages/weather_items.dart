import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:today/variables/colors.dart';
import 'package:today/widgets/widgets.dart';

class WeatherItems extends StatefulWidget {
  final bool cold;
  String temperature;
  String humidity;

  WeatherItems({
    Key? key,
    this.cold = false,
    this.temperature = '0',
    this.humidity = '0',
  }) : super(key: key);

  @override
  _WeatherItemsState createState() => _WeatherItemsState();
}

class _WeatherItemsState extends State<WeatherItems> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          CardContent(
            title: 'دما',
            value: widget.temperature,
            unit: 'درجه',
            color: primary,
            animationPart: TemperatureAnimate(
              cold: widget.cold,
            ),
          ),
          CardContent(
            title: 'رطوبت',
            value: widget.humidity,
            unit: '٪',
            color: primary,
            animationPart: HumidityAnimation(),
          ),
        ],
      ),
    );
  }
}
