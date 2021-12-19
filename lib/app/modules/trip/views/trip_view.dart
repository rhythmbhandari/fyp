import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:quicki/app/data/models/booking.dart';
import 'package:quicki/app/modules/trip/views/trip_dialogs.dart';

import '../controllers/trip_controller.dart';
import 'trip_map_container.dart';

class TripView extends GetView<TripController> {

  Future<bool> onWillPop() async {
    SystemNavigator.pop();
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              TripMapContainer(),
              TripDialogs(),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  child: InkWell(
                    onTap: () {

                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)),
                      margin: EdgeInsets.all(16),
                      child: Icon(Icons.refresh),
                      padding: EdgeInsets.all(8),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
