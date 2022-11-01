import 'package:flutter/material.dart';

final kDarkTheme = ThemeData.dark().copyWith(
  // foregroundColor - цвет title текста
  appBarTheme:
      const AppBarTheme(color: Colors.black, foregroundColor: Colors.white),
  scaffoldBackgroundColor: Colors.black,
  primaryColor: Colors.white,
  floatingActionButtonTheme:
      const FloatingActionButtonThemeData(backgroundColor: Colors.amber),
);

final kLightTheme = ThemeData.dark().copyWith(
  // foregroundColor - цвет title текста
  appBarTheme:
      const AppBarTheme(color: Colors.white, foregroundColor: Colors.black),
  scaffoldBackgroundColor: Colors.white,
  primaryColor: Colors.black,
  floatingActionButtonTheme:
      const FloatingActionButtonThemeData(backgroundColor: Colors.amber),
);

class OwnDarkTheme {
  static const Color errorTextColor = Colors.red;
  static const Color blueOffBackColor = Colors.blue;
}

class OwnLightTheme {
  static const Color errorTextColor = Colors.red;
  static const Color blueOffBackColor = Colors.blue;
}
