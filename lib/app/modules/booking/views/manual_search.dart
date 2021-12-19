import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quicki/app/enum/map_events.dart';
import 'package:quicki/app/modules/booking/controllers/booking_controller.dart';
import 'package:quicki/app/modules/booking/views/ride_type_dialog.dart';

import 'initial_page.dart';

class ManualSearch extends GetView<BookingController> {

  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    return Obx(
        () {
          switch (controller.mapEvents.value) {
            case MapEvents.NONE:
              break;

            case MapEvents.DESTINATION_SELECTED:
              return RideTypeDialog();
          }
          return InitialMapPage();
        }
    );
  }
}
