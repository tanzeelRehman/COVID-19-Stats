import 'package:covid_stats/Core/Controllers/VaccinationController.dart';
import 'package:covid_stats/Screens/VaccinationScreen/Widgets/Vaccination.dart';
import 'package:covid_stats/Themes/palette.dart';
import 'package:covid_stats/Widgets/CustomAppBar.dart';
import 'package:covid_stats/Widgets/HeaderBackground.dart';
import 'package:covid_stats/Widgets/ListViewAnimation.dart';
import 'package:covid_stats/Widgets/buildStaticitem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VaccinationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final VaccinationController vaccinationController =
        Get.put(VaccinationController());
    return Scaffold(
        appBar: CustomAppBar(),
        body: Stack(
          children: [
            headerBackground(200),
            Obx(() => vaccinationController.isloading.value
                ? vaccinationController.vaccienlist.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(
                          color: Palette.kPrimaryColor,
                        ),
                      )
                    : Container()
                : ListView(
                    shrinkWrap: true,
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 15),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                        text: "VACCINE STATISTICS\n",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 32)),
                                    TextSpan(
                                        text:
                                            "Vaccination provides a strong boost in protection in people who have recovered from COVID-19",
                                        style: TextStyle(fontSize: 17)),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 10),
                              child: Text(
                                'Last updated on - ${vaccinationController.formattedDate}',
                                style: TextStyle(
                                    color: Colors.yellow,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic),
                              ),
                            ),
                            listViewAnimation(
                              vacciencard(
                                  "Overall Dosage",
                                  vaccinationController.overalldose1,
                                  vaccinationController.overalldose2,
                                  vaccinationController.overalltotaldose),
                            ),
                            listViewAnimation(
                              vacciencard(
                                  "Last 24 Hours Dosage",
                                  vaccinationController.last24hourdose1,
                                  vaccinationController.last24hourdose2,
                                  vaccinationController.last24hourtotaldose),
                            ),
                            listViewAnimation(Vaccination()),
                          ],
                        ),
                      )
                    ],
                  ))
          ],
        ));
  }
}

Card vacciencard(
    String title, String? dose1, String? dose2, String? totaldosage) {
  return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.all(15),
      child: Padding(
        padding: EdgeInsets.all(15),
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
              height: 30,
            ),
            Wrap(
              alignment: WrapAlignment.spaceBetween,
              children: [
                buildStatisticItem(
                    Colors.blue, "Dose 1", dose1 ?? "(No data)", false),
                buildStatisticItem(
                    Colors.green, "Dose 2", dose2 ?? "(No data)", false),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            buildStatisticItem(Colors.purple, "Total Doses Administered",
                totaldosage ?? "(No data)", false),
          ],
        ),
      ));
}
