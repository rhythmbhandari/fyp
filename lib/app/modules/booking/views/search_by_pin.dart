import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quicki/app/enum/location_type.dart';
import 'package:quicki/app/modules/booking/controllers/booking_controller.dart';
import 'package:quicki/app/widgets/current_location_button.dart';
import 'package:quicki/app/widgets/custom_button.dart';

import 'user_location_input_screen.dart';

class SearchByPin extends GetView<BookingController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          // Positioned(
          //   top: Get.height * 0.1,
          //   left: 16,
          //   right: 16,
          //   child: LocationText(
          //     text: controller.locationName,
          //   ),
          // ),
          Center(
            child: Container(
              padding: EdgeInsets.only(
                bottom: 30,
              ),
              child: Image.asset(
                'assets/images/pin.png',
                height: 40,
                width: 40,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: Get.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CurrentLocationButton(
                    onPressed: () {
                      controller.moveToCurrentLocation();
                    },
                  ),
                  Card(
                    margin: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(),
                    child: Container(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            controller.locationType.value == LocationType.PICKUP
                                ? "Confirm pickup"
                                : (controller.locationType.value ==
                                        LocationType.DESTINATION
                                    ? "Confirm destination"
                                    : controller.locationType.value ==
                                            LocationType.HOME
                                        ? "Set home"
                                        : "Set work"),
                            style: Get.textTheme.headline6,
                          ),
                          SizedBox(height: 16),
                          Container(
                            color: Colors.grey.withOpacity(0.3),
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: Row(
                              children: [
                                Icon(Icons.location_pin),
                                SizedBox(width: 16),
                                Expanded(
                                  child: Text(
                                    controller.locationName,
                                    maxLines: 1,
                                    style: Get.textTheme.bodyText2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 16),
                          CustomButton(
                            onPressed: () async {
                              if (controller.locationType.value ==
                                  LocationType.PICKUP) {
                                controller.setPickupLocation();
                                if (controller.destinationLocation == null) {
                                  Get.to(UserLocationInputScreen());
                                }
                              } else if (controller.locationType.value ==
                                  LocationType.HOME) {
                                // final status =
                                // await controller.saveHomeAndWorkLocaton();
                                // if (!status) {
                                //   CustomSnackbar.showCustomSnackBar(
                                //       message: '${controller.errorMessage}');
                                // }
                                Get.to(UserLocationInputScreen());
                              } else if (controller.locationType.value ==
                                  LocationType.WORK) {
                                // final status =
                                // await controller.saveHomeAndWorkLocaton();
                                // if (!status) {
                                //   CustomSnackbar.showCustomSnackBar(
                                //       message: '${controller.errorMessage}');
                                // }
                                Get.to(UserLocationInputScreen());
                              } else {
                                controller.addDestinationLocation();
                              }
                            },
                            text: controller.locationType.value ==
                                    LocationType.PICKUP
                                ? "Set pickup"
                                : (controller.locationType.value ==
                                        LocationType.DESTINATION
                                    ? "Set destination"
                                    : controller.locationType.value ==
                                            LocationType.HOME
                                        ? "Set home"
                                        : "Set work"),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding: EdgeInsets.only(right: 16, left: 16, bottom: 16),
                  //   child: CustomButton(
                  //     backgroundColor: Get.theme.accentColor,
                  //     onPressed: () async {
                  //       if (controller.locationType.value ==
                  //           LocationType.PICKUP) {
                  //         controller.setPickupLocation();
                  //         if (controller.destinationLocation == null) {
                  //           Get.to(UserLocationInputScreen());
                  //         }
                  //       } else if (controller.locationType.value ==
                  //           LocationType.HOME) {
                  //         // final status =
                  //         // await controller.saveHomeAndWorkLocaton();
                  //         // if (!status) {
                  //         //   CustomSnackbar.showCustomSnackBar(
                  //         //       message: '${controller.errorMessage}');
                  //         // }
                  //         Get.to(UserLocationInputScreen());
                  //       } else if (controller.locationType.value ==
                  //           LocationType.WORK) {
                  //         // final status =
                  //         // await controller.saveHomeAndWorkLocaton();
                  //         // if (!status) {
                  //         //   CustomSnackbar.showCustomSnackBar(
                  //         //       message: '${controller.errorMessage}');
                  //         // }
                  //         Get.to(UserLocationInputScreen());
                  //       } else {
                  //         controller.addDestinationLocation();
                  //       }
                  //     },
                  //     text: controller.locationType.value == LocationType.PICKUP
                  //         ? LocaleKeys.buttons_set_pickup.tr
                  //         : (controller.locationType.value ==
                  //                 LocationType.DESTINATION
                  //             ? LocaleKeys.buttons_set_destination.tr
                  //             : controller.locationType.value ==
                  //                     LocationType.HOME
                  //                 ? LocaleKeys.buttons_set_home.tr
                  //                 : LocaleKeys.buttons_set_work.tr),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
