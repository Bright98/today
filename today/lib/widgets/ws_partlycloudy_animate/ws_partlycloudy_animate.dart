import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:today/models/day_or_night.dart';
import 'package:today/variables/colors.dart';

class PartlyCloudyAnimate extends StatefulWidget {
  PartlyCloudyAnimate({Key? key}) : super(key: key);

  @override
  _PartlyCloudyAnimateState createState() => _PartlyCloudyAnimateState();
}

class _PartlyCloudyAnimateState extends State<PartlyCloudyAnimate>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  initState() {
    super.initState();

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
    return Consumer<DayOrNight>(builder: (context, data, child) {
      return Container(
        margin: const EdgeInsets.only(top: 15),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            data.night
                ? Positioned(
                    top: -15,
                    left: 5,
                    child: Image.asset(
                      'assets/images/moon.png',
                      width: 30,
                      color: text,
                    ),
                  )
                : Positioned(
                    top: -15,
                    left: 5,
                    child: RotationTransition(
                      turns: _animation,
                      child: Image.asset(
                        'assets/images/sun.png',
                        width: 30,
                        color: text,
                      ),
                    ),
                  ),
            Positioned(
              top: 1,
              left: 17,
              child: Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  color: primary,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(50.0),
                  ),
                ),
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
    });
  }
}
