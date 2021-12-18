import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quicki/app/modules/auth/views/phone_login_button.dart';
import 'package:quicki/app/routes/app_pages.dart';
import 'package:quicki/app/utils/responsive_size.dart';
import 'package:quicki/app/widgets/custom_dropdown_menu.dart';
import 'package:quicki/app/widgets/custom_progress_bar.dart';
import 'package:quicki/app/widgets/custom_snackbar.dart';
import 'package:quicki/app/widgets/phone_input_field.dart';
import 'package:quicki/config/custom_color.dart';

import '../controllers/phone_login_controller.dart';

class PhoneLoginView extends GetView<PhoneLoginController> {
  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xfffafafa),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        elevation: 0,
        title: Text("Continue with phone",
            style: Get.textTheme.headline5.copyWith(
              fontSize: getResponsiveFont(18),
              color: Colors.black,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.0,
            )),
        centerTitle: true,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Stack(
              children: [
                Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Center(
                          child: SizedBox(
                            width: Get.width * 0.6,
                            height: Get.height * 0.3,
                            child: Image.asset(
                              'assets/images/phone.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        SizedBox(height: Get.height * 0.02),
                        Text("You'll receiver a 5 digit code\nto verify next.",
                            textAlign: TextAlign.center,
                            style: Get.textTheme.headline5.copyWith(
                                color: Colors.grey[600],
                                fontSize: getResponsiveFont(18))),
                        SizedBox(height: Get.height * 0.03),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Text("Enter your phone",
                              textAlign: TextAlign.justify,
                              style: Get.textTheme.headline5.copyWith(
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.w600,
                                  fontSize: getResponsiveFont(14))),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: PhoneInputField(
                            controller: controller.phoneInputController,
                            onChanged: (input) => controller.setPhoneInput(input),
                            prefix: Padding(
                              padding: const EdgeInsets.only(
                                right: 8.0,
                                bottom: 8,
                              ),
                              child: Obx(
                                    () => CustomDropDownMenu(
                                  country: true,
                                  onChanged: (value) {
                                    controller.setSelectedCountryPhone(value);
                                  },
                                  value: controller.countryCode.value,
                                  itemList: controller.countryOption,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: Get.height * 0.05),
                        Obx(
                              () => Container(
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            child: PhoneLoginButton(
                              onPressed: controller.enableSubmit.value
                                  ? () async {
                                node.unfocus();
                                // final status =
                                // await controller.callServerForOTP();
                                const status = true;
                                if (!status) {
                                  CustomSnackbar.showCustomSnackBar(
                                      message: controller.errorMessage);
                                  return;
                                }
                                final response = await Get.toNamed(
                                    Routes.OTP,
                                    arguments: controller.phoneInput);
                                if (response != null && response) {
                                  Navigator.pop(context, true);
                                }
                              }
                                  : null,
                              backgroundColor: controller.enableSubmit.value
                                  ? null
                                  : kGreyColor,
                              title: "Continue",
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                controller.progressbarStatus.value
                    ? CustomProgressBar()
                    : Container()
              ],
            ),
          )),
    );
  }
}
