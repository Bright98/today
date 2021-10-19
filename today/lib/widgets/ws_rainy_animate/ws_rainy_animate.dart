import 'package:flutter/material.dart';
import 'package:today/variables/colors.dart';

class RainyAnimate extends StatefulWidget {
  RainyAnimate({Key? key}) : super(key: key);

  @override
  _RainyAnimateState createState() => _RainyAnimateState();
}

class _RainyAnimateState extends State<RainyAnimate>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<double> _opacityAnimation;
  double rainPosition = 0.0;
  double rainOpacity = 0.0;

  @override
  initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(
        seconds: 4,
      ),
      vsync: this,
      value: 0.1,
    )..repeat(reverse: false);

    _animation = Tween<double>(
      begin: 30.0,
      end: 55.0,
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

    _opacityAnimation = Tween<double>(
      begin: 1.0,
      end: 0.0,
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

    _controller.addListener(() {
      setState(() {
        rainPosition = _animation.value;
        rainOpacity = _opacityAnimation.value;
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
      width: 60,
      height: 70,
      child: Stack(
        children: [
          Positioned(
            top: rainPosition,
            left: 15,
            child: Opacity(
              opacity: rainOpacity,
              child: Image.asset(
                'assets/images/drops.png',
                width: 30,
                color: text,
              ),
            ),
          ),
          Positioned(
            top: 15,
            child: Container(
              width: 60,
              height: 20,
              color: primary,
            ),
          ),
          Image.asset(
            'assets/images/cloud.png',
            width: 60,
            color: text,
          ),
        ],
      ),
    );
  }
}
