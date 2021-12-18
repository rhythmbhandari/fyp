import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:quicki/app/modules/auth/views/phone_login_button.dart';
import 'package:quicki/app/modules/phone_login/controllers/phone_login_controller.dart';
import 'package:quicki/app/utils/responsive_size.dart';
import 'package:quicki/app/widgets/custom_progress_bar.dart';
import 'package:quicki/app/widgets/custom_snackbar.dart';

import '../controllers/otp_controller.dart';
import 'otp_textfield.dart';

class OtpView extends GetView<OtpController> {
  final FocusNode firstNode = FocusNode();
  final FocusNode secondNode = FocusNode();
  final FocusNode thirdNode = FocusNode();
  final FocusNode fourthNode = FocusNode();
  final FocusNode fifthNode = FocusNode();

  final PhoneLoginController phoneController = Get.find();

  OtpView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    final phone = Get.arguments;
    controller.setPhone(phone);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xfffafafa),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        elevation: 0,
        title: Text("Verify phone",
            style: Get.textTheme.headline5.copyWith(
              fontSize: getResponsiveFont(18),
              color: Colors.black,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.0,
            )),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SvgPicture.asset(
                      'assets/svg_images/otp.svg',
                      height: Get.height * 0.25,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: Get.height * 0.02),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: "Code is sent to ",
                              style: Get.textTheme.headline5.copyWith(
                                  color: Colors.grey[600],
                                  letterSpacing: 1.2,
                                  fontSize: getResponsiveFont(18))),
                          TextSpan(
                              text: phoneController.phoneInputController.text,
                              style: Get.textTheme.headline5.copyWith(
                                  color: Colors.black,
                                  letterSpacing: 1.2,
                                  fontSize: getResponsiveFont(18))),
                        ],
                      ),
                    ),

                    SizedBox(height: Get.height * 0.05),
                    // Text(LocaleKeys.text_verification.tr,
                    //     textAlign: TextAlign.center,
                    //     style: Get.textTheme.headline6),
                    // Container(
                    //   margin: EdgeInsets.symmetric(
                    //       horizontal: MediaQuery.of(context).size.width * 0.2),
                    //   child: Text(
                    //     LocaleKeys.text_otp_message.tr,
                    //     style:
                    //         Get.textTheme.bodyText2.copyWith(color: kGreyColor),
                    //     textAlign: TextAlign.center,
                    //   ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: OTPTextField(
                            focusNode: firstNode,
                            textEditingController: controller.otpController1,
                            onChanged: (_) {
                              controller.checkOtpComplete();
                              if (_.length == 0) {
                              } else {
                                node.requestFocus(secondNode);
                              }
                            },
                            autofocus: true,
                          ),
                        ),
                        Expanded(
                          child: OTPTextField(
                            focusNode: secondNode,
                            textEditingController: controller.otpController2,
                            onChanged: (_) {
                              controller.checkOtpComplete();
                              if (_.length == 0) {
                                node.requestFocus(firstNode);
                              } else {
                                node.requestFocus(thirdNode);
                              }
                            },
                          ),
                        ),
                        Expanded(
                          child: OTPTextField(
                            focusNode: thirdNode,
                            textEditingController: controller.otpController3,
                            onChanged: (_) {
                              controller.checkOtpComplete();
                              if (_.length == 0) {
                                node.requestFocus(secondNode);
                              } else {
                                node.requestFocus(fourthNode);
                              }
                            },
                          ),
                        ),
                        Expanded(
                          child: OTPTextField(
                            focusNode: fourthNode,
                            textEditingController: controller.otpController4,
                            onChanged: (_) {
                              controller.checkOtpComplete();
                              if (_.length == 0) {
                                node.requestFocus(thirdNode);
                              } else {
                                node.requestFocus(fifthNode);
                              }
                            },
                          ),
                        ),
                        Expanded(
                          child: OTPTextField(
                              focusNode: fifthNode,
                              textEditingController: controller.otpController5,
                              onChanged: (_) {
                                controller.checkOtpComplete();
                                if (_.length == 0) {
                                  node.requestFocus(fourthNode);
                                } else {
                                  node.unfocus();
                                }
                              }),
                        ),
                      ],
                    ),
                    SizedBox(height: Get.height * 0.05),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Didn't receive code?",
                            textAlign: TextAlign.center,
                            style: Get.textTheme.headline5.copyWith(
                                color: Colors.grey[500],
                                letterSpacing: 0.8,
                                fontWeight: FontWeight.w500,
                                fontSize: getResponsiveFont(15))),
                        Text("Request again",
                            textAlign: TextAlign.center,
                            style: Get.textTheme.headline5.copyWith(
                                color: Colors.black,
                                letterSpacing: 0.8,
                                fontWeight: FontWeight.w500,
                                fontSize: getResponsiveFont(15))),
                      ],
                    ),
                    SizedBox(height: Get.height * 0.06),

                    Obx(
                          () => PhoneLoginButton(
                          onPressed: controller.enableOTPButton.value
                              ? () async {
                            // final status = await controller.verifyOtp();
                            const status = true;
                            if (status) {
                              Navigator.pop(context, true);
                            } else {
                              CustomSnackbar.showCustomSnackBar(
                                  message: controller.errorMessage);
                            }
                          }
                              : null,
                          backgroundColor: controller.enableOTPButton.value
                              ? Get.theme.primaryColor
                              : Colors.grey,
                          title: "Verify"),
                    ),
                  ],
                ),
              ),
            ),
            Obx(() => controller.progressBarStatus.value
                ? CustomProgressBar()
                : Container()),
          ],
        ),
      ),
    );
  }
}
