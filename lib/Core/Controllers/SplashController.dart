import 'dart:async';

import 'package:covid_stats/Screens/BottomBar.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Timer(Duration(seconds: 3), () => Get.off(() => BottomBar()));
  }
}
