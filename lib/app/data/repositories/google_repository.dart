import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:quicki/app/data/models/distance.dart';
import 'package:quicki/app/data/models/place.dart';
import 'package:quicki/app/data/network/network_helper.dart';
import 'package:quicki/config/constant.dart';
import 'package:quicki/config/google_error_messages.dart';
import './../models/prediction.dart';

class GoogleRepository {
  static const String BASE_URL = 'https://maps.googleapis.com/maps/api';

  static Future<List<Prediction>> getAutoCompletePlaces(String input) async {
    try {
      final response = await NetworkHelper().getRequest(
          '$BASE_URL/place/autocomplete/json?input=$input&key=$API_KEY&sessiontoken=1234567890&components=country:NP');

      List<Prediction> predictionList = (response.data['predictions'] as List)
          .map((i) => Prediction.fromJson(i))
          .toList();
      return predictionList;
    } catch(e) {
      return Future.error(e.toString());
    }
  }

  static Future<Place> getPlaceDetailById(String placeId) async {
    print(placeId);
    try {
      var decodeJson = await NetworkHelper().getRequest(
          '$BASE_URL/place/details/json?placeid=$placeId&key=$API_KEY');
      var decodedPlaceJson = decodeJson.data['result'];
      return Place.fromJson(decodedPlaceJson);
    } catch(e) {
      return Future.error(e.toString());
    }
  }

  static Future<DistanceDTO> getDistanceBetweenCoordinates(
      LatLng origin, LatLng destination) async {
    try {
      print('Latlngdata ==== ${origin.latitude},  ${origin.longitude}');
      print(
          'Latlngdata ==== ${destination.latitude},  ${destination.longitude}');
      var decodeJson = await NetworkHelper().getRequest(
          '$BASE_URL/distancematrix/json?units=metric&origins=${origin.latitude},${origin.longitude}&destinations=${destination.latitude},${destination.longitude}&key=$API_KEY');
      print('Distnaace dto==== $decodeJson');

      if (decodeJson.data['rows'][0]['elements'][0]['status'] == 'OK') {
        return DistanceDTO.fromJson(decodeJson.data);
      } else {
        return Future.error(GoogleErrorMessages.errorMessages(
            decodeJson.data['rows'][0]['elements'][0]['status']));
      }
    } catch (e) {
      print('exception==== $e');
      return Future.error('Server error: Something went wrong.');
    }
  }
}
