import 'package:covid_stats/Core/Base/HandleErrors.dart';
import 'package:covid_stats/Core/Model/PlacesModel.dart';
import 'package:covid_stats/Core/Repository/ParsedResponse.dart';
import 'package:covid_stats/Core/Services/GeoLocationService.dart';
import 'package:covid_stats/Core/Services/GetMarkersService.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController extends GetxController with HandleErrors {
  final locator = GeoLocationService();
  Position? currentposition;
  late GetParsedResponse parsedResponse;
  late List<PlacesModelResults?> placeslist;
  var markers = <Marker>[];
  var isloading = true.obs;

  Future getCurrentPosition() async {
    //? GETTING LOCATION POSITION
    currentposition = await locator.getLocation();

    //? CREATING OBJ OF PARSING CLASS
    parsedResponse = new GetParsedResponse();

    //? GETTING NEARBY PLACES USING POSTION

    placeslist = (await parsedResponse.getParsedPlaces(
        currentposition!.latitude, currentposition!.longitude))!;

    //? GETTING MARKERS FOR PLACES
    markers = GetMarkerService.getMarkers(placeslist);

    //? HIDE LOADING
    hideLoading();
  }

  hideLoading() {
    isloading.toggle();
  }

  @override
  void onInit() {
    getCurrentPosition();

    super.onInit();
  }
}
