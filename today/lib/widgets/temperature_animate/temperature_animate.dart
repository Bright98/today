import 'package:flutter/material.dart';
import 'package:today/variables/colors.dart';

class TemperatureAnimate extends StatefulWidget {
  final bool cold;

  TemperatureAnimate({
    Key? key,
    this.cold = false,
  }) : super(key: key);

  @override
  _TemperatureAnimateState createState() => _TemperatureAnimateState();
}

class _TemperatureAnimateState extends State<TemperatureAnimate>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(
        milliseconds: 10000,
      ),
      vsync: this,
      value: 0.1,
    )..repeat(reverse: false);

    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.0,
          1.0,
          curve: Curves.linear,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: widget.cold ? 10 : 5,
          left: widget.cold ? 7 : 0,
          child: RotationTransition(
            turns: _animation,
            child: Image.asset(
              widget.cold ? 'assets/images/snow.png' : 'assets/images/sun.png',
              width: widget.cold ? 23 : 32,
              color: text,
            ),
          ),
        ),
        Positioned(
          child: Container(
            width: 20,
            height: 60,
            color: primary,
          ),
          top: 5,
          right: 7,
        ),
        Image.asset(
          'assets/images/thermometer.png',
          width: 20,
          color: text,
        ),
      ],
    );
  }
}
