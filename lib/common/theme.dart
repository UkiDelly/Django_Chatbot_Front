import 'package:flutter/material.dart';

abstract class AppColor {
  static const mainColor = Color(0xff0E58FE);
}

final theme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  colorSchemeSeed: const Color(0xff0E58FE),
  useMaterial3: true,
);
