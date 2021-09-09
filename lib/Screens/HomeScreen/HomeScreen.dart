import 'package:covid_stats/Screens/HomeScreen/Widgets/DrawerHeader.dart';
import 'package:covid_stats/Screens/HomeScreen/Widgets/Header.dart';
import 'package:covid_stats/Screens/HomeScreen/Widgets/PreventionTips.dart';
import 'package:covid_stats/Screens/HomeScreen/Widgets/Symptoms.dart';
import 'package:covid_stats/Widgets/CustomAppBar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      drawer: Drawer(
        elevation: 0.0,
        child: SingleChildScrollView(
          child: Column(
            children: [drawerHeader(context), myDrawerList()],
          ),
        ),
      ),
      appBar: CustomAppBar(),
      body: Column(
        children: [
          Expanded(
            child: RepaintBoundary(
              child: ListView(
                children: [
                  HomeScreenHeader(screenHeight: screenHeight),
                  PreventationTips(screenHeight: screenHeight),
                  Symptoms(screenHeight: screenHeight),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
