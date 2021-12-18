import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import 'package:get/get.dart';

class LocationFetcher {
  static Future<LatLng> determinePosition() async {
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return Future.error('location_permission_not_enabled'.tr);
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return Future.error('location_permission_denied'.tr);
      }
    }

    print('I am here===');
    print('Location is ===$location');
    if (location == null) {
      print('Location is null===');
    }

    if (await location.getLocation() == null) {
      print('Location getlocation is null=====');
    }

    _locationData = await location.getLocation();
    if (_locationData == null) {
      print('I am null...===');
    }
    LatLng latLng = LatLng(_locationData.latitude, _locationData.longitude);
    return latLng;
  }
}
