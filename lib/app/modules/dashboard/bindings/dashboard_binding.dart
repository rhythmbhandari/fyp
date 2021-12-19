import 'package:get/get.dart';
import 'package:quicki/app/modules/history/controllers/history_controller.dart';
import 'package:quicki/app/modules/home/controllers/home_controller.dart';
import 'package:quicki/app/modules/profile/controllers/profile_controller.dart';

import '../controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(
      () => DashboardController(),
    );
    Get.lazyPut<HomeController>(
          () => HomeController(),
    );
    Get.lazyPut<ProfileController>(
          () => ProfileController(),
    );
    Get.lazyPut<HistoryController>(
          () => HistoryController(),
    );
  }
}
