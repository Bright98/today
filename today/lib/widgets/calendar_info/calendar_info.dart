import 'package:flutter/material.dart';
import 'package:shamsi_date/extensions.dart';
import 'package:today/functions/monthes.dart';
import 'package:today/functions/weekdays.dart';
import 'package:today/variables/colors.dart';
import 'package:today/widgets/widgets.dart';

class CalendarInfo extends StatefulWidget {
  CalendarInfo({Key? key}) : super(key: key);

  @override
  _CalendarInfoState createState() => _CalendarInfoState();
}

class _CalendarInfoState extends State<CalendarInfo> {
  Gregorian gregorianDate = Gregorian(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  String weekday = '';
  String day = '';
  String month = '';
  String year = '';
  String monthName = '';

  @override
  void initState() {
    super.initState();

    weekday = weekDays(DateTime.now().weekday);
    monthName = monthes(gregorianDate.toJalali().month);
    year = gregorianDate.toJalali().year.toString();
    month = gregorianDate.toJalali().month.toString();
    day = gregorianDate.toJalali().day.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TCard(
        color: primary,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    child: Text(
                      weekday,
                      style: TextStyle(
                        color: text,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    child: Text(
                      '$day $monthName $year',
                      style: TextStyle(
                        color: text,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '$day / $month / $year',
                  style: TextStyle(
                    color: text,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
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
