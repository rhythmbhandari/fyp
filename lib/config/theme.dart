import 'package:flutter/material.dart';
import 'package:quicki/app/utils/responsive_size.dart';

final kThemeData = ThemeData().copyWith(
  // primaryColor: Color(0xffEB2027),
  // accentColor: Color(0xff2E368F),
  primaryColor: const Color.fromRGBO(225, 89, 89, 1),
  accentColor: const Color(0xff3f48cc),
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(
      color: Color(0xffEB2027),
    ),
  ),
  textTheme: const TextTheme().copyWith(
    bodyText2: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: getResponsiveFont(14),
      color: Colors.black,
    ),
    headline5: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: getResponsiveFont(16),
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
    headline6:  TextStyle(
      fontFamily: 'Montserrat',
      fontSize: getResponsiveFont(20),
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
  ),
);
