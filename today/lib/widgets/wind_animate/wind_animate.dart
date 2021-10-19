import 'dart:math';
import 'package:flutter/material.dart';
import 'package:today/variables/colors.dart';

class WindAnimate extends StatefulWidget {
  WindAnimate({
    Key? key,
  }) : super(key: key);

  @override
  _WindAnimateState createState() => _WindAnimateState();
}

class _WindAnimateState extends State<WindAnimate>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<double> _opacityAnimation;
  double windPosition = 0.0;
  double windOpacity = 0.0;

  @override
  initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(
        seconds: 4,
      ),
      vsync: this,
      value: 0.1,
    );

    _animation = Tween<double>(
      begin: 100.0,
      end: 50.0,
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

    _controller.forward();

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(
          0.0,
          1.0,
          curve: Curves.easeInOut,
        ),
      ),
    );

    _controller.addListener(() {
      setState(() {
        windPosition = _animation.value;
        windOpacity = _opacityAnimation.value;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 50,
      child: Stack(
        children: [
          Positioned(
            left: windPosition,
            child: Opacity(
              opacity: windOpacity,
              child: Transform(
                transform: Matrix4.rotationY(pi),
                child: Image.asset(
                  'assets/images/wind.png',
                  width: 50,
                  color: text,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
