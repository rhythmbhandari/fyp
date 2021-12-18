import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'carousal.dart';

class CarousalView extends StatelessWidget {
  final List<String> imageUrlList;

  CarousalView({this.imageUrlList});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.25,
      child: Carousel(
        radius: Radius.circular(15),
        borderRadius: true,
        boxFit: BoxFit.cover,
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1500),
        dotSize: 6.0,
        dotBgColor: Colors.transparent,
        showIndicator: true,
        images: [
          ...imageUrlList
              .map(
                (imageUrl) => Image.asset(
                  imageUrl,
                  fit: BoxFit.cover,
                  height: Get.height * 0.25,
                ),
              )
              .toList()
        ],
      ),
    );
  }
}
