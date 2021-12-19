import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quicki/app/data/repositories/user_repository.dart';
import 'package:quicki/app/utils/language_preferences.dart';
import 'package:quicki/app/widgets/custom_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageScreen extends StatefulWidget {
  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  int index = 0;

  @override
  void initState() {
    getLanguageIndex();
    super.initState();
  }

  getLanguageIndex() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    UserRepository userRepository = UserRepository(prefs: sharedPreferences);
    index = await userRepository.getLanguageIndex();
    if(index == null) {
      index = 0;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Select preferred language",
          style:
              Get.textTheme.headline6.copyWith(color: Get.theme.primaryColor),
        ),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    index = 0;
                  });
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'svg_assets/united_kingdom.svg',
                      height: 40,
                      width: 40,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Text(
                        'English',
                        style: Get.textTheme.headline5.copyWith(fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Radio(
                      groupValue: index,
                      value: 0,
                      onChanged: (value) {
                        setState(() {
                          index = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  setState(() {
                    index = 1;
                  });
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'svg_assets/nepal.svg',
                      height: 40,
                      width: 40,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Text(
                        'नेपाली',
                        style: Get.textTheme.headline5.copyWith(fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Radio(
                      groupValue: index,
                      value: 1,
                      onChanged: (value) {
                        setState(() {
                          index = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(),
              ),
              Container(
                child: CustomButton(
                    onPressed: () {
                      LanguagePreferences.updateLanguageSettings(index)
                          .then((value) => Navigator.pop(context, true));
                    },
                    text:"Set language"),
                width: Get.width,
              ),
              SizedBox(
                height: Get.height * 0.05,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
