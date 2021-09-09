import 'package:covid_stats/Screens/SplashScreen.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: true,
        title: 'Covid-19 Stats and Care Pk',
        theme: ThemeData(
          primarySwatch: primarygreen,
        ),
        home: SplashScreen());
  }
}

Map<int, Color> color = {
  50: Color.fromRGBO(13, 142, 83, .1),
  100: Color.fromRGBO(13, 142, 83, .2),
  200: Color.fromRGBO(13, 142, 83, .3),
  300: Color.fromRGBO(13, 142, 83, .4),
  400: Color.fromRGBO(13, 142, 83, .5),
  500: Color.fromRGBO(13, 142, 83, .6),
  600: Color.fromRGBO(13, 142, 83, .7),
  700: Color.fromRGBO(13, 142, 83, .8),
  800: Color.fromRGBO(13, 142, 83, .9),
  900: Color.fromRGBO(13, 142, 83, 1),
};

MaterialColor primarygreen = MaterialColor(0xFF0D8E53, color);
