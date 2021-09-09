import 'dart:convert' as convert;

import 'package:covid_stats/Core/Base/BaseClient.dart';
import 'package:covid_stats/Core/Base/HandleErrors.dart';
import 'package:covid_stats/Core/Model/PlacesModel.dart';

class GetParsedResponse with HandleErrors {
  final apikey = 'AIzaSyBaSoW8Y3pA9OKfwxjlMtGCkBI5TVIOiC8';

  Future<List<PlacesModelResults?>?> getParsedPlaces(
      double lat, double lng) async {
    var jsonresponse = await BaseClientService.get(
            'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$lat,$lng&type=hospital&rankby=distance&key=',
            apikey)
        .catchError(handleError);

    if (jsonresponse != null) {
      print('RESPONSE IS NOT NULL');
      var parsedresponse =
          PlacesModel.fromJson(convert.jsonDecode(jsonresponse));
      return parsedresponse.results;
    }

    return null;
  }
}
