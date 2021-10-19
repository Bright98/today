import 'package:flutter/material.dart';
import 'package:today/variables/colors.dart';

class StormAnimate extends StatefulWidget {
  StormAnimate({Key? key}) : super(key: key);

  @override
  _StormAnimateState createState() => _StormAnimateState();
}

class _StormAnimateState extends State<StormAnimate>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  double rainOpacity = 0.0;

  @override
  initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(
        seconds: 3,
      ),
      vsync: this,
      value: 0.1,
    )..repeat(reverse: true);

    _opacityAnimation = Tween<double>(
      begin: 1.0,
      end: 0.0,
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

    _controller.addListener(() {
      setState(() {
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
      width: 70,
      height: 60,
      child: Stack(
        children: [
          Positioned(
            left: 30,
            top: 38,
            child: Opacity(
              opacity: rainOpacity,
              child: Image.asset(
                'assets/images/lighting.png',
                width: 10,
                color: text,
              ),
            ),
          ),
          Image.asset(
            'assets/images/clouds.png',
            width: 70,
            color: text,
          ),
        ],
      ),
    );
  }
}
