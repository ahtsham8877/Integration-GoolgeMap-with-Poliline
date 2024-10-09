import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:get/get.dart';
import 'package:goolemap_poliline/controller/map_controller.dart';

// ignore: must_be_immutable
class GoogleMapSc extends StatefulWidget {
  int index;
  GoogleMapSc({this.index = 0});

  @override
  State<GoogleMapSc> createState() => _GoogleMapState();
}

class _GoogleMapState extends State<GoogleMapSc> {
  final mainGoogleMapController = Get.put(MainGoogleMapController());
  static const LatLng _initialPosition = LatLng(31.4644, 74.2425);
  late MapType _currentMapType;

  @override
  void initState() {
    super.initState();
    _currentMapType = MapType.normal;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => GoogleMap(
            mapType: _currentMapType,
            onMapCreated: mainGoogleMapController.onMapCreated,
            initialCameraPosition: const CameraPosition(
              target: _initialPosition,
              zoom: 14,
            ),
            myLocationEnabled: true,
            markers: Set<Marker>.of(mainGoogleMapController.list),
            polylines: Set<Polyline>.of(mainGoogleMapController.polylines),
            circles: {
              Circle(
                circleId: const CircleId('1'),
                center: LatLng(
                    mainGoogleMapController
                        .list[mainGoogleMapController.mapIndex.value]
                        .position
                        .latitude,
                    mainGoogleMapController
                        .list[mainGoogleMapController.mapIndex.value]
                        .position
                        .longitude),
                radius: 460,
                strokeWidth: 1,
                fillColor: Colors.blue.withOpacity(0.2),
              )
            },
            compassEnabled: false,
          )),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 120),
        child: FloatingActionButton(
          shape: const CircleBorder(),
          elevation: 0,
          backgroundColor: const Color.fromARGB(146, 226, 173, 112),
          onPressed: () {
            Get.defaultDialog(
                titlePadding: const EdgeInsets.only(top: 16),
                title: "Choose Mode!".toUpperCase(),
                titleStyle:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                content: Column(
                  children: [
                    Column(children: [
                      IconButton(
                          onPressed: () {
                            _toggleMapType();
                          },
                          icon: const Icon(Icons.location_on)),
                      const Text(
                        "Hybride Mode!",
                      )
                    ]),
                    Column(
                      children: [
                        IconButton(
                            onPressed: () {
                              _satellitee();
                            },
                            icon: const Icon(Icons.maps_home_work_rounded)),
                        const Text(
                          "Satellitee Mode!",
                        )
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                            onPressed: () {
                              _terrain();
                            },
                            icon: const Icon(Icons.local_airport)),
                        const Text(
                          "terrain Mode!",
                        )
                      ],
                    )
                  ],
                ));
          },
          child: const Icon(Icons.zoom_out_map_outlined),
        ),
      ),
    );
  }

  void _toggleMapType() {
    setState(() {
      _currentMapType =
          (_currentMapType == MapType.normal) ? MapType.hybrid : MapType.normal;
    });
  }

  void _satellitee() {
    setState(() {
      _currentMapType = (_currentMapType == MapType.normal)
          ? MapType.satellite
          : MapType.normal;
    });
  }

  void _terrain() {
    setState(() {
      _currentMapType = (_currentMapType == MapType.normal)
          ? MapType.terrain
          : MapType.normal;
    });
  }
}
