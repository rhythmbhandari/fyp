import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:quicki/app/data/models/booking.dart';
import 'package:quicki/app/data/models/distance.dart';
import 'package:quicki/app/data/models/place.dart';
import 'package:quicki/app/data/models/prediction.dart';
import 'package:quicki/app/data/repositories/google_repository.dart';
import 'package:quicki/app/data/repositories/session_manager.dart';
import 'package:quicki/app/data/services/location_address.dart';
import 'package:quicki/app/data/services/location_fetcher.dart';
import 'package:quicki/app/enum/location_type.dart';
import 'package:quicki/app/enum/map_events.dart';
import 'package:quicki/app/enum/service_type.dart';
import 'package:quicki/app/widgets/custom_snackbar.dart';

import 'booking_map_controller.dart';

class BookingController extends GetxController {
  BookingMapController _bookingMapController;
  final _currentLocation = LatLng(27.6867784, 85.3041796).obs;
  LatLng pickUpLocation;
  LatLng destinationLocation;
  String currentPlaceName;
  String pickupName;
  String destinationName;

  // final focusedNode = FocusNode().obs;
  final mapEvents = MapEvents.NONE.obs;
  final _searchByPin = false.obs;
  final _locationName = ''.obs;
  final locationType = LocationType.NONE.obs;
  final _predictionList = [].obs;
  final _lastLocation = LatLng(27.6867784, 85.3041796).obs;
  TextEditingController pickupInputController = TextEditingController();
  TextEditingController destinationInputController = TextEditingController();
  String errorMessage;
  final input = ''.obs;
  DistanceDTO _distanceDTO;
  String rideDistance = '';
  final _selectedRideType = ServiceType.bike.obs;
  String rideDuration = '';

  double carPrice;
  double bikePrice;
  double citySafariPrice;
  int bookingId;
  Booking booking;

  bool get searchByPin => _searchByPin.value;

  LatLng get currentLocation => _currentLocation.value;

  String get locationName => _locationName.value;

  List get predictionList => _predictionList;

  LatLng get lastLocation => _lastLocation.value;

  ServiceType get selectedRideType => _selectedRideType.value;

  updateLastLocation(LatLng location) => _lastLocation.value = location;

  @override
  void onInit() {
    _currentLocation.value = SessionManager.instance.currentLocation;
    super.onInit();
  }

  @override
  void onReady() {
    _bookingMapController = Get.find();
    LocationAddress.getAddressFromCoordinates(currentLocation).then((name) {
      currentPlaceName = name;
      pickupInputController.text = currentPlaceName;
    });
    super.onReady();
  }

  @override
  void onClose() {}

  moveToCurrentLocation() async {
    _bookingMapController.moveCameraToLocation(currentLocation);
    final _location = await LocationFetcher.determinePosition();
    _currentLocation.value = _location;
    LocationAddress.getAddressFromCoordinates(currentLocation).then((name) {
      currentPlaceName = name;
      pickupInputController.text = currentPlaceName;
    });
  }

  updatePredictionList(List<Prediction> list) => _predictionList.value = list;

  getPredictions(String keyword) async {
    print('I am in predictioni list===');
    input.value = keyword;
    debounce(input, (_) async {
      if (input.value.length > 2) {
        final list = await GoogleRepository.getAutoCompletePlaces(input.value)
            .catchError((error) {
          errorMessage = error;
        });
        if (list == null) {
          CustomSnackbar.showCustomSnackBar(message: '$errorMessage');
          return;
        }
        updatePredictionList(list);
      } else {
        _predictionList.value = [];
      }
    }, time: Duration(seconds: 1));
  }

  void searchByPinTask(LocationType type) {
    _bookingMapController.clearMap();
    resetData();
    mapEvents.value = MapEvents.NONE;
    _searchByPin.value = true;
    locationType.value = type;
    if (type == LocationType.PICKUP) {
      (pickUpLocation != null)
          ? _bookingMapController.moveCameraToLocation(pickUpLocation)
          : moveToCurrentLocation();
    } else {
      (destinationLocation != null)
          ? _bookingMapController.moveCameraToLocation(destinationLocation)
          : moveToCurrentLocation();
    }
  }

  resetData() {
    _predictionList.value = [];
    _searchByPin.value = false;
    destinationInputController.text = '';
    mapEvents.value = MapEvents.NONE;
  }

  updateLastLocationName(String name) => _locationName.value = name;

  Future<bool> fetchLatLngFromId(String placeId, LocationType type) async {
    Place placeDetail =
        await GoogleRepository.getPlaceDetailById(placeId).catchError((error) {
      errorMessage = error;
    });

    if (placeDetail == null) {
      return false;
    }
    LatLng latLng = LatLng(
        placeDetail.geometry.location.lat, placeDetail.geometry.location.lng);
    updateLastLocation(latLng);
    locationType.value = type;
    return true;
  }

  void showOnMap() {
    _bookingMapController.clearMap();
    _searchByPin.value = true;
    _predictionList.value = [];
    _bookingMapController.moveCameraToLocation(lastLocation);
  }

  setPickupLocation() {
    pickUpLocation = lastLocation;
    pickupName = locationName;
    pickupInputController.text = pickupName;
    if (destinationLocation != null) {
      setCoordinatesOnMap();
    }
  }

  void addDestinationLocation() {
    destinationLocation = lastLocation;
    destinationName = locationName;
    destinationInputController.text = destinationName;
    if (pickUpLocation == null) {
      pickUpLocation = currentLocation;
      pickupName = currentPlaceName;
    }
    setCoordinatesOnMap();
  }

  void setCoordinatesOnMap() async {
    pickupInputController.text = pickupName;
    destinationInputController.text = destinationName;
    DistanceDTO distanceDTO =
        await GoogleRepository.getDistanceBetweenCoordinates(
                pickUpLocation, destinationLocation)
            .catchError((error) {
      errorMessage = error;
    });
    if (distanceDTO == null) {
      CustomSnackbar.showCustomSnackBar(message: errorMessage);
      _bookingMapController.clearMap();
      moveToCurrentLocation();
      return;
    }
    _distanceDTO = distanceDTO;
    var distanceInMeter = _distanceDTO.rows[0].elements[0].distance.value;
    var durationTime = _distanceDTO.rows[0].elements[0].duration.value;
    String str = distanceInMeter.toString();
    rideDistance = str;
    rideDuration = durationTime.toString();



    carPrice = 200.0;
    bikePrice = 150.0;
    citySafariPrice = 175.0;
    mapEvents.value = MapEvents.DESTINATION_SELECTED;
    _bookingMapController.makeRoute(
        pickUpLocation,
        destinationLocation,
        SessionManager.instance.pickupIcon,
        SessionManager.instance.destinationIcon, originTap: () {
      searchByPinTask(LocationType.PICKUP);
    }, destinationTap: () {
      searchByPinTask(LocationType.DESTINATION);
    });
    _searchByPin.value = false;
  }

  void setSelectedRideType(type) => _selectedRideType.value = type;

  bool handleBackButton() {
    bool goBack = false;
    if (mapEvents.value == MapEvents.DESTINATION_SELECTED) {
      mapEvents.value = MapEvents.NONE;
      resetMap();
    } else {
      if (_searchByPin.value) {
        resetMap();
      } else {
        goBack = true;
      }
    }

    return goBack;
  }

  resetMap() {
    _bookingMapController.clearMap();
    pickUpLocation = null;
    destinationLocation = null;
    destinationName = '';
    destinationInputController.text = '';
    _searchByPin.value = false;
    moveToCurrentLocation();
  }


}
