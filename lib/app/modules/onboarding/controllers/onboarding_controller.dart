import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:quicki/app/data/repositories/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';


class OnboardingController extends GetxController {

  final _currentIndex = 0.obs;

  incrementCurrentIndex() => _currentIndex.value++;
  onPageChange(int index) => _currentIndex.value = index;
  SharedPreferences _sharedPreferences;
  UserRepository _userRepository;

  int get currentIndex => _currentIndex.value;

  callNextPage(pageController) {
    incrementCurrentIndex();
    pageController.animateToPage(currentIndex,
        duration: const Duration(milliseconds: 800), curve: Curves.ease);
  }

  @override
  void onInit() {
    super.onInit();
    initializeData();
  }

  initializeData() async{
    _sharedPreferences = await SharedPreferences.getInstance();
    _userRepository = UserRepository(prefs: _sharedPreferences);
    _userRepository.appLaunched();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
