import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quicki/app/enum/progress_status.dart';
import 'package:quicki/app/modules/profile/views/user_detail_card.dart';
import 'package:quicki/app/modules/profile/views/wallet_and_distance_card.dart';
import 'package:quicki/app/routes/app_pages.dart';
import 'package:quicki/app/utils/responsive_size.dart';
import 'package:quicki/app/widgets/custom_progress_bar.dart';

import '../controllers/profile_controller.dart';
import 'logout_card.dart';
import 'main_settings_card.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffeeeff3),
      appBar: AppBar(
        title: Text(
          "Profile",
          style: Get.textTheme.headline6.copyWith(color: Get.theme.accentColor),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {

              },
              icon: Icon(Icons.refresh)),
        ],
      ),
      body: SafeArea(child: Obx(() {
        switch (controller.progressStatus.value) {
          case ProgressStatus.LOADING:
            return CustomProgressBar();

          case ProgressStatus.ERROR:
            return Center(
              child: Padding(
                padding: EdgeInsets.all(getResponsiveFont(16)),
                child: Text(
                  controller.errorMessage,
                  style: Get.textTheme.headline5,
                ),
              ),
            );

          case ProgressStatus.SUCCESS:
            break;
        }
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UserDetailCard(
                  onPressed: () {

                  }),
              WalletAndDistanceCard(),
              MainSettingsCard(),
              SizedBox(height: 1),
              LogoutCard(),
            ],
          ),
        );
      })),
    );
  }
}
