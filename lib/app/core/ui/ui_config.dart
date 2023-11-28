import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UiConfig {
  UiConfig._();

  static String get title => "Ebooks Reader";

  static ThemeData get theme => ThemeData(
        useMaterial3: true,
        primaryColor: const Color.fromARGB(255, 26, 207, 124),
        scaffoldBackgroundColor: const Color.fromARGB(255, 98, 101, 110),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 26, 207, 124),
        ),
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        textTheme: GoogleFonts.merriweatherTextTheme(),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all(
              GoogleFonts.merriweather(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );
}
