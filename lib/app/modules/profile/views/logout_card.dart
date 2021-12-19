import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quicki/app/data/repositories/session_manager.dart';
import 'package:quicki/app/data/repositories/user_repository.dart';
import 'package:quicki/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './../../../widgets/icon_text_button.dart';

class LogoutCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
        color:Colors.white,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        child: IconTextButton(
          icon: Icons.logout,
          title: "Logout",
          titleColor: Theme.of(context).primaryColor,
          iconColor: Theme.of(context).primaryColor,
          onTap: logout,
        ));
  }

  logout() async {
    UserRepository repository =
        UserRepository(prefs: await SharedPreferences.getInstance());
    await repository.logout();
    SessionManager.instance.setAccessToken(null);
    Get.offAllNamed(Routes.AUTH);
  }
}
