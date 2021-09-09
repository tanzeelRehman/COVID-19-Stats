import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:covid_stats/Core/Base/Exceptions.dart';
import 'package:http/http.dart' as http;

class BaseClientService {
  static const int time_out_duration = 10;
  static Future<dynamic> get(String baseurl, String api) async {
    var url = Uri.parse(baseurl + api);

    try {
      var response =
          await http.get(url).timeout(Duration(seconds: time_out_duration));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', url.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'Server taking longer time then usual', url.toString());
    }
  }
}

dynamic _processResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      var responseJson = utf8.decode(response.bodyBytes);
      return responseJson;
      // ignore: dead_code
      break;
    case 201:
      var responseJson = utf8.decode(response.bodyBytes);
      return responseJson;
      // ignore: dead_code
      break;
    case 400:
      throw BadRequestException(
          utf8.decode(response.bodyBytes), response.request!.url.toString());
    case 401:
    case 403:
      throw UnAuthorizedException(
          utf8.decode(response.bodyBytes), response.request!.url.toString());
    case 422:
      throw BadRequestException(
          utf8.decode(response.bodyBytes), response.request!.url.toString());
    case 500:
    default:
      throw FetchDataException(
          'Error occured with code : ${response.statusCode}',
          response.request!.url.toString());
  }
}
