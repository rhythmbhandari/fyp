import 'package:get/get.dart';
import 'package:quicki/app/modules/trip/controllers/trip_map_controller.dart';

import '../controllers/trip_controller.dart';

class TripBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TripController>(
      () => TripController(),
    );
    Get.lazyPut<TripMapController>(
          () => TripMapController(),
    );
  }
}
