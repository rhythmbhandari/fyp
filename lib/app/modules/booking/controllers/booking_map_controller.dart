import 'dart:collection';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:quicki/app/data/repositories/session_manager.dart';
import 'package:quicki/app/data/services/location_address.dart';
import 'package:quicki/app/data/services/polylines_fetcher.dart';
import 'package:quicki/app/utils/camera_movement.dart';
import 'package:quicki/app/utils/map_bound_from_location.dart';
import 'package:quicki/app/utils/place_to_marker.dart';

import 'booking_controller.dart';
class BookingMapController extends GetxController {
  BookingController _bookingController;
  GoogleMapController _mapController;
  final markers = HashSet<Marker>().obs;
  final Set<Polyline> polylines = {};
  BitmapDescriptor originIcon;
  BitmapDescriptor destination;

  @override
  void onInit() {
    super.onInit();
    print('Booking map controller===');
  }

  @override
  void onReady() {
    _bookingController = Get.find();
    super.onReady();
  }

  updateMapStyle() {
    _mapController.setMapStyle("[]");
  }

  updateMapController(mapController) async{
    _mapController = mapController;
    setUpMap();
  }

  setUpMap() {
    moveCameraToLocation(_bookingController.currentLocation);
  }

  moveCameraToLocation(LatLng location, {double zoomLevel = 16}) async {
    CameraMovement.moveCameraPosition(
        location: location,
        googleMapsController: _mapController,
        zoomLevel: zoomLevel);
  }

  clearMap() {
    markers.value.clear();
    polylines.clear();
    update();
  }

  void updateLastCameraLocation(LatLng latLng) =>
      _bookingController.updateLastLocation(latLng);

  void updatePlaceName(String name) =>
      _bookingController.updateLastLocationName(name);

  void updateCameraStatus() {
    if (_bookingController.searchByPin)
      LocationAddress.getAddressFromCoordinates(_bookingController.lastLocation)
          .then((name) => _bookingController.updateLastLocationName(name));
  }

  void addIconMarker(final icon, String id, Function onTap, LatLng location,
      {Offset anchor = const Offset(0, 0)}) async {
    Marker _marker = Marker(
        onTap: onTap,
        markerId: MarkerId(id),
        position: location,
        anchor: anchor,
        // icon: BitmapDescriptor.fromBytes(icon),
        icon: icon);
    markers.value.add(_marker);
  }

  makeRoute(LatLng origin, LatLng destination, Uint8List originIcon,
      Uint8List destinationIcon,
      {Function originTap, Function destinationTap}) async {
    final originIcon = await placeToMarker(_bookingController.pickupName, null, icon: Icons.my_location);
    final destinationIcon = await placeToMarker(
        _bookingController.destinationName,
        int.parse(_bookingController.rideDuration));
    addIconMarker(
        originIcon, 'origin_name', originTap, origin, anchor: Offset(0.5, 1.1));
    addIconMarker(
        BitmapDescriptor.fromBytes(SessionManager.instance.pickupIcon),
        'pickup',
        originTap,
        origin);
    addIconMarker(destinationIcon, 'destination_name', destinationTap,
        destination, anchor: Offset(0.5, 1.1));
    addIconMarker(
        BitmapDescriptor.fromBytes(SessionManager.instance.destinationIcon),
        'destination',
        destinationTap,
        destination);
    final response =
        await PolylinesFetcher.getPolylines(origin, destination, 'main_route');
    updatePolyLines(response);
    _mapController.animateCamera(
      CameraUpdate.newLatLngBounds(
        MapBoundFromLocation.boundsFromLatLngList([origin, destination]),
        100.0,
      ),
    );
  }

  updatePolyLines(lines) {
    polylines.add(lines);
    update();
  }
}
