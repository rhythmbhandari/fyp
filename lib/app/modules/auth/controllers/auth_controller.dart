import 'package:get/get.dart';
import 'package:quicki/app/data/repositories/session_manager.dart';
import 'package:quicki/app/data/repositories/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final progressStatus = false.obs;

  showProgressBar() => progressStatus.value = true;
  hideProgressBar() => progressStatus.value = false;
  UserRepository _userRepository;
  SharedPreferences _sharedPreferences;

  @override
  void onInit() {
    super.onInit();
    initializeData();

  }

  initializeData() async{
    _sharedPreferences = await SharedPreferences.getInstance();
    _userRepository = UserRepository(prefs: _sharedPreferences);
  }


  @override
  void onClose() {}

  Future<void> saveToken() async{
    await _userRepository.login(SessionManager.instance.accessToken);
  }
}
