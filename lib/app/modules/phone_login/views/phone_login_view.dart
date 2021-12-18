import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/phone_login_controller.dart';

class PhoneLoginView extends GetView<PhoneLoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PhoneLoginView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'PhoneLoginView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
