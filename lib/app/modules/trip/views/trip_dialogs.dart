import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quicki/app/enum/trip_events.dart';
import 'package:quicki/app/modules/trip/controllers/trip_controller.dart';
import 'package:quicki/app/modules/trip/views/status_dialogs/trip_accepted_dialog.dart';
import 'package:quicki/app/modules/trip/views/status_dialogs/trip_running_dialog.dart';
import 'package:quicki/app/modules/trip/views/status_dialogs/waiting_dialog.dart';

class TripDialogs extends GetView<TripController> {

  @override
  Widget build(BuildContext context) {
    return Obx(
            () {
          switch (controller.tripEvent) {
            case TripEvents.PENDING:
              WaitingDialog();
              break;

            case TripEvents.ACCEPTED:
              return TripAcceptedDialog();

            case TripEvents.RUNNING:
              return TripRunningDialog();
          }
          return WaitingDialog();
        }
    );
  }
}

