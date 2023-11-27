import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  Color get primaryColor => Theme.of(this).primaryColor;
  Color get backgroundColor => Theme.of(this).scaffoldBackgroundColor;
  TextTheme get textTheme => Theme.of(this).textTheme;
}
