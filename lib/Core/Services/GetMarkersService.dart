import 'package:covid_stats/Core/Model/PlacesModel.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GetMarkerService {
  static List<Marker> getMarkers(List<PlacesModelResults?> places) {
    var markers = <Marker>[];
    places.forEach((place) {
      Marker marker = Marker(
          markerId: MarkerId((place!.name)!),
          draggable: false,
          infoWindow: InfoWindow(title: place.name, snippet: place.vicinity),
          position: LatLng((place.geometry!.location!.lat)!,
              (place.geometry!.location!.lng)!));
      markers.add(marker);
    });
    return markers;
  }
}
