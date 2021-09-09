import 'package:covid_stats/Themes/palette.dart';
import 'package:covid_stats/Widgets/buildStaticitem.dart';
import 'package:flutter/material.dart';

Widget buildlast24(
  String title,
  List<Map<String, dynamic>>? last24,
) {
  return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.fromLTRB(15, 15, 15, 15),
      child: Padding(
        padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                  color: Palette.kPrimaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildStatisticItem(Palette.statsconf, "Confirmed",
                        last24?[0]['title'] ?? "(No data)", true),
                    SizedBox(
                      height: 15,
                    ),
                    buildStatisticItem(Palette.statsdead, "Deaths",
                        last24?[1]['title'] ?? "(No data)", true),
                    SizedBox(
                      height: 15,
                    ),
                    buildStatisticItem(Palette.statsrec, "Recovered",
                        last24?[2]['title'] ?? "(No data)", true),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildStatisticItem(Palette.statstest, "Tested",
                        last24?[3]['title'] ?? "(No data)", true),
                    SizedBox(
                      height: 15,
                    ),
                    buildStatisticItem(Palette.statscrit, "Critical",
                        last24?[4]['title'] ?? "(No data)", true),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ));
}
