import 'dart:io';

import 'package:geocoding/geocoding.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationAddress {
  static Future<String> getAddressFromCoordinates(LatLng location) async {
    try{
      List<Placemark> placemarks =
      await placemarkFromCoordinates(location.latitude, location.longitude);
      Placemark placemark = placemarks[0];
      String name = placemark.name;
      if (name.contains('Unnamed')) {
        name = placemarks[1].name;
      }
      String subLocality = placemark.subLocality;
      String locality = placemark.locality;
      String administrativeArea = placemark.administrativeArea;
      String postalCode = placemark.postalCode;
      String country = placemark.country;
      String address =
          '$name $subLocality $locality $administrativeArea $postalCode $country';
      return address;
    } on SocketException {
      return Future.error('check_internet'.tr);
    }
    catch (e) {
      return Future.error(e.toString());
    }
  }
}
