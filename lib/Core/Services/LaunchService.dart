import 'package:covid_stats/Core/Dialog_Manager/DialogManager.dart';
import 'package:url_launcher/url_launcher.dart';

class LaunchService {
  static void call() => launch("tel:1166");

  static void sendSms(String message) => launch(
        "sms:1166?body=$message",
      );

  static launchMapsUrl(double? lat, double? lng) async {
    final url = 'https://www.google.com/maps/search/?api=1&query=$lat,$lng';
    await canLaunch(url)
        ? await launch(url)
        : DialogManager.showErroDialog(
            description: 'Something went wrong, Cant launch Google maps');
  }

  static launchmywebsiteurl(final String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      DialogManager.showErroDialog(
          description: 'Something went wrong, Cant open webpage');
    }
  }
}
