import 'dart:typed_data';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:quicki/app/data/models/rider.dart';
import 'package:quicki/app/data/models/user.dart';

class SessionManager {
  SessionManager._privateConstructor();

  static final SessionManager _instance = SessionManager._privateConstructor();

  static SessionManager get instance => _instance;

  String _accessToken;
  String _phone;
  User _user;
  Rider _rider;
  LatLng _currentLocation;
  Uint8List _bikeIcon;
  Uint8List _carIcon;
  Uint8List _citySafariIcon;
  Uint8List _foodIcon;
  Uint8List _ambulanceIcon;
  Uint8List _medicalIcon;
  Uint8List _pickupIcon;
  Uint8List _destinationIcon;

  String get accessToken => _accessToken;

  String get phone => _phone;

  LatLng get currentLocation => _currentLocation;

  User get user => _user;



  Uint8List get pickupIcon => _pickupIcon;

  Rider get rider => _rider;



  Uint8List get destinationIcon => _destinationIcon;

  Uint8List get bikeIcon => _bikeIcon;

  Uint8List get carIcon => _carIcon;

  Uint8List get citySafariIcon => _citySafariIcon;

  Uint8List get foodIcon => _foodIcon;

  Uint8List get ambulanceIcon => _ambulanceIcon;

  Uint8List get medicalIcon => _medicalIcon;

  void setUser(User user) => _user = user;

  void setAccessToken(String accessToken) => _accessToken = accessToken;

  void setPhone(String phone) => _phone = phone;


  void setCurrentLocation(LatLng currentLocation) =>
      _currentLocation = currentLocation;

  void setMapIcons(pickup, destination, bike, car, citySafari, food, ambulance, medical) {
    print('icon set===');
    _pickupIcon = pickup;
    _destinationIcon = destination;
    _bikeIcon = bike;
    _carIcon = car;
    _citySafariIcon = citySafari;
    _foodIcon = food;
    _ambulanceIcon = ambulance;
    _medicalIcon = medical;
  }

}