import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quicki/app/routes/app_pages.dart';
import 'package:quicki/app/widgets/three_dot_indicator.dart';

import '../controllers/onboarding_controller.dart';
import 'page_content_view.dart';
import 'proceed_button.dart';

class OnboardingView extends GetView<OnboardingController> {

  OnboardingView({Key key}) : super(key: key);

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageContentView(
                pageController: _pageController,
                onPageChanged: controller.onPageChange,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Get.width * 0.05, vertical: Get.height * 0.03),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: <Widget>[
                      dotsIndicator(0),
                      const SizedBox(width: 10),
                      dotsIndicator(1),
                      const SizedBox(width: 10),
                      dotsIndicator(2),
                    ],
                  ),
                  ProceedButton(
                    onPressed: () {
                      controller.currentIndex < 2
                          ? controller.callNextPage(_pageController)
                          : Get.offNamed(Routes.AUTH);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Obx dotsIndicator(positionIndex) {
    return Obx(() {
      return ThreeDotIndicator(
        positionIndex: positionIndex,
        currentIndex: controller.currentIndex,
      );
    });
  }
}
