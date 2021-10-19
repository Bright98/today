import 'package:flutter/material.dart';
import 'package:today/variables/colors.dart';

import '../widgets.dart';

class SunriseAnimate extends StatefulWidget {
  SunriseAnimate({Key? key}) : super(key: key);

  @override
  _SunriseAnimateState createState() => _SunriseAnimateState();
}

class _SunriseAnimateState extends State<SunriseAnimate>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _rotationController;
  late Animation<double> _animation;
  late Animation<double> _rotationAnimation;
  double sunPosition = 0.0;

  @override
  initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(
        seconds: 6,
      ),
      vsync: this,
      value: 0.1,
    );

    _controller.forward();

    _rotationController = AnimationController(
      duration: const Duration(
        seconds: 30,
      ),
      vsync: this,
      value: 0.1,
    )..repeat(reverse: false);

    _animation = Tween<double>(
      begin: 50.0,
      end: 25.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.0,
          1.0,
          curve: Curves.easeInOut,
        ),
      ),
    );

    _rotationAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _rotationController,
        curve: const Interval(
          0.0,
          1.0,
          curve: Curves.linear,
        ),
      ),
    );

    _controller.addListener(() {
      setState(() {
        sunPosition = _animation.value;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 20,
      ),
      height: 50.0,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            top: sunPosition,
            child: RotationTransition(
              turns: _rotationAnimation,
              child: Image.asset(
                'assets/images/sun.png',
                width: 40,
                color: text,
              ),
            ),
          ),
          CustomPaint(
            painter: Line(),
            size: const Size(80, 0),
          ),
        ],
      ),
    );
  }
}
