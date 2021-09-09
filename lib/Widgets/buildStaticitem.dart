import 'package:covid_stats/Themes/palette.dart';
import 'package:covid_stats/assets/CovidIcons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget buildStatisticItem(
    Color color, String title, String value, bool isCrona) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      Container(
        alignment: Alignment.center,
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          color: color.withOpacity(0.12),
          shape: BoxShape.circle,
        ),
        child: isCrona
            ? SvgPicture.asset(
                "lib/assets/images/virus.svg",
                height: 12,
                width: 12,
                color: color,
              )
            : Icon(
                CovidIcons.vaccine,
                color: color.withOpacity(0.5),
              ),
      ),
      SizedBox(
        width: 8,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 15.0,
                color: Colors.black38,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 5),
          Text(
            value,
            style: TextStyle(
                color: Palette.kmediumblack,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ],
  );
}
