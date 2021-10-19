import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:today/functions/time_format.dart';
import 'package:today/models/day_or_night.dart';
import 'package:today/pages/calendar.dart';
import 'package:today/pages/sun_time.dart';
import 'package:today/pages/weather_items.dart';
import 'package:today/pages/wind_items.dart';
import 'package:today/variables/weather_variables.dart';
import 'package:today/widgets/widgets.dart';

class MainLayout extends StatefulWidget {
  WeatherVariable mainVariable;

  MainLayout({
    required this.mainVariable,
    Key? key,
  }) : super(key: key);

  @override
  _MainLayoutState createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  final _controller = PageController();

  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
      () => {
        Provider.of<DayOrNight>(context, listen: false).setDayOrNight(
          int.parse(widget.mainVariable.sunset),
          int.parse(widget.mainVariable.sunrise),
        ),
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          scrollDirection: Axis.vertical,
          controller: _controller,
          children: [
            MainLayoutPart(
              controller: _controller,
              child: Calendar(
                weatherStatus: widget.mainVariable.weatherStatus,
              ),
            ),
            MainLayoutPart(
              controller: _controller,
              child: WeatherItems(
                temperature: widget.mainVariable.temperature,
                humidity: widget.mainVariable.humidity,
                cold: int.parse(widget.mainVariable.temperature) < 5
                    ? true
                    : false,
              ),
            ),
            MainLayoutPart(
              controller: _controller,
              child: WindItems(
                windSpeed: widget.mainVariable.windSpeed,
                cloudNumber: widget.mainVariable.cloudNumber,
              ),
            ),
            MainLayoutPart(
              controller: _controller,
              child: Sun(
                sunrise: timeFormated(int.parse(widget.mainVariable.sunrise)),
                sunset: timeFormated(int.parse(widget.mainVariable.sunset)),
              ),
              lastPage: true,
            ),
          ],
        ),
      ),
    );
  }
}
