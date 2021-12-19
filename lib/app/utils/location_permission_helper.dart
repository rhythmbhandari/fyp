import 'package:location/location.dart';

class LocationPermissionHelper {
  static Future<bool> isPermissionEnabled() async {
    Location _location = new Location();
    bool _isPermissionAndLocationEnabled = false;

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _permissionGranted = await _location.hasPermission();

    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        _isPermissionAndLocationEnabled = false;
      } else {
        _isPermissionAndLocationEnabled = true;
      }
    } else {
      _isPermissionAndLocationEnabled = true;
    }

    if (_isPermissionAndLocationEnabled == false) {
      return _isPermissionAndLocationEnabled;
    }

    _serviceEnabled = await _location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _location.requestService();
      if (!_serviceEnabled) {
        _isPermissionAndLocationEnabled = false;
      } else {
        _isPermissionAndLocationEnabled = true;
      }
    }

    return _isPermissionAndLocationEnabled;
  }
}
