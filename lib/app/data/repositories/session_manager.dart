import 'package:google_maps_flutter/google_maps_flutter.dart';

class SessionManager {
  SessionManager._privateConstructor();

  static final SessionManager _instance = SessionManager._privateConstructor();

  static SessionManager get instance => _instance;

  String _accessToken;
  String _phone;
  LatLng _currentLocation;

  String get accessToken => _accessToken;

  String get phone => _phone;


  void setAccessToken(String accessToken) => _accessToken = accessToken;

  void setPhone(String phone) => _phone = phone;


  void setCurrentLocation(LatLng currentLocation) =>
      _currentLocation = currentLocation;

}