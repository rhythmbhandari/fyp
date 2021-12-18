import 'package:get/get.dart';
import 'package:quicki/app/data/repositories/session_manager.dart';
import 'package:quicki/app/data/repositories/user_repository.dart';
import 'package:quicki/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController with StateMixin<dynamic>{

  @override
  void onInit() {
    startLoader();
    super.onInit();
  }


  startLoader() async{
    Future.delayed(const Duration(seconds: 3)).then((value) async{
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      UserRepository repository = UserRepository(prefs: sharedPreferences);
      var previouslyLaunched = await repository.isAppLaunchedPreviously();
      final logged = await repository.isLoggedIn();
      if(logged){
        final token = await repository.getAccessToken();
        SessionManager.instance.setAccessToken(token);
        Get.offNamed(Routes.DASHBOARD);
      }else{
        Get.offNamed(previouslyLaunched ? Routes.AUTH : Routes.ONBOARDING);
      }
      change(value, status: RxStatus.success());
    });
  }
}
