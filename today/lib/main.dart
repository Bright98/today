import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:today/models/day_or_night.dart';
import 'package:today/pages/loading.dart';
import 'package:today/services/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    Services services = Services();

    return MultiProvider(
      providers: [
        Provider.value(value: services),
        ChangeNotifierProvider(
          create: (context) => DayOrNight(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Today',
        theme: ThemeData(
          fontFamily: 'Shabnam',
        ),
        home: Directionality(
          textDirection: TextDirection.rtl,
          child: LoadingPage(),
        ),
      ),
    );
  }
}
