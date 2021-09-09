import 'package:covid_stats/Core/Controllers/webViewScreenController.dart';
import 'package:covid_stats/Core/Dialog_Manager/DialogManager.dart';
import 'package:covid_stats/Themes/palette.dart';
import 'package:covid_stats/Util/ConnectionChecker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  final WebViewScreenController onlineVaccieneRegController =
      Get.put(WebViewScreenController());

  final String url;
  final String title;
  WebViewScreen({required this.url, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Palette.kPrimaryColor,
          title: Text(title),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                onlineVaccieneRegController.back();
              },
              icon: Icon(Icons.arrow_back_ios),
            ),
            IconButton(
              onPressed: () {
                onlineVaccieneRegController.forward();
              },
              icon: Icon(Icons.arrow_forward_ios),
            ),
            SizedBox(width: 10),
          ],
        ),
        body: Obx(() => ModalProgressHUD(
              inAsyncCall: onlineVaccieneRegController.isloading.value,
              child: WebView(
                  onWebResourceError: (webResourceError) =>
                      DialogManager.showErroDialog(
                          description: webResourceError.description),
                  key: Key("webview"),
                  initialUrl: url,
                  javascriptMode: JavascriptMode.unrestricted,
                  onWebViewCreated: (WebViewController webViewController) {
                    onlineVaccieneRegController.webController =
                        webViewController;
                  },
                  // onProgress: (_) async {
                  //   await Future.delayed(Duration(seconds: 10));
                  //   DialogManager.showErroDialog(
                  //       title: 'Request Error',
                  //       description: 'Server is taking longer than expected',
                  //       message: 'Check your internet and try again');
                  // },
                  onPageStarted: (_) async {
                    if (await ConnectionChecker.checkConnection() == false) {
                      DialogManager.showErroDialog(
                          description: "No internet connection",
                          message:
                              'Please turn on the internet\n and try again');
                    }
                  },
                  onPageFinished: (voidCallback) =>
                      onlineVaccieneRegController.isloading.value = false),
            )));
  }
}
