import 'package:covid_stats/Core/Services/LaunchService.dart';
import 'package:covid_stats/Themes/palette.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

Widget drawerHeader(BuildContext context) {
  return Container(
    color: Palette.kPrimaryColor,
    width: double.infinity,
    padding: EdgeInsets.only(top: 20.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            margin: EdgeInsets.only(bottom: 10),
            height: 150,
            child: Image(
              image: AssetImage('lib/assets/images/AppIcon.png'),
            )),
        Text(
          "Covid-19 Stats & Care Pk",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            "Develop by Tanzeel ur Rehman",
            style: TextStyle(
                color: Colors.yellow[600],
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    ),
  );
}

Widget myDrawerList() {
  return Container(
    padding: EdgeInsets.only(
      top: 15,
    ),
    child: Column(
      // shows the list of menu drawer
      children: [
        menuItem('Terms and Conditions', Icons.check_circle_outline, () {
          LaunchService.launchmywebsiteurl(
              'https://sites.google.com/view/covid19-statsandcarepakistan/terms-and-conditions?authuser=0');
        }),
        menuItem('Privacy Policy', Icons.privacy_tip_outlined, () {
          LaunchService.launchmywebsiteurl(
              'https://sites.google.com/view/covid19-statsandcarepakistan/privacy-policy?authuser=0');
        }),
        menuItem('About', Icons.info_outline_rounded, () {
          Get.dialog(AboutDialog(
            applicationVersion: '1.0.1',
            applicationName: 'Covid-19 Stats & Care Pk',
            children: [
              SingleChildScrollView(
                  child: Column(children: [
                Text(
                    'Pakistan first Covid-19 app which is made to provide you all the essential services for corona, like Covid stats, Vaccination stats, Vaccination Registration, Nearby hospitals, Public service message, Travel Guide, And much more.'),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'All the documents used in this app are the property of Government offical website covid.gov.pk',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                RichText(
                  text: TextSpan(
                      text:
                          'if you want to remove any sensitive or copyrighted data from my app, please feel free to contact me on my email.\n',
                      style: TextStyle(color: Colors.black, fontSize: 15),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Tanzeel.rehman481@gmail.com',
                          style: TextStyle(
                              color: Palette.kPrimaryColor,
                              fontWeight: FontWeight.bold),
                        )
                      ]),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: TextButton(
                      onPressed: () {
                        LaunchService.launchmywebsiteurl(
                            'https://sites.google.com/view/covid19-statsandcarepakistan/home');
                      },
                      child: Text('Read more')),
                )
              ])),
            ],
            applicationIcon: Image(
              height: 100,
              image: AssetImage('lib/assets/images/AppIcon.png'),
            ),
          ));
        }),
        menuItem('Exite', Icons.exit_to_app_outlined, () {
          SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        }),
      ],
    ),
  );
}

Widget menuItem(String title, IconData icon, VoidCallback ontap) {
  return Material(
    child: InkWell(
      onTap: ontap,
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Row(
          children: [
            Expanded(
              child: Icon(
                icon,
                size: 20,
                color: Palette.kPrimaryColor,
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
