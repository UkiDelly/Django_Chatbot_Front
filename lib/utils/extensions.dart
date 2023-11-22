import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  double get fullWith => MediaQuery.of(this).size.width;

  double get fullHeight => MediaQuery.of(this).size.height;

  double get halfWith => fullWith / 2;

  double get halfHeight => fullHeight / 2;
}
