import 'package:covid_stats/Core/Services/LaunchService.dart';
import 'package:covid_stats/Util/ConnectionChecker.dart';
import 'package:covid_stats/Web/webViewScreen.dart';
import 'package:covid_stats/Widgets/RoundedBorderButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flip_card/flip_card.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Vaccination extends StatelessWidget {
  var _cinicvalue;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: 290,
      padding: const EdgeInsets.only(
          top: 25.0, left: 20.0, right: 20.0, bottom: 20.0),
      width: double.infinity,
      child: FlipCard(
          front: frontSide(context), back: backSide(context, screenWidth)),
    );
  }

  //? CARD FRONT SIDE

  Stack frontSide(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        Container(
            padding: EdgeInsets.only(
              // left side padding is 40% of total width
              left: MediaQuery.of(context).size.width * .35,
              top: 15,
              right: 20,
            ),
            height: 160,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF60BE93),
                  Color(0xFF1B8D59),
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(1, 1),
                  spreadRadius: 1,
                  blurRadius: 1,
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              "Tap to Register for Covid-19 Vaccination!",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            )),
        Padding(
          padding: const EdgeInsets.only(top: 5.0, left: 10.0),
          child: SvgPicture.asset("lib/assets/images/nurse.svg"),
        ),
      ],
    );
  }

  //? CARD BACK SIDE

  backSide(BuildContext context, double screenwidth) {
    return Container(
        padding: EdgeInsets.only(
          // left side padding is 40% of total width
          left: 15.0,
          top: 10.0,
          right: 8.0,
        ),
        //  height: 20,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF60BE93),
              Color(0xFF1B8D59),
            ],
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Wrap(
              alignment: WrapAlignment.spaceBetween,
              children: [
                Text(
                  "for Online Registration",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
                roundedTextButton(
                    label: "Click here",
                    function: () async {
                      if (await ConnectionChecker.checkConnection()) {
                        Get.to(() => WebViewScreen(
                              url: "https://nims.nadra.gov.pk/nims/",
                              title: "Online Vaccine registration",
                            ));
                      } else {
                        Get.defaultDialog(
                            title: "Can't Connect to internet",
                            titleStyle: TextStyle(color: Colors.red),
                            middleText:
                                "Opps! Something Went wrong\n Please check your Internet Connection",
                            titlePadding: EdgeInsets.all(8.0));
                      }
                    }),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Divider(
              color: Colors.white,
              height: 10.0,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "for Offline Registration",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
            ),
            SizedBox(
              height: 15.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                roundedBordertextfield(screenwidth),
                Flexible(
                  flex: 1,
                  child: roundedTextButton(
                      label: "Send SMS ",
                      function: () {
                        //! Add sms string
                        if (_formKey.currentState!.validate()) {
                          LaunchService.sendSms(_cinicvalue);
                        } else {}
                      }),
                )
              ],
            ),
          ],
        ));
  }

  //? TEXT FIELD

  Container roundedBordertextfield(double screenwidth) {
    return Container(
      width: screenwidth / 2,
      child: Form(
        key: _formKey,
        child: TextFormField(
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter CINIC';
            }
            return null;
          },
          onChanged: (cinic) {
            print(cinic);

            _cinicvalue = cinic;
          },
          cursorColor: Colors.white,
          keyboardType: TextInputType.number,
          style: TextStyle(color: Colors.white, fontSize: 20),
          decoration: InputDecoration(
              errorStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Colors.red),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide.none
                  //borderSide:const BorderSide(),
                  ),
              hintStyle:
                  TextStyle(color: Colors.white, fontFamily: "WorkSansLight"),
              filled: true,
              fillColor: Colors.white24,
              hintText: 'Enter cinic'),
        ),
      ),
    );
  }
}
