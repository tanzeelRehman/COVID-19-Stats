import 'package:covid_stats/Core/Controllers/StatsController.dart';
import 'package:covid_stats/Screens/StatsScreen/Widgets/buildProvince.dart';
import 'package:covid_stats/Screens/StatsScreen/Widgets/buildStats.dart';
import 'package:covid_stats/Screens/StatsScreen/Widgets/builldlast24.dart';
import 'package:covid_stats/Themes/palette.dart';
import 'package:covid_stats/Widgets/CustomAppBar.dart';
import 'package:covid_stats/Widgets/HeaderBackground.dart';
import 'package:covid_stats/Widgets/ListViewAnimation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

class StatsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final StatsController statsController = Get.put(StatsController());

    return Scaffold(
        appBar: CustomAppBar(),
        backgroundColor: Palette.kBackgroundColor,
        body: Stack(
          children: [
            //?  HEADER BACKGROUND
            headerBackground(275),
            Obx(
              () => statsController.isloading.value
                  ? statsController.statsist.isNotEmpty
                      ? AnimationLimiter(
                          child: ListView(shrinkWrap: true, children: [
                            Container(
                              padding: EdgeInsets.only(top: 25),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16),
                                    child: Text(
                                      "STATISTICS",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 32,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 10),
                                    child: Text(
                                      'Last updated on - ${statsController.formattedDate}',
                                      style: TextStyle(
                                          color: Colors.yellow,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  listViewAnimation(
                                    BuildStats(),
                                  ),
                                  listViewAnimation(
                                    buildlast24(
                                      "Last 24",
                                      statsController.statsist[1],
                                    ),
                                  ),
                                  listViewAnimation(
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Expanded(
                                          child: buildProvince(
                                            "SINDH",
                                            statsController.statsist[2]?[0]
                                                    ['title'] ??
                                                "(No data)",
                                          ),
                                        ),
                                        Expanded(
                                          child: buildProvince(
                                            "KPK",
                                            statsController.statsist[2]?[1]
                                                    ['title'] ??
                                                "(No data)",
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  listViewAnimation(
                                    Row(
                                      children: [
                                        Expanded(
                                          child: buildProvince(
                                            "PUNJAB",
                                            statsController.statsist[2]?[2]
                                                    ['title'] ??
                                                "(No data)",
                                          ),
                                        ),
                                        Expanded(
                                          child: buildProvince(
                                            "ISLAMABAD",
                                            statsController.statsist[2]?[3]
                                                    ['title'] ??
                                                "(No data)",
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  listViewAnimation(Row(
                                    children: [
                                      Expanded(
                                        child: buildProvince(
                                          "BALOCHISTAN",
                                          statsController.statsist[2]?[4]
                                                  ['title'] ??
                                              "(No data)",
                                        ),
                                      ),
                                    ],
                                  ))
                                ],
                              ),
                            ),
                          ]),
                        )
                      : Container()
                  : Center(
                      child: CircularProgressIndicator(
                        color: Palette.kPrimaryColor,
                      ),
                    ),
            )
          ],
        ));
  }
}
