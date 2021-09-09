import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class DialogManager {
  //show error dialog
  static void showErroDialog(
      {String title = 'Error',
      String? description = 'Something went wrong',
      String? message = 'Please check your internet and then try again'}) {
    Get.defaultDialog(
      barrierDismissible: false,
      title: title,
      titleStyle: Get.textTheme.headline4,
      content: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              description!,
              style: TextStyle(color: Colors.red, fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              message!,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      onCancel: () =>
          SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
      textCancel: 'Okay',
      middleTextStyle: TextStyle(color: Colors.red),
      titlePadding: EdgeInsets.all(8.0),
    );
  }

  // Dialog(

  //       child: Padding(
  //         padding: const EdgeInsets.all(16.0),
  //         child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             Text(
  //               title,
  //               style: Get.textTheme.headline4,
  //             ),
  //             Text(
  //               description ?? '',
  //               style: Get.textTheme.headline6!.copyWith(color: Colors.red),
  //             ),
  //             SizedBox(
  //               height: 5.0,
  //             ),
  //             Text(
  //               message ?? '',
  //               style: TextStyle(fontSize: 15),
  //               textAlign: TextAlign.center,
  //             ),
  //             ElevatedButton(
  //               onPressed: () {
  //                 SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  //               },
  //               child: Text('Okay'),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),

  //show toast
  //show snack bar
  //show loading
  static void showLoading([String? message]) {
    Get.dialog(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 8),
              Text(message ?? 'Loading...'),
            ],
          ),
        ),
      ),
    );
  }

  //hide loading
  static void hideLoading() {
    if (Get.isDialogOpen!) Get.back();
  }
}
