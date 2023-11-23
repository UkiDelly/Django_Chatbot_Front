import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  // 화면 크기 관련
  double get fullWith => MediaQuery.of(this).size.width;

  double get fullHeight => MediaQuery.of(this).size.height;

  double get halfWith => fullWith / 2;

  double get halfHeight => fullHeight / 2;

  double width(double percent) => (fullWith * percent) / 100;

  // 테마 관련
  TextTheme get textTheme => Theme.of(this).textTheme;
}
