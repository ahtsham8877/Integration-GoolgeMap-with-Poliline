import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MainGoogleMapController extends GetxController {
  RxDouble markerLatitude = 37.7749.obs;
  RxDouble markerLongitude = 122.4194.obs;
  final ScrollController scrollController = ScrollController();
  var mapIndex = 0.obs;
  List<Marker> list = [];
  RxSet<Polyline> polylines = <Polyline>{}.obs;

  @override
  void onInit() {
    super.onInit();
    list = [
      Marker(
        markerId: const MarkerId('1'),
        position: const LatLng(31.4644, 74.2425),
        infoWindow: const InfoWindow(title: "First"),
        onTap: () {
          scrollController.animateTo(0,
              duration: const Duration(milliseconds: 100),
              curve: Curves.bounceInOut);
        },
      ),
      Marker(
        markerId: const MarkerId('2'),
        position: const LatLng(31.4525, 74.2245),
        infoWindow: const InfoWindow(title: "Second"),
        onTap: () {
          scrollController.animateTo(370,
              duration: const Duration(milliseconds: 100),
              curve: Curves.bounceInOut);
        },
      ),
      Marker(
        markerId: const MarkerId('3'),
        position: const LatLng(31.4425, 74.2426),
        infoWindow: const InfoWindow(title: "Third"),
        onTap: () {
          scrollController.animateTo(740,
              duration: const Duration(milliseconds: 500),
              curve: Curves.bounceInOut);
        },
      ),
      Marker(
        markerId: const MarkerId('4'),
        position: const LatLng(31.4800, 74.2700),
        infoWindow: const InfoWindow(title: "Fourth"),
        onTap: () {
          scrollController.animateTo(1110,
              duration: const Duration(milliseconds: 100),
              curve: Curves.bounceInOut);
        },
      ),
      Marker(
        markerId: const MarkerId('5'),
        position: const LatLng(31.4725, 74.2926),
        infoWindow: const InfoWindow(title: "Fifth"),
        onTap: () {
          scrollController.animateTo(1480,
              duration: const Duration(milliseconds: 100),
              curve: Curves.bounceInOut);
        },
      ),
      Marker(
        markerId: const MarkerId('6'),
        position: const LatLng(31.4798, 74.2925),
        infoWindow: const InfoWindow(title: "Sixth"),
        onTap: () {
          scrollController.animateTo(1850,
              duration: const Duration(milliseconds: 100),
              curve: Curves.bounceInOut);
        },
      ),
      Marker(
        markerId: const MarkerId('7'),
        position: const LatLng(31.4434, 74.3425),
        infoWindow: const InfoWindow(title: "Seventh"),
        onTap: () {
          scrollController.animateTo(2220,
              duration: const Duration(milliseconds: 100),
              curve: Curves.bounceInOut);
        },
      ),
      Marker(
        markerId: const MarkerId('8'),
        position: const LatLng(31.4844, 74.2625),
        infoWindow: const InfoWindow(title: "Ahtsham's Home Eighth"),
        onTap: () {
          scrollController.animateTo(2590,
              duration: const Duration(milliseconds: 100),
              curve: Curves.bounceInOut);
        },
      ),
    ];

    _createPolyline(list[0].position, list[1].position);
  }

  Rx<Marker?> currentMarker = Rx<Marker?>(null);
  GoogleMapController? mapController;

  void setCurrentMarker(int index) {
    if (index >= 0 && index < list.length) {
      // Check if the selected marker is the same as the current marker
      if (currentMarker.value?.markerId.value == list[index].markerId.value) {
        // If it's the same marker, remove existing polyline and create a new one
        _removePolyline(); // Remove existing polyline before creating a new one
        _createPolyline(list[0].position, list[index].position);
        print("Selected the same marker again. Polyline recreated.");
      } else {
        currentMarker.value = list[index];
        mapController?.animateCamera(
          CameraUpdate.newLatLng(list[index].position),
        );

        _removePolyline();
        _createPolyline(list[0].position, list[index].position);
        print("State has changed to a new marker.");
      }
      update();
    }
  }

  void onMapCreated(GoogleMapController googleMapController) {
    mapController = googleMapController;
  }

  void _createPolyline(LatLng start, LatLng end) {
    final polyline = Polyline(
      polylineId: PolylineId(
          'polyline_${DateTime.now().millisecondsSinceEpoch}'), // Unique ID for each polyline
      points: [start, end],
      color: Colors.blue,
      width: 5,
    );
    polylines.add(polyline);
  }

  void _removePolyline() {
    polylines.clear(); // Clear existing polylines before creating a new one
  }
}


// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';
// import 'package:permission_handler/permission_handler.dart';

// class MainGoogleMapController extends GetxController {
//   RxDouble markerLatitude = 37.7749.obs;
//   RxDouble markerLongitude = 122.4194.obs;
//   final ScrollController scrollController = ScrollController();
//   var mapIndex = 0.obs;
//   List<Marker> list = [];

//   @override
//   void onInit() {
//     list = [
//        Marker(
      //     markerId: const MarkerId('1'),
      //     position: const LatLng(31.4644, 74.2425),
      //     infoWindow: const InfoWindow(title: "First"),
      //     onTap: () {
      //       scrollController.animateTo(0,
      //           duration: const Duration(milliseconds: 100),
      //           curve: Curves.bounceInOut);
      //     }),
      // Marker(
      //     markerId: const MarkerId('2'),
      //     position: const LatLng(31.4525, 74.2245),
      //     infoWindow: const InfoWindow(title: "second "),
      //     onTap: () {
      //       scrollController.animateTo(370,
      //           duration: const Duration(milliseconds: 100),
      //           curve: Curves.bounceInOut);
      //     }),
      // Marker(
      //     markerId: const MarkerId('3'),
      //     position: const LatLng(31.4425, 74.2426),
      //     infoWindow: const InfoWindow(title: "3rd"),
      //     onTap: () {
      //       scrollController.animateTo(740,
      //           duration: const Duration(milliseconds: 500),
      //           curve: Curves.bounceInOut);
      //     }),
      // Marker(
      //     markerId: const MarkerId('4'),
      //     position: const LatLng(31.4555, 74.2426),
      //     infoWindow: const InfoWindow(title: "4th"),
      //     onTap: () {
      //       scrollController.animateTo(1110,
      //           duration: const Duration(milliseconds: 100),
      //           curve: Curves.bounceInOut);
      //     }),
      // Marker(
      //     markerId: const MarkerId('5'),
      //     position: const LatLng(31.4725, 74.2926),
      //     infoWindow: const InfoWindow(title: "5th"),
      //     onTap: () {
      //       scrollController.animateTo(1480,
      //           duration: const Duration(milliseconds: 100),
      //           curve: Curves.bounceInOut);
      //     }),
      // Marker(
      //     markerId: const MarkerId('6'),
      //     position: const LatLng(31.4798, 74.2925),
      //     infoWindow: const InfoWindow(title: "6th"),
      //     onTap: () {
      //       scrollController.animateTo(1850,
      //           duration: const Duration(milliseconds: 100),
      //           curve: Curves.bounceInOut);
      //     }),
      // Marker(
      //     markerId: const MarkerId('7'),
      //     position: const LatLng(31.4434, 74.3425),
      //     infoWindow: const InfoWindow(title: "7th"),
      //     onTap: () {
      //       scrollController.animateTo(2220,
      //           duration: const Duration(milliseconds: 100),
      //           curve: Curves.bounceInOut);
      //     }),
      // Marker(
      //     markerId: const MarkerId('8'),
      //     position: const LatLng(31.4844, 74.2625),
      //     infoWindow: const InfoWindow(title: "Ahtsham's Home 8th"),
      //     onTap: () {
      //       scrollController.animateTo(2590,
      //           duration: const Duration(milliseconds: 100),
      //           curve: Curves.bounceInOut);
      //     }),
//     ];
//     super.onInit();
//   }

//   var selectedLatLang = const LatLng(0, 0).obs;
//   Rx<Marker?> currentMarker = Rx<Marker?>(null);
//   GoogleMapController? mapController;

//   void setCurrentMarker(int index) {
//     if (index >= 0 && index < list.length) {
//       currentMarker.value = list[index];
//       mapController?.animateCamera(
//         CameraUpdate.newLatLng(list[index].position),
//       );
//       print("State is changed");
//       update();
//     }
//   }

//   onMapCreated(GoogleMapController googleMapController) {
//     mapController = googleMapController;
//   }

//   void updateMarkerPosition(double newLatitude) {
//     markerLatitude.value = newLatitude;
//   }

//   Future<LocationData> getLocation() async {
//     Location location = Location();
//     PermissionStatus permissionStatus = await _requestLocationPermission();

//     if (permissionStatus == PermissionStatus.granted) {
//       try {
//         return await location.getLocation();
//       } catch (e) {
//         print('Error getting location: $e');
//         return LocationData.fromMap({'latitude': 0.0, 'longitude': 0.0});
//       }
//     } else {
//       // Handle denied permission
//       print('Location permission denied');
//       return LocationData.fromMap({'latitude': 0.0, 'longitude': 0.0});
//     }
//   }

//   Future<PermissionStatus> _requestLocationPermission() async {
//     return await Permission.location.request();
//   }

//   void centerMapOnLocation(LatLng location) {
//     mapController?.animateCamera(
//       CameraUpdate.newLatLng(location),
//     );
//   }
// }
