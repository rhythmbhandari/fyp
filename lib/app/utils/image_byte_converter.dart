import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/services.dart';


class ImageByteConverter {
  
  static Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec =
        await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png)).buffer.asUint8List();
   }

   static Future<Uint8List> readFileByte(File file) async {
    Uint8List bytes;
    await file.readAsBytes().then((value) {
    bytes = Uint8List.fromList(value); 
    print('reading of bytes is completed');
  }).catchError((onError) {
      print('Exception Error while reading audio from path:' +
      onError.toString());
  });
  return bytes;
}
}