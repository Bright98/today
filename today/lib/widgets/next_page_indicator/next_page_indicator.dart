import 'package:flutter/material.dart';
import 'package:today/variables/colors.dart';

class NextPageIndicator extends StatefulWidget {
  final controller;

  NextPageIndicator({
    Key? key,
    this.controller,
  }) : super(key: key);

  @override
  _NextPageIndicatorState createState() => _NextPageIndicatorState();
}

class _NextPageIndicatorState extends State<NextPageIndicator>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  double indicatorPosition = 0.0;

  @override
  initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(
        seconds: 3,
      ),
      vsync: this,
      value: 0.1,
    )..repeat(reverse: false);

    _animation = Tween<double>(
      begin: 5.0,
      end: 20.0,
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
        indicatorPosition = _animation.value;
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
    return Material(
      color: accent,
      borderRadius: const BorderRadius.all(
        Radius.circular(50.0),
      ),
      child: InkWell(
        borderRadius: const BorderRadius.all(
          Radius.circular(50.0),
        ),
        onTap: () {
          widget.controller.nextPage(
            duration: const Duration(milliseconds: 400),
            curve: Curves.linear,
          );
        },
        splashColor: Colors.white.withOpacity(0.4),
        child: Container(
          height: 50.0,
          width: 35.0,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(50.0),
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: indicatorPosition,
                child: RotatedBox(
                  quarterTurns: 1,
                  child: Icon(
                    Icons.chevron_left_rounded,
                    color: text,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
