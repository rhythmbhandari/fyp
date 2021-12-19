import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'custom_marker.dart';


Future<BitmapDescriptor> placeToMarker(String title, int duration,
    {IconData icon}) async {
  final recoder = ui.PictureRecorder();
  final canvas = ui.Canvas(recoder);
  double widthInDp = Get.width;
  double physicalPixelWidth = Get.width * Get.pixelRatio;
  double dpi = ((physicalPixelWidth / widthInDp) * 160) - 5;
  final size = ui.Size(dpi, 100);

  final customMarker = MyCustomMarker(
    label: title,
    duration: duration,
    icon: icon,
  );
  customMarker.paint(canvas, size);
  final picture = recoder.endRecording();
  final image = await picture.toImage(
    size.width.toInt(),
    size.height.toInt(),
  );
  final byteData = await image.toByteData(
    format: ui.ImageByteFormat.png,
  );

  final bytes = byteData.buffer.asUint8List();
  return BitmapDescriptor.fromBytes(bytes);
}
