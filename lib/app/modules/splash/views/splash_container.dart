import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
class SplashContainer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Lottie.asset('assets/animations/car_animation1.json'),
    );
  }
}