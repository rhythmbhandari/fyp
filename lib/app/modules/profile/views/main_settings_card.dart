import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quicki/app/modules/profile/controllers/profile_controller.dart';
import './../../../widgets/icon_text_button.dart';
import 'language_screen.dart';

class MainSettingsCard extends GetView<ProfileController> {

  @override
  Widget build(BuildContext context) {
    return Card(
      color:Colors.white,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: Column(
        children: [
          IconTextButton(
            icon: Icons.payment,
            title: "Top up payment",
            onTap: () {
              // controller.topUpWallet();
            },
          ),
          IconTextButton(
            icon: Icons.money_outlined,
            title: "Document",
            onTap: () {},
          ),
          IconTextButton(
            icon: Icons.settings,
            title: "Language",
            onTap: () {
              Get.to(LanguageScreen());
            },
          ),
          IconTextButton(
            icon: Icons.info_outline,
            title: "About",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
