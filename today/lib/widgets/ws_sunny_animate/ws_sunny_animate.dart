import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:today/models/day_or_night.dart';
import 'package:today/variables/colors.dart';

class SunnyAnimate extends StatefulWidget {
  SunnyAnimate({Key? key}) : super(key: key);

  @override
  _SunnyAnimateState createState() => _SunnyAnimateState();
}

class _SunnyAnimateState extends State<SunnyAnimate>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late AnimationController _nightController;
  late Animation<double> _nightAnimation;
  double moonPosition = 0.0;

  @override
  initState() {
    super.initState();

    // day animation
    _controller = AnimationController(
      duration: const Duration(
        seconds: 15,
      ),
      vsync: this,
      value: 0.1,
    )..repeat();

    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
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

    // night animation
    _nightController = AnimationController(
      duration: const Duration(
        seconds: 4,
      ),
      vsync: this,
      value: 0.1,
    )..repeat(reverse: true);

    _nightAnimation = Tween<double>(
      begin: 0.0,
      end: 8.0,
    ).animate(
      CurvedAnimation(
        parent: _nightController,
        curve: const Interval(
          0.0,
          1.0,
          curve: Curves.easeInOut,
        ),
      ),
    );

    _nightController.addListener(() {
      setState(() {
        moonPosition = _nightAnimation.value;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _nightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DayOrNight>(
      builder: (context, data, child) {
        return data.night
            ? SizedBox(
                width: 80,
                height: 35,
                child: Stack(
                  children: [
                    Positioned(
                      left: moonPosition,
                      child: Image.asset(
                        'assets/images/moon.png',
                        width: 35,
                        color: text,
                      ),
                    ),
                  ],
                ),
              )
            : Stack(
                children: [
                  RotationTransition(
                    turns: _animation,
                    child: Image.asset(
                      'assets/images/sun.png',
                      width: 40,
                      color: text,
                    ),
                  ),
                ],
              );
      },
    );
  }
}
