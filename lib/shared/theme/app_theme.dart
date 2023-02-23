import 'package:flutter/material.dart';

import 'app_text_theme.dart';

abstract class AppTheme {
  static const primaryColor = Color(0xFFFFA500);

  static final lightTheme = ThemeData.light().copyWith(
    primaryColor: primaryColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: Colors.white,
    textTheme: AppTextTheme.textThemeLight.apply(
      fontFamily: 'Catamaran',
    ),
    primaryTextTheme: AppTextTheme.textThemeLight.apply(
      fontFamily: 'Catamaran',
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1.5, color: primaryColor),
      ),
    ),
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: primaryColor,
    ),
  );
}
