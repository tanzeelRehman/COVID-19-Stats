import 'dart:io';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreenController extends GetxController {
  var isloading = true.obs;
  late WebViewController webController;
  final url = "";

  showLoading() {
    isloading.toggle();
  }

  hideLoading() {
    isloading.toggle();
  }

  back() async {
    if (await webController.canGoBack()) {
      await webController.goBack();
    }
  }

  forward() async {
    if (await webController.canGoForward()) {
      await webController.goForward();
    }
  }

  @override
  void onInit() {
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    super.onInit();
  }
}
