import 'package:get/get.dart';
import 'package:quicki/app/modules/booking/controllers/booking_map_controller.dart';

import '../controllers/booking_controller.dart';

class BookingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookingController>(
      () => BookingController(),
    );
    Get.lazyPut<BookingMapController>(
          () => BookingMapController(),
    );
  }
}
