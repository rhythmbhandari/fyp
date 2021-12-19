// import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:puryaideu_driver/configs/constants.dart';
//
//
// class PolylinesFetcher {
//
//   static Future<Map<PolylineId, Polyline>> getPolylines(LatLng _pickUpLocation, LatLng _destinationLocation) async{
//     List<LatLng> polylineCoordinates = [];
//     Map<PolylineId, Polyline> polylines = {};
//     PolylinePoints polylinePoints = PolylinePoints();
//
//     PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
//       API_KEY,
//       PointLatLng(_pickUpLocation.latitude, _pickUpLocation.longitude),
//       PointLatLng(
//           _destinationLocation.latitude, _destinationLocation.longitude),
//       travelMode: TravelMode.driving,
//     );
//     if (result.points.isNotEmpty) {
//       result.points.forEach((PointLatLng point) {
//         polylineCoordinates.add(LatLng(point.latitude, point.longitude));
//       });
//     } else {
//       print(result.errorMessage);
//     }
//
//     PolylineId id = PolylineId("poly");
//     Polyline polyline = Polyline(
//       polylineId: id,
//       color: Get.theme.accentColor,
//       points: polylineCoordinates,
//       width: 3,
//     );
//     polylines[id] = polyline;
//     print(polylines[id]);
//     return polylines;
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:quicki/config/constant.dart';


class PolylinesFetcher {

  static Future<Polyline> getPolylines(LatLng _pickUpLocation, LatLng _destinationLocation, String polylineId,
      {color: const Color(0xff1ABBBC)}) async{
    List<LatLng> polylineCoordinates = [];
    Map<PolylineId, Polyline> polylines = {};
    PolylinePoints polylinePoints = PolylinePoints();

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      API_KEY,
      PointLatLng(_pickUpLocation.latitude, _pickUpLocation.longitude),
      PointLatLng(
          _destinationLocation.latitude, _destinationLocation.longitude),
      travelMode: TravelMode.driving,
    );
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    } else {
      print(result.errorMessage);
    }

    PolylineId id = PolylineId(polylineId);
    Polyline polyline = Polyline(
      polylineId: id,
      color: color,
      points: polylineCoordinates,
      width: 3,
    );
    // polylines[id] = polyline;
    // print(polylines[id]);
    return polyline;
  }


}