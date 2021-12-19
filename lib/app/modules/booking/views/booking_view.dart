import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quicki/app/modules/booking/views/search_by_pin.dart';

import '../controllers/booking_controller.dart';
import 'main_drawer.dart';
import 'manual_search.dart';
import 'map_container.dart';
import 'nav_settings.dart';

class BookingView extends GetView<BookingController> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<bool> onWillPop() async {
    final status = controller.handleBackButton();
    return status;
  }


  initBooking() {
    final type = Get.arguments;
    print('type is=== $type');
    controller.setSelectedRideType(type);
  }

  @override
  Widget build(BuildContext context) {
    initBooking();
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        key: _scaffoldKey,
        endDrawer: MainDrawer(),
        body: SafeArea(
          child: Stack(
            children: [
              MapContainer(),
              Positioned(
                right: 0,
                top: 16,
                child: NavSettings(
                  onTap: () {
                    _scaffoldKey.currentState.openEndDrawer();
                  },
                ),
              ),
              Obx(() =>
                  controller.searchByPin ? SearchByPin() : ManualSearch()),
              Positioned(
                top: 16,
                left: 16,
                child: InkWell(
                  onTap: () {
                    final status = controller.handleBackButton();
                    if(status)
                      Get.back();
                  },
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    child: Icon(Icons.arrow_back),
                  ),
                ),
              ),
              // CustomProgressBar(),
            ],
          ),
        ),
      ),
    );
  }
}
