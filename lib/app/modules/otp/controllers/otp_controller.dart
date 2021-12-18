import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {

  TextEditingController otpController1 = TextEditingController();
  TextEditingController otpController2 = TextEditingController();
  TextEditingController otpController3 = TextEditingController();
  TextEditingController otpController4 = TextEditingController();
  TextEditingController otpController5 = TextEditingController();

  final enableOTPButton = false.obs;
  String _otpInput = '';
  String phone;
  String errorMessage;
  final progressBarStatus = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  checkOtpComplete() {
    if (otpController1.text.length == 1 &&
        otpController2.text.length == 1 &&
        otpController3.text.length == 1 &&
        otpController4.text.length == 1 &&
        otpController5.text.length == 1) {
      enableOTPButton.value = true;
      getEnteredOtp();
    } else {
      enableOTPButton.value = false;
    }
  }

  getEnteredOtp() {
    if (otpController1.text != '' &&
        otpController2.text != '' &&
        otpController3.text != '' &&
        otpController4.text != '' &&
        otpController5.text != '') {
      _otpInput = otpController1.text.toString()[0] +
          otpController2.text.toString()[0] +
          otpController3.text.toString()[0] +
          otpController4.text.toString()[0] +
          otpController5.text.toString()[0];
    }
  }

  void setPhone(phone) => this.phone = phone;
  showProgressBar() => progressBarStatus.value = true;
  hideProgressBar() => progressBarStatus.value = false;

}
