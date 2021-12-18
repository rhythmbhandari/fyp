import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:quicki/app/data/repositories/session_manager.dart';
import 'package:quicki/app/routes/app_pages.dart';
import 'package:quicki/app/widgets/custom_progress_bar.dart';
import 'package:quicki/app/widgets/custom_snackbar.dart';
import 'package:quicki/app/widgets/facebook_google_login_button.dart';

import '../controllers/auth_controller.dart';
import 'phone_login_button.dart';

class AuthView extends GetView<AuthController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Stack(
            children: [
              SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Lottie.asset('assets/animations/login.json'),
                    SizedBox(height: Get.height * 0.05),
                    PhoneLoginButton(
                      title: "Continue with Phone",
                      onPressed: () async {
                        final status = await Get.toNamed(Routes.PHONE_LOGIN);
                        if (status != null && status) {
                          if (SessionManager.instance.accessToken == null) {
                            Get.toNamed(Routes.SIGNUP);
                          } else {
                            await controller
                                .saveToken()
                                .then((_) => Get.offAllNamed(Routes.DASHBOARD));
                          }
                        }
                      },
                    ),
                    SizedBox(height: Get.height * 0.05),
                    Text(
                      "Or",
                      textAlign: TextAlign.center,
                      style: Get.textTheme.bodyText2,
                    ),
                    SizedBox(height: Get.height * 0.05),
                    Row(
                      children: [
                        Expanded(
                          child: FacebookGoogleLoginButton(
                            iconUrl: 'assets/svg_images/google.svg',
                            title: "Google",
                            onTap: () async {
                              CustomSnackbar.showCustomSnackBar(message: "Google button is pressed.");
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: FacebookGoogleLoginButton(
                            title: "Facebook",
                            iconUrl: 'assets/svg_images/fb.svg',
                            onTap: () async{
                              CustomSnackbar.showCustomSnackBar(message: "Facebook button is pressed.");
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: Get.height * 0.05),
                    _buildTermsAndConditions()
                  ],
                ),
              ),
              Obx(() => controller.progressStatus.value
                  ? CustomProgressBar()
                  : Container())
            ],
          ),
        ),
      ),
    );
  }

  RichText _buildTermsAndConditions() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
              text: "Tapping",
              style: Get.textTheme.bodyText2),
          TextSpan(
              text: " the continue buttons ",
              style: Get.textTheme.bodyText2
                  .copyWith(),),
          TextSpan(
              text: "you agree to the ", style: Get.textTheme.bodyText2),
          TextSpan(
              text: "terms and conditions",
              style: Get.textTheme.bodyText2
                  .copyWith(color: Get.theme.primaryColor),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  print('Clicked signup page.');
                  // Get.to(SignUpScreen());
                }),
          TextSpan(
              text: " and", style: Get.textTheme.bodyText2),
          TextSpan(
              text: " privacy policy ",
              style: Get.textTheme.bodyText2
                  .copyWith(color: Get.theme.primaryColor),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  print('Clicked signup page.');
                  // Get.to(SignUpScreen());
                }),
          TextSpan(
              text: " of Quicki ",
              style: Get.textTheme.bodyText2),
        ],
      ),
    );
  }
}