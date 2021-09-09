import 'package:covid_stats/Core/Dialog_Manager/DialogManager.dart';
import 'package:covid_stats/Core/Model/CovidStatsPie.dart';
import 'package:covid_stats/Core/Services/StatsServices.dart';
import 'package:covid_stats/Util/ConnectionChecker.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class StatsController extends GetxController {
  var statsist = <List<Map<String, dynamic>>?>[];
  var isloading = true.obs;

  late var formattedDate;

  getStats() async {
    statsist.clear();
    showLoading();
    if (await ConnectionChecker.checkConnection()) {
      //? GETTING SATS DATA
      statsist = (await StatsService.getRequst())!;

      //? FORMATTING CURRENT TIME
      formattedDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
      hideLoading();
    } else {
      hideLoading();
      DialogManager.showErroDialog(
          description: "No internet connection",
          message: 'Please turn on the internet\n and try again');
    }
  }

  List<CovidStatsPie> getDataForPie() {
    String? conf = statsist[0]?[0]['title'].replaceAll(",", "").toString();
    String? death = statsist[0]?[1]['title'].replaceAll(",", "").toString();
    String? rec = statsist[0]?[2]['title'].replaceAll(",", "").toString();
    String? crit = statsist[0]?[4]['title'].replaceAll(",", "").toString();

    List<CovidStatsPie> data = [
      CovidStatsPie(name: "Confirmed", value: int.parse(conf.toString())),
      CovidStatsPie(name: "Deaths", value: int.parse(death.toString())),
      CovidStatsPie(name: "Recovered", value: int.parse(rec.toString())),
      CovidStatsPie(name: "Critical", value: int.parse(crit.toString()))
    ];
    return data;
  }

  void showLoading() {
    isloading.toggle();
  }

  void hideLoading() {
    isloading.toggle();
  }

  @override
  void onInit() {
    if (statsist.isEmpty) {
      getStats();
    }

    super.onInit();
  }
}
