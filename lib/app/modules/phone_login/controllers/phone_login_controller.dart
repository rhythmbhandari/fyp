import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhoneLoginController extends GetxController {
  TextEditingController phoneInputController = TextEditingController();

  String phoneInput = '';
  final enableSubmit = false.obs;
  String errorMessage;
  final List<String> countryOption = [
    '+977',
  ];
  final countryCode = '+977'.obs;
  final progressbarStatus = false.obs;

  void setPhoneInput(value) {
    phoneInput = value;
    (phoneInput.length == 10)
        ? enableSubmit.value = true
        : enableSubmit.value = false;
  }

  void setSelectedCountryPhone(value) => countryCode.value = value;

  @override
  void onInit() {
    super.onInit();
  }

  // Future<bool> callServerForOTP() async {
  //   showProgressbar();
  //   final response =
  //   await OtpRepository.callServerForOtp(phoneInput).catchError((error) {
  //     errorMessage = error.toString();
  //   });
  //   hideProgressbar();
  //   if (response == null) {
  //     return false;
  //   }
  //   return true;
  // }

  showProgressbar() => progressbarStatus.value = true;

  hideProgressbar() => progressbarStatus.value = false;

  @override
  void onClose() {}
}
