import 'dart:async';

import 'package:covid_stats/Core/Dialog_Manager/DialogManager.dart';
import 'package:web_scraper/web_scraper.dart';

class StatsService {
  static final webScraper = WebScraper('https://covid.gov.pk');
  //? FOR COVID STATS
  // ignore: non_constant_identifier_names
  static List<Map<String, dynamic>>? all_cases;
  static List<Map<String, dynamic>>? last_24hours;
  // ignore: non_constant_identifier_names
  static List<Map<String, dynamic>>? province_cases;

  //? FOR VACCIEN STATS
  static List<Map<String, dynamic>>? allvaccien_cases;
  static List<Map<String, dynamic>>? lastvaccien_24hours;

  //? TIME LIMIT
  static int timelimit = 10;

  //? COVID GET STATS
  static Future<List<List<Map<String, dynamic>>?>?> getRequst() async {
    try {
      if (await webScraper
          .loadWebPage('/')
          .timeout(Duration(seconds: timelimit))) {
        all_cases = webScraper
            .getElement('div.status > ul > li > div > span.counter', ['class']);
        last_24hours =
            webScraper.getElement('div.new-cases > span > b ', ['b']);
        province_cases = webScraper
            .getElement('div.boxx > div.status-item > div', ['class']);
        last_24hours!.forEach((element) {});

        return [all_cases, last_24hours, province_cases];
      }
    } on TimeoutException {
      DialogManager.showErroDialog(
          title: 'Request Error',
          description: 'The server is taking longer than expected',
          message: 'Check your internet and try again');
    }
  }

  //? VCCIEN GET STATS
  static Future<List<List<Map<String, dynamic>>?>?> getVaccienRequst() async {
    try {
      if (await webScraper
          .loadWebPage('/')
          .timeout(Duration(seconds: timelimit))) {
        allvaccien_cases =
            webScraper.getElement('div.vacc_text > p.counter', ['tag']);
        lastvaccien_24hours = webScraper
            .getElement('div.vacc_text > p.last_hours > span', ['tag']);

        return [allvaccien_cases, lastvaccien_24hours];
      }
    } on TimeoutException {
      DialogManager.showErroDialog(
          title: 'Request Error',
          description: 'Server is taking longer than expected',
          message: 'Check your internet and try again');
    }
  }
}
