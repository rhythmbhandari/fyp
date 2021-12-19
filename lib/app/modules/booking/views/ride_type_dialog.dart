import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quicki/app/enum/service_type.dart';
import 'package:quicki/app/modules/booking/controllers/booking_controller.dart';
import 'package:quicki/app/routes/app_pages.dart';
import 'package:quicki/app/widgets/custom_button.dart';
import 'package:quicki/app/widgets/custom_snackbar.dart';

import 'location_icon_tile.dart';
import 'user_location_input_screen.dart';

class RideTypeDialog extends GetView<BookingController> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Container(
                  //   margin: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(30),
                  //     border: Border.all(
                  //       color: Get.theme.primaryColor,
                  //       width: 2,
                  //     ),
                  //   ),
                  //   child: Material(
                  //     borderRadius: BorderRadius.circular(30),
                  //     child: InkWell(
                  //       splashColor: Get.theme.accentColor,
                  //       borderRadius: BorderRadius.circular(30),
                  //       onTap: () => Get.to(UserLocationInputScreen()),
                  //       child: Padding(
                  //         padding: const EdgeInsets.all(8.0),
                  //         child: Text(
                  //           LocaleKeys.text_change_location.tr,
                  //           style: Get.textTheme.bodyText2.copyWith(
                  //               fontSize: 10, color: Get.theme.primaryColor),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              Container(
                color: Colors.white,
                child: Row(
                  children: [
                    Expanded(
                      child: Obx(
                        () => VehicleCard(
                          imageUrl: 'assets/icons/motorbike.png',
                          onTap: () {
                            controller.setSelectedRideType(ServiceType.bike);
                          },
                          isSelected:
                              controller.selectedRideType == ServiceType.bike
                                  ? true
                                  : false,
                          price:
                              '${"Rs "} ${controller.bikePrice}',
                          vehicleType: "Bike",
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Obx(
                        () => VehicleCard(
                          imageUrl: 'assets/icons/taxi.png',
                          onTap: () {
                            controller.setSelectedRideType(ServiceType.car);
                          },
                          isSelected:
                              controller.selectedRideType == ServiceType.car
                                  ? true
                                  : false,
                          price:
                              '${"Rs "} ${controller.carPrice}',
                          vehicleType: "Car",
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Obx(
                        () => VehicleCard(
                          imageUrl: 'assets/icons/parcel.png',
                          onTap: () {
                            controller
                                .setSelectedRideType(ServiceType.city_safari);
                          },
                          isSelected: controller.selectedRideType ==
                              ServiceType.city_safari
                              ? true
                              : false,
                          price:
                              '${"Rs "} ${controller.citySafariPrice}',
                          vehicleType: "Parcel",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                width: Get.width,
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: CustomButton(
                    onPressed: () async {
                       const response = true;
                        if (response) {
                          Get.offNamed(Routes.TRIP,
                              arguments: controller.booking);
                        } else {
                          CustomSnackbar.showCustomSnackBar(
                              message: controller.errorMessage);
                        }
                    },
                    text: "Request Ride"),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class VehicleCard extends StatelessWidget {
  final String imageUrl;
  final String vehicleType;
  final String price;
  final Function onTap;
  final bool isSelected;

  VehicleCard(
      {this.imageUrl,
      this.vehicleType,
      this.price,
      this.isSelected,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Color(0xffffffff),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          decoration: isSelected
              ? BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 8,
                      spreadRadius: 1),
                ])
              : BoxDecoration(),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              Image.asset(
                imageUrl,
                height: 60,
                width: 60,
                fit: BoxFit.fill,
              ),
              SizedBox(width: 16),
              Text(vehicleType,
                  style: Get.textTheme.headline5.copyWith(
                    fontSize: 14,
                    color: isSelected ? Colors.black : Colors.grey,
                  )),
              Text(price,
                  style: Get.textTheme.bodyText2.copyWith(
                    fontSize: 12,
                    color: isSelected ? Colors.black : Colors.grey,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
