import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quicki/app/modules/profile/controllers/profile_controller.dart';

class WalletAndDistanceCard extends GetView<ProfileController> {

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Expanded(
        //   child: WalletAndDistance(
        //     title: LocaleKeys.text_wallet.tr,
        //     value: '${LocaleKeys.units_rs.tr} ${controller.user.value.wallet}',
        //   ),
        // ),
        // SizedBox(width: 1),
        Expanded(
          child: WalletAndDistance(
            title: "Distance travelled",
            value: '32 ${"km"}',
          ),
        ),
      ],
    );
  }
}

class WalletAndDistance extends StatelessWidget {
  final String value;
  final String title;

  WalletAndDistance({this.value, this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      color:Colors.white,
      margin: EdgeInsets.symmetric(vertical: 1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              value,
              style: Get.textTheme.headline5
                  .copyWith(color: Get.theme.accentColor),
            ),
            Text(title,
                style: Get.textTheme.bodyText2
                    .copyWith(fontSize: 12, color: Colors.black54)),
          ],
        ),
      ),
    );
  }
}
