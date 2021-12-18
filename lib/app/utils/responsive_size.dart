import 'package:get/get.dart';

double getResponsiveFont(int fontSize) {
  double widthInDp = Get.width;
  double physicalPixelWidth = Get.width * Get.pixelRatio;
  double dpi = ((physicalPixelWidth / widthInDp) * 160) - 5;

  if (dpi <= 120) {
    return 0.25 * fontSize;
  } else if (dpi <= 160) {
    return (1 / 3) * fontSize;
  } else if (dpi <= 240) {
    return 0.5 * fontSize;
  } else if (dpi <= 320) {
    return 0.75 * fontSize;
  } else if (dpi <= 480) {
    return 1.0 * fontSize;
  } else if (dpi <= 600) {
    return (4 / 3) * fontSize;
  } else {
    return 1.5 * fontSize;
  }
}