import 'package:get/get.dart';
import 'package:quicki/app/data/models/user.dart';
import 'package:quicki/app/enum/progress_status.dart';
import 'package:quicki/app/modules/dashboard/controllers/dashboard_controller.dart';

class ProfileController extends GetxController {
  final user = User().obs;
  final progressStatus = ProgressStatus.SUCCESS.obs;
  String errorMessage;
  DashboardController _dashboardController;

  @override
  void onInit() {
    super.onInit();
    //getUserDetail();
  }


  @override
  void onReady() {
    _dashboardController = Get.find();
    super.onReady();
  }

  @override
  void onClose() {}
}
