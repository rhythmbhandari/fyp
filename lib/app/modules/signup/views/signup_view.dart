import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import 'package:get/get.dart';
import 'package:quicki/app/routes/app_pages.dart';
import 'package:quicki/app/utils/responsive_size.dart';
import 'package:quicki/app/widgets/custom_button.dart';
import 'package:quicki/app/widgets/custom_progress_bar.dart';
import 'package:quicki/app/widgets/custom_snackbar.dart';
import '../controllers/signup_controller.dart';
import 'profile_image_container.dart';
import 'signup_form.dart';

class SignupView extends GetView<SignupController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        elevation: 0,
        title: Text('Add profile',
            style: Get.textTheme.headline5.copyWith(
              fontSize: getResponsiveFont(18),
              color: Colors.black,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.0,
            )),
        centerTitle: true,

      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ProfileImageContainer(),
                        Container(
                          margin: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SignUpForm(),
                              SizedBox(height: Get.height * 0.05),
                              Obx(
                                    () => SizedBox(
                                  width: Get.width,

                                  child: CustomButton(
                                    radius: 10,
                                      onPressed: controller.enableSignUpButton.value? () async {
                                        if (controller.validateData()) {
                                          // final status = await controller
                                          //     .performRegisterTask();
                                          const status = true;
                                          if (status) {
                                            // await controller.saveLogin().then((_)=> Get.offAllNamed(Routes.DASHBOARD));
                                            Get.offAllNamed(Routes.DASHBOARD);
                                          } else {
                                            CustomSnackbar.showCustomSnackBar(
                                                message:
                                                controller.errorText);
                                          }
                                        } else {
                                          CustomSnackbar.showCustomSnackBar(
                                              message:
                                              controller.errorText);
                                        }
                                      } : null,
                                      backgroundColor: controller.enableSignUpButton.value? Get.theme.primaryColor: Colors.grey,
                                      text: "Submit"),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Obx(() => controller.progressBarStatus.value
                ? CustomProgressBar()
                : Container())
          ],
        ),
      ),
    );
  }
}
