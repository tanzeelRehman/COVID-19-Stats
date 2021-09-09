import 'package:covid_stats/Screens/BottombarController.dart';
import 'package:covid_stats/Screens/HomeScreen/HomeScreen.dart';
import 'package:covid_stats/Screens/MapScreen/MapScreen.dart';
import 'package:covid_stats/Screens/MoreScreen/MoreScreen.dart';
import 'package:covid_stats/Screens/StatsScreen/StatsScreen.dart';
import 'package:covid_stats/Screens/VaccinationScreen/VaccinationScreen.dart';
import 'package:covid_stats/Themes/palette.dart';
import 'package:covid_stats/assets/CovidIcons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomBar extends StatelessWidget {
  final BottombarController controller = Get.put(BottombarController());
  late final int selectedMenuItemId;
  final List screens = [
    HomeScreen(),
    StatsScreen(),
    VaccinationScreen(),
    MapScreen(),
    MoreScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    print('Bottombar is building');

    return MaterialApp(
      home: Scaffold(
          body: Obx(() => screens[controller.index.value]),
          bottomNavigationBar: Obx(
            () => SalomonBottomBar(
              currentIndex: controller.index.value,
              onTap: (i) {
                controller.index.value = i;
              },
              items: [
                //? HOME
                SalomonBottomBarItem(
                  icon: Icon(Icons.home),
                  title: Text("Home"),
                  selectedColor: Palette.kGradientColor1,
                ),

                //? STATS
                SalomonBottomBarItem(
                  icon: Icon(Icons.insert_chart),
                  title: Text("Stats"),
                  selectedColor: Palette.kGradientColor1,
                ),

                //? VACCINE
                SalomonBottomBarItem(
                  icon: Icon(CovidIcons.vaccine),
                  title: Text("Vaccien"),
                  selectedColor: Palette.kGradientColor1,
                ),

                //? HOSPITALS
                SalomonBottomBarItem(
                  icon: Icon(
                    Icons.local_hospital,
                    size: 25,
                  ),
                  title: Text("Hospitals"),
                  selectedColor: Palette.kGradientColor1,
                ),

                //? MORE
                SalomonBottomBarItem(
                  icon: Icon(Icons.more_vert),
                  title: Text("More"),
                  selectedColor: Palette.kGradientColor1,
                ),
              ],
            ),
          )),
    );
  }
}
