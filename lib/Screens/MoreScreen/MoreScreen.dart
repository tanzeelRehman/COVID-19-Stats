import 'package:covid_stats/Screens/MoreScreen/CardsList/CardsList.dart';
import 'package:covid_stats/Widgets/CustomAppBar.dart';
import 'package:covid_stats/Widgets/HeaderBackground.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class MoreScreen extends StatelessWidget {
  final GlobalKey<ExpansionTileCardState> cardA = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Stack(
        children: [
          headerBackground(200),
          AnimationLimiter(
            child: ListView(
              children: [
                AnimationConfiguration.staggeredList(
                  duration: const Duration(milliseconds: 375),
                  position: 0,
                  child: SlideAnimation(
                    verticalOffset: 50.0,
                    child: FadeInAnimation(
                      child: covid19(),
                    ),
                  ),
                ),
                AnimationConfiguration.staggeredList(
                  duration: const Duration(milliseconds: 375),
                  position: 1,
                  child: SlideAnimation(
                    verticalOffset: 50.0,
                    child: FadeInAnimation(
                      child: pressrelease(),
                    ),
                  ),
                ),
                AnimationConfiguration.staggeredList(
                  duration: const Duration(milliseconds: 375),
                  position: 2,
                  child: SlideAnimation(
                    verticalOffset: 50.0,
                    child: FadeInAnimation(
                      child: travelpolicies(),
                    ),
                  ),
                ),
                AnimationConfiguration.staggeredList(
                  duration: const Duration(milliseconds: 375),
                  position: 3,
                  child: SlideAnimation(
                    verticalOffset: 50.0,
                    child: FadeInAnimation(
                      child: facilities(),
                    ),
                  ),
                ),
                AnimationConfiguration.staggeredList(
                  duration: const Duration(milliseconds: 375),
                  position: 4,
                  child: SlideAnimation(
                    verticalOffset: 50.0,
                    child: FadeInAnimation(
                      child: psm(),
                    ),
                  ),
                ),
                AnimationConfiguration.staggeredList(
                  duration: const Duration(milliseconds: 375),
                  position: 5,
                  child: SlideAnimation(
                    verticalOffset: 50.0,
                    child: FadeInAnimation(
                      child: guidlines(),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
