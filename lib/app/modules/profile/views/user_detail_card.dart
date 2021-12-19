import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quicki/app/data/models/user.dart';
import './../../../widgets/icon_text.dart';

class UserDetailCard extends StatelessWidget {
  final User user;
  final Function onPressed;

  UserDetailCard({this.user, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(Get.width * 0.25 / 2),
                  child: Container()
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Rhythm Bhandari',
                          style: Get.textTheme.headline5
                              .copyWith(color: Get.theme.accentColor)),
                      Text(
                        "User",
                        style: Get.textTheme.bodyText2
                            .copyWith(color: Get.theme.primaryColor),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 16),
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: onPressed,
                    icon: Icon(
                      Icons.edit,
                      color: Get.theme.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            IconText(
              icon: Icons.phone,
              title: "9869191572",
            ),
            SizedBox(height: 8),
            IconText(
                icon: Icons.mail_outline,
                title: "rhythm@it.com"),
          ],
        ),
      ),
    );
  }
}
