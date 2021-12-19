import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quicki/app/modules/booking/controllers/booking_controller.dart';
import 'package:quicki/app/widgets/current_location_button.dart';

import 'initial_dialog_card.dart';
import 'user_location_input_screen.dart';

class InitialMapPage extends GetView<BookingController> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onVerticalDragUpdate: (details) {
          int sensitivity = 8;
          if (details.delta.dy > sensitivity) {
            // Down Swipe
          } else if (details.delta.dy < -sensitivity) {
            // Up Swipe
            Get.to(UserLocationInputScreen(),
                transition: Transition.downToUp,
                duration: Duration(milliseconds: 500),
                curve: Curves.decelerate);
          }
        },
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(),
                CurrentLocationButton(
                  onPressed: () => controller.moveToCurrentLocation(),
                ),
              ],
            ),
            InitialDialogCard(
              onTap: () {
                Get.to(UserLocationInputScreen(),
                    transition: Transition.downToUp,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.decelerate);
              },
            ),
          ],
        ),
      ),
    );
  }
}
