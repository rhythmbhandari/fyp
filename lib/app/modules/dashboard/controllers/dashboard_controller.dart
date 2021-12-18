import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quicki/app/data/repositories/session_manager.dart';
import 'package:quicki/app/data/services/location_fetcher.dart';
import 'package:quicki/app/enum/bottom_navbar_enum.dart';
import 'package:quicki/app/utils/permission_helper.dart';

class DashboardController extends GetxController {

  final selectedTab = BottomNavBarEnum.home.obs;
  final currentPage = 0.obs;
  PageController _pageController;
  final _showLocationRequestDialog = false.obs;
  String errorMessage;

  bool get showLocationRequestDialog => _showLocationRequestDialog.value;
  PageController get pageController => _pageController;

  @override
  onInit() {
    super.onInit();
    startLocationPermission();
    PageController(initialPage: 0, keepPage: true);
  }

  void setShowLocationRequestStatus(bool status) => _showLocationRequestDialog.value = status;

  startLocationPermission() async {
    bool locationPermissionStatus =
    await LocationPermissionHelper.isPermissionEnabled();
    if(!locationPermissionStatus) setShowLocationRequestStatus(true);
    final _locationData = await LocationFetcher.determinePosition();
    SessionManager.instance.setCurrentLocation(_locationData);
  }

  @override
  void onClose() {}

}
