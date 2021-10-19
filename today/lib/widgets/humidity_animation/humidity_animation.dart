import 'package:flutter/material.dart';
import 'package:today/variables/colors.dart';

class HumidityAnimation extends StatefulWidget {
  HumidityAnimation({Key? key}) : super(key: key);

  @override
  _HumidityAnimationState createState() => _HumidityAnimationState();
}

class _HumidityAnimationState extends State<HumidityAnimation>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _dropController;
  late Animation<double> _animation;
  late Animation<double> _dropAnimationOpacity;
  late Animation<double> _dropAnimationPosition;
  var dropOpacity = 0.0;
  var dropPosition = 0.0;

  @override
  initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(
        seconds: 12,
      ),
      vsync: this,
      value: 0.1,
    )..repeat(reverse: true);

    _dropController = AnimationController(
      duration: const Duration(
        seconds: 2,
      ),
      vsync: this,
      value: 0.1,
    );

    _dropController.forward();

    _animation = Tween<double>(
      begin: -0.12,
      end: 0.36,
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

    _dropAnimationPosition = Tween<double>(
      begin: 20,
      end: 30,
    ).animate(
      CurvedAnimation(
        parent: _dropController,
        curve: const Interval(
          0.3,
          1.0,
          curve: Curves.linear,
        ),
      ),
    );

    _dropAnimationOpacity = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _dropController,
        curve: const Interval(
          0.4,
          1.0,
          curve: Curves.linear,
        ),
      ),
    );

    _dropController.addListener(() {
      setState(() {
        dropOpacity = _dropAnimationOpacity.value;
        dropPosition = _dropAnimationPosition.value;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _dropController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 14,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Image.asset(
            'assets/images/clock.png',
            width: 60,
            color: text,
          ),
          Positioned(
            bottom: 6,
            right: 28,
            child: RotationTransition(
              turns: _animation,
              alignment: const Alignment(0.7, 0.7),
              child: Image.asset(
                'assets/images/hand.png',
                width: 16,
                color: text,
              ),
            ),
          ),
          Positioned(
            top: dropPosition,
            left: 55,
            child: Opacity(
              opacity: dropOpacity,
              child: Image.asset(
                'assets/images/drop.png',
                width: 15,
                color: text,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
