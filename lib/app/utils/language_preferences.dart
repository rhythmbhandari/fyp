import 'package:quicki/app/data/repositories/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'localization_services.dart';

class LanguagePreferences {

  static Future<void> updateLanguageSettings(int index) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    UserRepository userRepository = UserRepository(prefs: sharedPreferences);
  }

  static void getSavedLanguage() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    UserRepository userRepository = UserRepository(prefs: sharedPreferences);
    int index = await userRepository.getLanguageIndex();
    if(index == null) {
      index = 0;
    }
  }
}
