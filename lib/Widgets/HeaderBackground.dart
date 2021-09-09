import 'package:covid_stats/Themes/palette.dart';
import 'package:flutter/material.dart';

Container headerBackground(double height) {
  return Container(
    height: height,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color(0xFF60BE93),
          Color(0xFF1B8D59),
        ],
      ),
      color: Palette.kPrimaryColor,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(35),
        bottomRight: Radius.circular(35),
      ),
    ),
    padding: EdgeInsets.only(top: 25),
  );
}
