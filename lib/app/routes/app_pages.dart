import 'package:get/get.dart';

import 'package:quicki/app/modules/auth/bindings/auth_binding.dart';
import 'package:quicki/app/modules/auth/views/auth_view.dart';
import 'package:quicki/app/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:quicki/app/modules/dashboard/views/dashboard_view.dart';
import 'package:quicki/app/modules/history/bindings/history_binding.dart';
import 'package:quicki/app/modules/history/views/history_view.dart';
import 'package:quicki/app/modules/home/bindings/home_binding.dart';
import 'package:quicki/app/modules/home/views/home_view.dart';
import 'package:quicki/app/modules/notification/bindings/notification_binding.dart';
import 'package:quicki/app/modules/notification/views/notification_view.dart';
import 'package:quicki/app/modules/onboarding/bindings/onboarding_binding.dart';
import 'package:quicki/app/modules/onboarding/views/onboarding_view.dart';
import 'package:quicki/app/modules/profile/bindings/profile_binding.dart';
import 'package:quicki/app/modules/profile/views/profile_view.dart';
import 'package:quicki/app/modules/splash/bindings/splash_binding.dart';
import 'package:quicki/app/modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.HISTORY,
      page: () => HistoryView(),
      binding: HistoryBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => DashboardView(),
      binding: DashboardBinding(),
    ),
  ];
}
