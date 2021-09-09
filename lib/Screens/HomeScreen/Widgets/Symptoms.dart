import 'package:flutter/material.dart';

class Symptoms extends StatelessWidget {
  final double screenHeight;

  Symptoms({required this.screenHeight});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'Symptoms',
            style: const TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 15.0),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 100,
                      width: 110,
                      decoration: BoxDecoration(
                          color: Color(0xffCFFCDD),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(25))),
                      child: Image.asset('lib/assets/images/fever.png',
                          height: screenHeight * 0.12),
                    ),
                    SizedBox(height: screenHeight * 0.015),
                    Text(
                      "Fever",
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
                SizedBox(width: 15),
                Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 100,
                      width: 110,
                      decoration: BoxDecoration(
                          color: Color(0xffCFFCDD),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(25))),
                      child: Image.asset('lib/assets/images/breathing.png',
                          height: screenHeight * 0.12),
                    ),
                    SizedBox(height: screenHeight * 0.015),
                    Text(
                      "Difficult breath",
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
                SizedBox(width: 15),
                Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 100,
                      width: 110,
                      decoration: BoxDecoration(
                          color: Color(0xffCFFCDD),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(25))),
                      child: Image.asset('lib/assets/images/cough.png',
                          height: screenHeight * 0.12),
                    ),
                    SizedBox(height: screenHeight * 0.015),
                    Text(
                      "Coughing",
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
                SizedBox(width: 15),
                Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 100,
                      width: 110,
                      decoration: BoxDecoration(
                          color: Color(0xffCFFCDD),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(25))),
                      child: Image.asset(
                        'lib/assets/images/sore-throat.png',
                        height: screenHeight * 0.12,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.015),
                    Text(
                      "Sore throat",
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
