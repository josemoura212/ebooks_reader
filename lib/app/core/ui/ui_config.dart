import 'package:flutter/material.dart';

class UiConfig {
  UiConfig._();

  static String get title => "Ebooks Reader";

  static ThemeData get theme => ThemeData(
        useMaterial3: true,
        primaryColor: const Color.fromARGB(255, 26, 207, 124),
        scaffoldBackgroundColor: const Color.fromARGB(255, 98, 101, 110),
      );
}
