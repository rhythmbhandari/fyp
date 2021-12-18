import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThreeDotIndicator extends StatelessWidget {
  final int positionIndex, currentIndex;

  const ThreeDotIndicator({ Key key, this.currentIndex, this.positionIndex}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12,
      width: 12,
      decoration: BoxDecoration(
        border: Border.all(color: positionIndex == currentIndex ? Colors.transparent : Get.theme.accentColor),
        color: positionIndex == currentIndex ? Get.theme.accentColor : Colors.transparent,
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }
}
