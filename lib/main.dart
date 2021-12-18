import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'config/theme.dart';

void main() {
  runApp(
    const MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
      home: Quicki()
    );
  }
}

class Quicki extends StatefulWidget {
  const Quicki({Key key}) : super(key: key);

  @override
  _QuickiState createState() => _QuickiState();
}

class _QuickiState extends State<Quicki> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Quicki",
      theme: kThemeData,
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
