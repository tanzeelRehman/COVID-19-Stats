import 'package:covid_stats/Themes/palette.dart';
import 'package:covid_stats/Widgets/buildStaticitem.dart';
import 'package:flutter/material.dart';

Widget buildProvince(String title, String count) {
  return Container(
    child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        margin: EdgeInsets.fromLTRB(15, 15, 15, 15),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                    color: Palette.kPrimaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              buildStatisticItem(Palette.statsconf, "Confirmed", count, true)
            ],
          ),
        )),
  );
}
