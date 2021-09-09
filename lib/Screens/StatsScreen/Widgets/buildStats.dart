import 'package:covid_stats/Core/Controllers/StatsController.dart';
import 'package:covid_stats/Core/Model/CovidStatsPie.dart';
import 'package:covid_stats/Screens/StatsScreen/PieChartScreen.dart';
import 'package:covid_stats/Themes/Styles.dart';
import 'package:covid_stats/Themes/palette.dart';
import 'package:covid_stats/Widgets/buildStaticitem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildStats extends StatelessWidget {
  late final List<CovidStatsPie> chartdata;

  final StatsController controller = Get.find<StatsController>();

  final List<Color> colorList = [
    Color(0xff347BD2),
    Color(0xffF77280),
    Color(0xff74B49A),
    Color(0xff00A8B5),
    Color(0xffF8B195),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        border: Border.all(color: Colors.white),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(1, 1),
            spreadRadius: 1,
            blurRadius: 1,
          ),
        ],
      ),
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Overall Cases in Pakistan",
              style: Styles.kTextHeadingStyle
                  .copyWith(color: Palette.kmediumblack),
            ),
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
                      controller.statsist[0]?[0]['title'], true),
                  SizedBox(
                    height: 15,
                  ),
                  buildStatisticItem(Palette.statsdead, "Deaths",
                      controller.statsist[0]?[1]['title'], true),
                  SizedBox(
                    height: 15,
                  ),
                  buildStatisticItem(Palette.statsrec, "Recovered",
                      controller.statsist[0]?[2]['title'], true),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildStatisticItem(Palette.statstest, "Total Tested",
                      controller.statsist[0]?[3]['title'], true),
                  SizedBox(
                    height: 15,
                  ),
                  buildStatisticItem(Palette.statscrit, "Critical Cases",
                      controller.statsist[0]?[4]['title'], true),
                ],
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              child: Text(
                "Tap to see more Statistical data",
                style: Styles.kCardTapStyle,
              ),
              onPressed: () {
                Get.to(() => PieChartScreen());
              },
            ),
          ),
        ],
      ),
    );
  }
}
