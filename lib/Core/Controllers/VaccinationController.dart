import 'package:covid_stats/Core/Dialog_Manager/DialogManager.dart';
import 'package:covid_stats/Core/Services/StatsServices.dart';
import 'package:covid_stats/Util/ConnectionChecker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class VaccinationController extends GetxController {
  var vaccienlist = <List<Map<String, dynamic>>?>[];
  var isloading = true.obs;

  String? overalldose1;
  String? overalldose2;
  String? overalltotaldose;

  String? last24hourdose1;
  String? last24hourdose2;
  String? last24hourtotaldose;

  var formattedDate;

  getStats() async {
    vaccienlist.clear();

    if (await ConnectionChecker.checkConnection()) {
      //? GETTING LIST OF ALL DATA
      vaccienlist = (await StatsService.getVaccienRequst())!;

      formattedDate = DateFormat('dd-MM-yyyy').format(DateTime.now());

      //? ASSIGINING VALUES TO OVERALL DATA
      overalldose1 = vaccienlist[0]?[0]['title'];
      overalldose2 = vaccienlist[0]?[1]['title'];
      overalltotaldose = vaccienlist[0]?[2]['title'];

      //? ASSIGINING VALUES TO LAST 24 HOURS DATA
      last24hourdose1 = vaccienlist[1]?[0]['title'];
      last24hourdose2 = vaccienlist[1]?[1]['title'];
      last24hourtotaldose = vaccienlist[1]?[2]['title'];
      hideLoading();
    } else {
      hideLoading();
      DialogManager.showErroDialog(
          description: "No internet connection",
          message: 'Please turn on the internet\n and try again');
    }
  }

  void hideLoading() {
    isloading.toggle();
  }

  @override
  void onInit() {
    if (vaccienlist.isEmpty) {
      getStats();
    }

    super.onInit();
  }
}
