import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  SharedPreferences prefs;

  UserRepository({this.prefs});

  static const String _IS_LOGGED_IN = "is_logged_in";
  static const String _ACCESS_TOKEN = "accessToken";
  static const String _BIOMETRIC_TOKEN = "biometricToken";
  static const String _BIOMETRIC_LOGIN = "biometric_login";
  static const String _LATITUDE = "latitude";
  static const String _LONGITUDE = "longitude";
  static const String _PHONE = "phone";
  static const String _LANGUAGE = 'language';
  static const String _APP_LAUNCHED_PREVIOUSLY = "is_app_launched_previously";
  static const String _BOOKING_ID = "booking_id";

  appLaunched() async {
    await prefs.setBool(_APP_LAUNCHED_PREVIOUSLY, false);
  }

  Future<void> login(String accessToken) async {
    await prefs.setBool(_IS_LOGGED_IN, true);
    await prefs.setString(_ACCESS_TOKEN, accessToken);
  }

  Future<void> setBookingId(String id) async {
    await prefs.setString(_BOOKING_ID, id);
  }

  Future<void> saveLanguageIndex(int index) async {
    await prefs.setInt(_LANGUAGE, index);
  }

  Future<void> saveBiometricLogin(String accessToken) async {
    await prefs.setBool(_BIOMETRIC_LOGIN, true);
    await prefs.setString(_BIOMETRIC_TOKEN, accessToken);
  }

  savePhone(String phone) async {
    print('Phone value is==== $phone');
    await prefs.setString(_PHONE, phone);
  }

  saveLatLng(LatLng latLng) async {
    await prefs.setDouble(_LATITUDE, latLng.latitude);
    await prefs.setDouble(_LONGITUDE, latLng.longitude);
  }

  Future<bool> isLoggedIn() async {
    return prefs.containsKey(_IS_LOGGED_IN);
  }

  Future<bool> isBiometricEnabled() async {
    return prefs.containsKey(_BIOMETRIC_LOGIN);
  }

  Future<bool> isAppLaunchedPreviously() async {
    return prefs.containsKey(_APP_LAUNCHED_PREVIOUSLY);
  }

  Future<bool> isLocationSaved() async {
    return prefs.containsKey(_LATITUDE);
  }

  Future<String> getAccessToken() async {
    return prefs.getString(_ACCESS_TOKEN);
  }

  Future<String> getBookingId() async {
    return prefs.getString(_BOOKING_ID);
  }

  Future<int> getLanguageIndex() async {
    return prefs.getInt(_LANGUAGE);
  }

  Future<String> getBiometricToken() async {
    return prefs.getString(_BIOMETRIC_TOKEN);
  }

  Future<String> getPhone() async {
    return prefs.getString(_PHONE);
  }

  Future<LatLng> getlatLong() async {
    double lat = prefs.getDouble(_LATITUDE);
    double long = prefs.getDouble(_LONGITUDE);
    return LatLng(lat, long);
  }

  Future logout() async {
    bool status = false;
    await prefs.remove(_IS_LOGGED_IN).then((value) {
      if (value) {
        status = true;
        print('Login in removed===');
      } else {
        print('Login remove problem===');
      }
    });
    await prefs.remove(_ACCESS_TOKEN).then((value) {
      if (value) {
        status = true;
        print('Access token removde===');
      } else {
        print('Access token problem===');
      }
    });
    await prefs.remove(_LATITUDE).then((value) {
      if (value) {
        status = true;
        print('latitude removed===');
      } else {
        print('Latitude problem===');
      }
    });
    await prefs.remove(_LONGITUDE).then((value) {
      if (value) {
        status = true;
        print('Longitude removed===');
      } else {
        print('Longitude problem===');
      }
    });
    return status;
  }
}
