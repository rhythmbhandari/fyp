import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quicki/app/enum/bottom_navbar_enum.dart';
import 'package:quicki/app/modules/history/views/history_view.dart';
import 'package:quicki/app/modules/home/views/home_view.dart';
import 'package:quicki/app/modules/profile/views/profile_view.dart';
import 'package:quicki/app/widgets/curved_navigation_bar.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  final List<Widget> _pages = [
    HomeView(),
    HistoryView(),
    HistoryView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Obx(
              () => IndexedStack(
            children: _pages,
            index: controller.currentPage.value,
          ),
        ),
        Obx(
              () => controller.showLocationRequestDialog
              ? Container(
            color: Colors.black.withOpacity(0.5),
            padding: EdgeInsets.symmetric(
                horizontal: Get.width * 0.05,
                vertical: Get.height * 0.13),
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Image.asset(
                    'assets/location_permission.png',
                    fit: BoxFit.cover,
                    width: Get.width,
                  ),
                  Expanded(child: Container()),
                  Text("Permission manager.",
                      style:
                      Get.textTheme.bodyText2.copyWith(fontSize: 12)),
                  SizedBox(height: Get.height * 0.05),
                  GestureDetector(
                    onTap: () {
                      controller.setShowLocationRequestStatus(false);
                      controller.startLocationPermission();
                    },
                    child: Text(
                      "Try again",
                      style: Get.textTheme.headline5.copyWith(
                        color: Get.theme.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
              : Container(),
        ),
        Positioned(
            bottom: 0,
            child: CurvedNavigationBar(
              items: <Widget>[
                Icon(Icons.home, size: 30, color: controller.selectedTab.value ==
                    BottomNavBarEnum.home
                    ? Colors.white
                    : Colors.white),
                Icon(Icons.notifications, size: 30, color: controller.selectedTab.value ==
                    BottomNavBarEnum.notifications
                    ? Colors.white
                    : Colors.white),
                Icon(Icons.history, size: 30, color:controller.selectedTab.value ==
                    BottomNavBarEnum.history
                    ? Colors.white
                    : Colors.white),
                Icon(Icons.settings, size: 30, color: controller.selectedTab.value ==
                    BottomNavBarEnum.settings
                    ? Colors.white
                    : Colors.white),
              ],
              onTap: (index) {
                //Handle button tap
                switch (index) {
                  case 0:
                    controller.selectedTab.value =
                        BottomNavBarEnum.home;
                    controller.currentPage.value = 0;
                    break;
                  case 1:
                    controller.selectedTab.value =
                        BottomNavBarEnum.notifications;
                    controller.currentPage.value = 1;
                    break;
                  case 2:
                    controller.selectedTab.value =
                        BottomNavBarEnum.history;
                    controller.currentPage.value = 2;
                    break;
                  case 3:
                    controller.selectedTab.value =
                        BottomNavBarEnum.settings;
                    controller.currentPage.value = 3;
                    break;
                }
              },
            )),
      ],
    );
  }
}
