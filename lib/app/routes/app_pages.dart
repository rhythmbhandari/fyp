import 'package:get/get.dart';

import 'package:quicki/app/modules/auth/bindings/auth_binding.dart';
import 'package:quicki/app/modules/auth/views/auth_view.dart';
import 'package:quicki/app/modules/booking/bindings/booking_binding.dart';
import 'package:quicki/app/modules/booking/views/booking_view.dart';
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
import 'package:quicki/app/modules/otp/bindings/otp_binding.dart';
import 'package:quicki/app/modules/otp/views/otp_view.dart';
import 'package:quicki/app/modules/phone_login/bindings/phone_login_binding.dart';
import 'package:quicki/app/modules/phone_login/views/phone_login_view.dart';
import 'package:quicki/app/modules/profile/bindings/profile_binding.dart';
import 'package:quicki/app/modules/profile/views/profile_view.dart';
import 'package:quicki/app/modules/signup/bindings/signup_binding.dart';
import 'package:quicki/app/modules/signup/views/signup_view.dart';
import 'package:quicki/app/modules/splash/bindings/splash_binding.dart';
import 'package:quicki/app/modules/splash/views/splash_view.dart';
import 'package:quicki/app/modules/trip/bindings/trip_binding.dart';
import 'package:quicki/app/modules/trip/views/trip_view.dart';

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
    GetPage(
      name: _Paths.PHONE_LOGIN,
      page: () => PhoneLoginView(),
      binding: PhoneLoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.OTP,
      page: () => OtpView(),
      binding: OtpBinding(),
    ),
    GetPage(
      name: _Paths.BOOKING,
      page: () => BookingView(),
      binding: BookingBinding(),
    ),
    GetPage(
      name: _Paths.TRIP,
      page: () => TripView(),
      binding: TripBinding(),
    ),
  ];
}
