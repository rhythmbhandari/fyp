import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quicki/app/data/repositories/session_manager.dart';

class MainDrawer extends StatelessWidget {

  final SessionManager _sessionManager = SessionManager.instance;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: MediaQuery.of(context).padding.top),
              SizedBox(height: 16),
              Center(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      'assets/pin.png',
                      height: 40,
                      width: 40,
                    ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                _sessionManager.user.name,
                style: Get.textTheme.headline6
                    .copyWith(color: Get.theme.accentColor),
              ),
              Text(
                '${"Balance"}: ${"Rs"} 100',
                style: Get.textTheme.headline5
                    .copyWith(color: Get.theme.primaryColor),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.account_balance_wallet),
                  SizedBox(width: 8),
                  Text(
                    "Top up balance.",
                    style: Get.textTheme.headline5,
                  ),
                ],
              ),
              Expanded(child: Container()),
              Container(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: Icon(Icons.account_balance_wallet),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        child: Container(child: Icon(Icons.history)),
                        onTap: (){
                          // Get.to(HistoryFullScreen());
                        },
                      ),
                    ),
                    Expanded(
                      child: InkWell(child: Icon(Icons.card_giftcard), onTap: (){
                        // Get.to(PromotionScreen());
                      },),
                    ),
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}
