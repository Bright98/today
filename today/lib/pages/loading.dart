import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:today/functions/preference.dart';
import 'package:today/functions/reaponse.dart';
import 'package:today/functions/weather_status.dart';
import 'package:today/pages/main_layout.dart';
import 'package:today/services/services.dart';
import 'package:today/variables/colors.dart';
import 'package:today/variables/response.dart';
import 'package:today/variables/weather_variables.dart';
import 'package:today/widgets/line/line.dart';
import 'package:today/widgets/widgets.dart';

class LoadingPage extends StatefulWidget {
  LoadingPage({Key? key}) : super(key: key);

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  var currentLat;
  var currentLong;
  var tehranLat = 35.6892;
  var tehranLong = 51.3890;

  Future<void> getCurrentLocation() async {
    try {
      await Geolocator.requestPermission().then(
        (permission) async => {
          if (permission == LocationPermission.denied ||
              permission == LocationPermission.deniedForever)
            {
              // set Tehran lat long
              setState(() {
                currentLat = tehranLat;
                currentLong = tehranLong;
              }),
              _wrongLocationSnackbar(),
            }
          else
            {
              await Geolocator.getCurrentPosition(
                      desiredAccuracy: LocationAccuracy.best)
                  .then(
                (current) => {
                  setState(
                    () {
                      currentLat = current.latitude;
                      currentLong = current.longitude;
                    },
                  ),
                },
              ),
            },
        },
      );
      return;
    } catch (e) {
      // set tehran lat long
      setState(() {
        currentLat = tehranLat;
        currentLong = tehranLong;
      });
      _wrongLocationSnackbar();
      return;
    }
  }

  _wrongLocationSnackbar() {
    return ScaffoldMessenger.of(context).showSnackBar(
      tSnackbar(
        'موقعیت مکانی شما برای شهر تهران فعال شد!',
        Icons.info_outline,
      ),
    );
  }

  startApp() async {
    var first = await getPreference('first');
    if (first == 'yes') {
      getCurrentLocation();
    } else {
      _showDialog();
    }
  }

  _showDialog() async {
    await Future.delayed(Duration.zero);
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          child: TDialog(
            title:
                'برای دسترسی به وضعیت آب‌وهوا دسترسی به موقعیت مکانی شما نیاز است.',
            btnClick: () {
              setPreference('first', 'yes');
              getCurrentLocation();
              Navigator.pop(context);
            },
          ),
          onWillPop: () {
            return Future.value(false);
          },
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    if (mounted) {
      startApp();
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/clouds.png',
                width: 170,
                color: text,
              ),
              if (currentLat != null)
                Padding(
                  padding: const EdgeInsets.only(
                    top: 80,
                  ),
                  child: FutureBuilder(
                    future: Provider.of<Services>(context).getWeather(
                        currentLat.toString(), currentLong.toString()),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        Response data = getData(snapshot.data);

                        if (data.statusCode == 200) {
                          WeatherVariable mainVariables = WeatherVariable(
                            sunrise: data.body['current']['sunrise'].toString(),
                            sunset: data.body['current']['sunset'].toString(),
                            temperature:
                                data.body['current']['temp'].floor().toString(),
                            humidity: data.body['current']['humidity']
                                .floor()
                                .toString(),
                            windSpeed: data.body['current']['wind_speed']
                                .floor()
                                .toString(),
                            cloudNumber: data.body['current']['clouds']
                                .floor()
                                .toString(),
                            weatherStatus: weatherStaus(
                                data.body['current']['weather'][0]['id']),
                          );

                          return Button(
                            child: Text(
                              'شروع',
                              style: TextStyle(
                                color: text,
                                fontFamily: 'Shabnam',
                              ),
                            ),
                            click: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) {
                                    return Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: MainLayout(
                                        mainVariable: mainVariables,
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          );
                        } else {
                          return Center(
                            child: Center(
                              child: CircularProgressIndicator(
                                color: text,
                                strokeWidth: 2,
                              ),
                            ),
                          );
                        }
                      }

                      return Center(
                        child: Center(
                          child: CircularProgressIndicator(
                            color: text,
                            strokeWidth: 2,
                          ),
                        ),
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
