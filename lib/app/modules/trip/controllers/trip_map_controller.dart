import 'dart:collection';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:quicki/app/data/repositories/session_manager.dart';
import 'package:quicki/app/data/services/polylines_fetcher.dart';
import 'package:quicki/app/enum/trip_events.dart';
import 'package:quicki/app/modules/trip/controllers/trip_controller.dart';
import 'package:quicki/app/utils/camera_movement.dart';
import 'package:quicki/app/utils/map_bound_from_location.dart';
import 'package:quicki/app/utils/place_to_marker.dart';

class TripMapController extends GetxController {
  GoogleMapController _mapController;
  TripController _tripController;
  final markers = HashSet<Marker>().obs;
  final _googlePadding = 10.0.obs;
  final Set<Polyline> polylines = {};
  BitmapDescriptor originIconText;
  BitmapDescriptor destinationIconText;

  Future<void> initializeTextMarkers() async {
    originIconText = await placeToMarker(_tripController.booking.origin, null,
        icon: Icons.gps_fixed_rounded);
    destinationIconText = await placeToMarker(
        _tripController.booking.destination, null,
        icon: Icons.location_pin);
  }

  updateMapStyle() {
    _mapController.setMapStyle("[]");
  }

  updateMapController(mapController) {
    print('update map controller called===');
    _mapController = mapController;
    setUpMap();
  }

  double get googlePadding => _googlePadding.value;

  setUpMap() async {
    await initializeTextMarkers();
    print('booking status=== ${_tripController.booking.status}');
    print(
        'pickup location===== ${_tripController.pickupLocation.latitude}, ${_tripController.pickupLocation.longitude}');
    print(
        'destination location=== ${_tripController.destinationLocation.latitude}, ${_tripController.destinationLocation.longitude}');
    switch (_tripController.booking.status) {
      case 'pending':
        _tripController.updateTripStatus(TripEvents.PENDING);
        makeRoute(
            _tripController.pickupLocation,
            _tripController.destinationLocation,
            SessionManager.instance.pickupIcon,
            SessionManager.instance.destinationIcon);
        break;
      case 'accepted':
        // _tripController.getDriverDetail();
       final driverLocation = const LatLng( 27.6755,   85.3459);
          // _tripController.getEstimatedTimerForRiderArrival();
          makeTwoWayRoute(
              _tripController.pickupLocation,
              _tripController.destinationLocation,
              driverLocation,
              SessionManager.instance.pickupIcon,
              SessionManager.instance.destinationIcon,
              SessionManager.instance.carIcon);
          _tripController.updateTripStatus(TripEvents.ACCEPTED);

        break;
      case 'running':
        // _tripController.getDriverDetail();
        makeRoute(
            _tripController.pickupLocation,
            _tripController.destinationLocation,
            SessionManager.instance.pickupIcon,
            SessionManager.instance.destinationIcon);
        _tripController.updateTripStatus(TripEvents.RUNNING);
        break;
    }
    // _tripController.listenTripStatus();
  }

  makeTwoWayRoute(
      LatLng origin,
      LatLng destination,
      LatLng myLocation,
      Uint8List originIcon,
      Uint8List destinationIcon,
      Uint8List myLocationIcon) async {
    markers.value.clear();
    polylines.clear();
    _addIconMarker(
        BitmapDescriptor.fromBytes(originIcon), 'origin', null, origin);
    _addIconMarker(originIconText, 'origin_text', null, origin,
        anchor: Offset(0.5, 1.1));
    _addIconMarker(BitmapDescriptor.fromBytes(SessionManager.instance.carIcon),
        'my_location', null, myLocation);
    _addIconMarker(BitmapDescriptor.fromBytes(destinationIcon), 'destination',
        null, destination);
    _addIconMarker(destinationIconText, 'destination_text', null, destination,
        anchor: Offset(0.5, 1.1));
    final firstRoute = await PolylinesFetcher.getPolylines(
      origin,
      myLocation,
      'my_route',
      color: Colors.green,
    );
    final secondRoute = await PolylinesFetcher.getPolylines(
        origin, destination, 'main_route'.tr,
        color: Colors.black87);
    polylines.add(firstRoute);
    polylines.add(secondRoute);
    _mapController.animateCamera(
      CameraUpdate.newLatLngBounds(
        MapBoundFromLocation.boundsFromLatLngList([myLocation, destination]),
        100.0,
      ),
    );
    update();
  }

  makeRoute(LatLng origin, LatLng destination, Uint8List originIcon,
      Uint8List destinationIcon,
      {Function originTap, Function destinationTap}) async {
    markers.value.clear();
    _addIconMarker(
        BitmapDescriptor.fromBytes(originIcon), 'origin', originTap, origin);
    _addIconMarker(originIconText, 'originText', originTap, origin,
        anchor: Offset(0.5, 1.1));
    _addIconMarker(BitmapDescriptor.fromBytes(destinationIcon), 'destination',
        destinationTap, destination);
    _addIconMarker(
        destinationIconText, 'destinationText', destinationTap, destination,
        anchor: Offset(0.5, 1.1));
    final response = await PolylinesFetcher.getPolylines(
        origin, destination, 'main_route',
        color: Colors.black87);
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

  void _addIconMarker(final icon, String id, Function onTap, LatLng location,
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

  @override
  void onReady() {
    super.onReady();
    _tripController = Get.find();
  }

  setGooglePadding(double padding) => _googlePadding.value = padding;
}
