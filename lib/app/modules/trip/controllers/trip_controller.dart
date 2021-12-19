import 'dart:async';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:quicki/app/modules/trip/controllers/trip_map_controller.dart';

import 'package:quicki/app/data/models/booking.dart';
import 'package:quicki/app/data/models/distance.dart';
import 'package:quicki/app/data/models/rider.dart';

import 'package:quicki/app/enum/trip_events.dart';

class TripController extends GetxController {
  final _booking = Booking().obs;
  LatLng pickupLocation = LatLng(0, 0);
  LatLng destinationLocation = LatLng(0, 0);
  final _tripEvent = TripEvents.PENDING.obs;
  final rider = Rider().obs;
  LatLng _driverLocation = LatLng(0,0);
  final waitingDuration = ''.obs;
  String errorMessage;
  Timer tripStatusTimer;
  TripMapController _tripMapController;

  Booking get booking => _booking.value;

  TripEvents get tripEvent => _tripEvent.value;

  LatLng get driverLocation => _driverLocation;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    _tripMapController = Get.find();
  }

  @override
  void onClose() {}

  void setBooking(Booking booking) {
    print('set booking called====');
    _booking.value = booking;
    pickupLocation =
        LatLng(_booking.value.location.latitudeOrigin, _booking.value.location.longitudeOrigin);
    destinationLocation = LatLng(_booking.value.location.latitudeDestination,
        _booking.value.location.longitudeDestination);
  }


  void updateTripStatus(TripEvents event) => _tripEvent.value = event;


  void setGooglePadding(double padding) => _tripMapController.setGooglePadding(padding);


}
