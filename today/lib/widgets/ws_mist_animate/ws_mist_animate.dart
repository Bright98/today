import 'package:flutter/material.dart';
import 'package:today/variables/colors.dart';

class MistAnimate extends StatefulWidget {
  MistAnimate({Key? key}) : super(key: key);

  @override
  _MistAnimateState createState() => _MistAnimateState();
}

class _MistAnimateState extends State<MistAnimate>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  double windPosition = 0.0;

  @override
  initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(
        seconds: 5,
      ),
      vsync: this,
      value: 0.1,
    )..repeat(reverse: true);

    _animation = Tween<double>(
      begin: 0.0,
      end: 10.0,
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
        windPosition = _animation.value;
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
      width: 80,
      height: 50,
      child: Stack(
        children: [
          Positioned(
            left: windPosition,
            child: Image.asset(
              'assets/images/fog.png',
              width: 50,
              color: text,
            ),
          ),
        ],
      ),
    );
  }
}
