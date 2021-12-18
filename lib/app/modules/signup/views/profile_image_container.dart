import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quicki/app/modules/signup/controllers/signup_controller.dart';
import 'package:quicki/app/utils/image_selector.dart';

class ProfileImageContainer extends GetView<SignupController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignupController>(
      builder: (controller) => GestureDetector(
        onTap: () {
          _showPicker(context);
        },
        child: SizedBox(
          height: Get.width * 0.4,
          width: Get.width,
          child: Center(
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xfff4f5fe),
                  borderRadius: BorderRadius.circular(10),
                ),
                height: Get.width * 0.35,
                width: Get.width * 0.35,
                child: controller.imageFile != null
                    ? ClipRRect(
                  borderRadius: BorderRadius.circular(Get.width * 0.35 / 2),
                  child: Image.file(controller.imageFile,
                      height: Get.width * 0.35,
                      width: Get.width * 0.35,
                      fit: BoxFit.cover),
                )
                    : Icon(
                  Icons.add_a_photo_rounded,
                  color: Colors.grey[800],
                ),
              )),
        ),
      ),
    );
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: Icon(
                      Icons.photo_library,
                      color: Get.theme.primaryColor,
                    ),
                    title: Text("Photo Library.",
                        style: Get.textTheme.headline5
                            .copyWith(color: Get.theme.accentColor)),
                    onTap: () async {
                      File selectedImage = await ImageSelector().getSelectedImage(ImageSource.gallery);
                      controller.updateImageFile(selectedImage);
                      Navigator.of(context).pop();
                    }),
                ListTile(
                  leading: Icon(
                    Icons.photo_camera,
                    color: Get.theme.primaryColor,
                  ),
                  title: Text("Open Camera.",
                      style: Get.textTheme.headline5
                          .copyWith(color: Get.theme.accentColor)),
                  onTap: () async {
                    File selectedImage = await ImageSelector().getSelectedImage(ImageSource.camera);
                    controller.updateImageFile(selectedImage);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
  }





}
