import 'package:covid_stats/Core/Controllers/MapController.dart';
import 'package:covid_stats/Core/Services/LaunchService.dart';
import 'package:covid_stats/Themes/palette.dart';
import 'package:covid_stats/assets/CovidIcons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MapController mapController = Get.put(MapController());
    return SafeArea(
      child: Scaffold(
          body: Obx(
        () => mapController.isloading.value
            ? Center(
                child: CircularProgressIndicator(
                  color: Palette.kPrimaryColor,
                ),
              )
            : Column(children: [
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 3,
                        child: GoogleMap(
                          markers: Set<Marker>.of(mapController.markers),
                          initialCameraPosition: CameraPosition(
                              zoom: 16.0,
                              target: LatLng(
                                  mapController.currentposition!.latitude,
                                  mapController.currentposition!.longitude)),
                          zoomControlsEnabled: true,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: ListView.builder(
                            itemCount: mapController.placeslist.length,
                            itemBuilder: (context, index) {
                              return Card(
                                child: ListTile(
                                  trailing: IconButton(
                                      onPressed: () =>
                                          LaunchService.launchMapsUrl(
                                              mapController.placeslist[index]!
                                                  .geometry!.location!.lat,
                                              mapController.placeslist[index]!
                                                  .geometry!.location!.lng),
                                      icon: Icon(
                                        Icons.directions,
                                        color: Palette.kPrimaryColor,
                                      )),
                                  title: Row(
                                    children: [
                                      Icon(
                                        Icons.local_hospital,
                                        color: Palette.kmediumblack,
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Expanded(
                                        child: Text(
                                          mapController
                                                  .placeslist[index]!.name ??
                                              'No address specified',
                                          overflow: TextOverflow.visible,
                                        ),
                                      ),
                                    ],
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            CovidIcons.review,
                                            color: Palette.kmediumblack,
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          RatingBarIndicator(
                                            itemBuilder: (context, index) =>
                                                Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            rating: mapController
                                                    .placeslist[index]!
                                                    .rating ??
                                                0,
                                            itemCount: 5,
                                            itemSize: 15.0,
                                            direction: Axis.horizontal,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Divider(
                                        height: 5,
                                        color: Colors.black,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.location_on,
                                            color: Palette.kmediumblack,
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Expanded(
                                            child: Text(
                                                "${mapController.placeslist[0]!.vicinity}"),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            CovidIcons.clock,
                                            color: Palette.kmediumblack,
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          if ((mapController.placeslist[0]!
                                                  .openingHours?.openNow) ??
                                              false) ...[
                                            Text(
                                              'Open',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.green),
                                            )
                                          ] else ...[
                                            Text('Close',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.red))
                                          ],
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      )
                    ],
                  ),
                )
              ]),
      )),
    );
  }
}
