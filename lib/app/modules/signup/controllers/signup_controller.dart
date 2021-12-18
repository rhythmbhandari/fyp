import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:quicki/app/data/repositories/session_manager.dart';
import 'package:quicki/app/data/repositories/user_repository.dart';
import 'package:quicki/app/utils/validator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupController extends GetxController {
  PickedFile _pickedImage;
  final progressBarStatus = false.obs;
  File _imageFile;
  String firstName;
  String lastName;
  String email = '';
  String phone;
  String password;
  String _errorText;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final List<String>  _genderList = ['Male', 'Female', 'Others'];
  final selectedGender = 'Male'.obs;
  final _dob = DateTime.now().add(const Duration(days: -365 * 18)).obs;
  Timer timer;
  final enableSignUpButton = false.obs;
  final passwordInvisible = true.obs;

  PickedFile get pickedImage => _pickedImage;

  File get imageFile => _imageFile;

  String get errorText => _errorText;

  List<String> get genderList => _genderList;

  DateTime get dob => _dob.value;

  String get dateOfBirth => dateToString(_dob.value);

  void setPickedImage(pickedImage) {
    _pickedImage = pickedImage;
    update();
  }

  void updateDob(DateTime date) {
    _dob.value = date;
  }

  updateGender(String newGender) => selectedGender.value = newGender;

  void updateImageFile(File file) {
    _imageFile = file;
    update();
  }

  String dateToString(DateTime dateTime) {
    if (dateTime == null) {
      return 'Not found';
    }
    return DateFormat('yyyy/MM/dd').format(dateTime);
  }

  bool validateData() {
    firstName = firstNameController.text;
    lastName = lastNameController.text;
    email = emailController.text;
    password = passwordController.text;

    bool isValid = false;

    if (!(firstName.length > 1 && Validator.isName(firstName))) {
      _errorText = 'first_name_error'.tr;
    } else if (!(lastNameController.value.text.length > 1 &&
        Validator.isName(lastNameController.value.text))) {
      _errorText = 'last_name_error'.tr;
    } else if (!(Validator.isEmail(emailController.value.text))) {
      _errorText = 'valid_email_error'.tr;
    } else if (dateToString(_dob.value) == dateToString(DateTime.now())) {
      _errorText = 'valid_dob'.tr;
    } else {
      isValid = true;
    }
    return isValid;
  }


  void checkFormFilled() {
    if (firstNameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty &&
        emailController.text.isNotEmpty) {
      enableSignUpButton.value = true;
    } else {
      enableSignUpButton.value = false;
    }
  }

  changePasswordVisibility(bool visibility) =>
      passwordInvisible.value = visibility;

  void hideProgressBar() => progressBarStatus.value = false;

  void showProgressBar() => progressBarStatus.value = true;

  Future<void> saveLogin() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    UserRepository userRepository = UserRepository(prefs: sharedPreferences);
    await userRepository.login(SessionManager.instance.accessToken);
  }
}
