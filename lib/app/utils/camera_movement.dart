import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CameraMovement {
  CameraMovement._();

  static moveCameraPosition(
      {@required LatLng location,
      @required GoogleMapController googleMapsController,
      double zoomLevel}) {
    if(googleMapsController != null) {
      googleMapsController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: location, zoom: zoomLevel)));
    }
  }
}
