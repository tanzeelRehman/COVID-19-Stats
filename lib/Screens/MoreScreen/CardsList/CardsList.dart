import 'package:covid_stats/PDF/PdfScreen.dart';
import 'package:covid_stats/Themes/Styles.dart';
import 'package:covid_stats/Themes/palette.dart';
import 'package:covid_stats/Web/webViewScreen.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ! PRESS RELEASE ////////////////////////////////////////////////
//? CONTINUE

Container pressrelease() {
  return Container(
    margin: EdgeInsets.only(left: 10, right: 10, top: 5),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ExpansionTileCard(
        elevation: 15.0,
        initialElevation: 5.0,
        shadowColor: Colors.black,
        contentPadding: EdgeInsets.all(15.0),
        borderRadius: BorderRadius.all(Radius.circular(15)),
        title: Text(
          "Press Release",
          style: Styles.kTextHeadingStyle.copyWith(color: Palette.kblack),
        ),
        children: [
          Divider(
            thickness: 1.0,
            height: 1.0,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                      onPressed: () => Get.to(() =>
                          PdfScreen(asset: 'lib/assets/Docs/Results_from.pdf')),
                      child: Text(
                        "Results from sero-prevalence studies of preliminary nature should not be seen as",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Palette.kPrimaryColor,
                            fontSize: 17),
                      )),
                  TextButton(
                      onPressed: () => Get.to(() => PdfScreen(
                          asset: 'lib/assets/Docs/18million_lost.pdf')),
                      child: Text(
                        "Over 18 million people to lose jobs amid lockdown in Pakistan",
                        style: TextStyle(
                            color: Palette.kPrimaryColor,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      )),
                  Divider(
                    thickness: 1.0,
                    height: 1.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: Text(
                      "Click on the title to see details",
                      style: Styles.kCardTapStyle,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}

// !  TRAVEL POLICIES ////////////////////////////////////////////////
//? CONTINUE

Container travelpolicies() {
  return Container(
    margin: EdgeInsets.only(left: 10, right: 10, top: 5),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ExpansionTileCard(
        elevation: 15.0,
        initialElevation: 5.0,
        shadowColor: Colors.black,
        contentPadding: EdgeInsets.all(15.0),
        borderRadius: BorderRadius.all(Radius.circular(15)),
        title: Text(
          "Air Travel",
          style: Styles.kTextHeadingStyle.copyWith(color: Palette.kblack),
        ),
        children: [
          Divider(
            thickness: 1.0,
            height: 1.0,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                      onPressed: () => Get.to(
                          () => PdfScreen(asset: 'lib/assets/Docs/CPFT.pdf')),
                      child: Text(
                        "Current Travel Policies",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Palette.kPrimaryColor,
                            fontSize: 17),
                      )),
                  TextButton(
                      onPressed: () => Get.to(() => WebViewScreen(
                          title: "Guidelines for Air Travel",
                          url:
                              "https://covid.gov.pk/intl_travellers/guidelines_for_travellers")),
                      child: Text(
                        "Guidelines for Air Travel",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Palette.kPrimaryColor,
                            fontSize: 17),
                      )),
                  Divider(
                    thickness: 1.0,
                    height: 1.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: Text(
                      "Click on the title to see details",
                      style: Styles.kCardTapStyle,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}

// !  FACALITIES ////////////////////////////////////////////////
//? CONTINUE

Container facilities() {
  return Container(
    margin: EdgeInsets.only(left: 10, right: 10, top: 5),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ExpansionTileCard(
        elevation: 15.0,
        initialElevation: 5.0,
        shadowColor: Colors.black,
        contentPadding: EdgeInsets.all(15.0),
        borderRadius: BorderRadius.all(Radius.circular(15)),
        title: Text(
          "Facilities",
          style: Styles.kTextHeadingStyle.copyWith(color: Palette.kblack),
        ),
        children: [
          Divider(
            thickness: 1.0,
            height: 1.0,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                      onPressed: () => Get.to(() => PdfScreen(
                          asset: 'lib/assets/Docs/list_of_hospitals.pdf')),
                      child: Text(
                        "Desiginated teritary Hospitals",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Palette.kPrimaryColor,
                            fontSize: 17),
                      )),
                  TextButton(
                      onPressed: () => Get.to(() => PdfScreen(
                          asset: 'lib/assets/Docs/hospital_isoloation.pdf')),
                      child: Text(
                        "Hospitals Isolation Wards",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Palette.kPrimaryColor,
                            fontSize: 17),
                      )),
                  TextButton(
                      onPressed: () => Get.to(() => PdfScreen(
                          asset: 'lib/assets/Docs/quarantien_facilites.pdf')),
                      child: Text(
                        "Quarantine Facilities",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Palette.kPrimaryColor,
                            fontSize: 17),
                      )),
                  TextButton(
                      onPressed: () => Get.to(() => PdfScreen(
                          asset: 'lib/assets/Docs/testing_labortories.pdf')),
                      child: Text(
                        "Testing Facilities Pakistan",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Palette.kPrimaryColor,
                            fontSize: 17),
                      )),
                  Divider(
                    thickness: 1.0,
                    height: 1.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: Text(
                      "Click on the title to see details",
                      style: Styles.kCardTapStyle,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}

// !  PUBLIC SERVICE MESSAGE ////////////////////////////////////////////////
//? CONTINUE
Container psm() {
  return Container(
    margin: EdgeInsets.only(left: 10, right: 10, top: 5),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ExpansionTileCard(
        elevation: 15.0,
        initialElevation: 5.0,
        shadowColor: Colors.black,
        contentPadding: EdgeInsets.all(15.0),
        borderRadius: BorderRadius.all(Radius.circular(15)),
        title: Text(
          "PSM",
          style: Styles.kTextHeadingStyle.copyWith(color: Palette.kblack),
        ),
        children: [
          Divider(
            thickness: 1.0,
            height: 1.0,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                      onPressed: () => Get.to(() => WebViewScreen(
                          title: "Public Service message",
                          url: "https://covid.gov.pk/public_service_message")),
                      child: Text(
                        "Public Service Message",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Palette.kPrimaryColor,
                            fontSize: 17),
                      )),
                  Divider(
                    thickness: 1.0,
                    height: 1.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: Text(
                      "Click on the title to see details",
                      style: Styles.kCardTapStyle,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}

// !  GUIDLINES ////////////////////////////////////////////////
//? CONTINUE
Container guidlines() {
  return Container(
    margin: EdgeInsets.only(left: 10, right: 10, top: 5),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ExpansionTileCard(
        elevation: 15.0,
        initialElevation: 5.0,
        shadowColor: Colors.black,
        contentPadding: EdgeInsets.all(15.0),
        borderRadius: BorderRadius.all(Radius.circular(15)),
        title: Text(
          "Guidelines",
          style: Styles.kTextHeadingStyle.copyWith(color: Palette.kblack),
        ),
        children: [
          Divider(
            thickness: 1.0,
            height: 1.0,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                      onPressed: () => Get.to(() => WebViewScreen(
                          title: "Guidelines",
                          url: "https://covid.gov.pk/guideline")),
                      child: Text(
                        "Guidelines for Citizens",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Palette.kPrimaryColor,
                            fontSize: 17),
                      )),
                  Divider(
                    thickness: 1.0,
                    height: 1.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: Text(
                      "Click on the title to see details",
                      style: Styles.kCardTapStyle,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}

// !  COVID-19 ////////////////////////////////////////////////
//? CONTINUE
Container covid19() {
  return Container(
    margin: EdgeInsets.only(left: 10, right: 10, top: 5),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ExpansionTileCard(
        elevation: 15.0,
        initialElevation: 5.0,
        shadowColor: Colors.black,
        contentPadding: EdgeInsets.all(15.0),
        borderRadius: BorderRadius.all(Radius.circular(15)),
        title: Text(
          "Covid-19",
          style: Styles.kTextHeadingStyle.copyWith(color: Palette.kblack),
        ),
        children: [
          Divider(
            thickness: 1.0,
            height: 1.0,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                      onPressed: () => Get.to(() => WebViewScreen(
                          title: "Covid-19 Info",
                          url: "https://covid.gov.pk/covid19")),
                      child: Text(
                        "What is Covid-19 and how to Prevent",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Palette.kPrimaryColor,
                            fontSize: 17),
                      )),
                  Divider(
                    thickness: 1.0,
                    height: 1.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: Text(
                      "Click on the title to see details",
                      style: Styles.kCardTapStyle,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}
