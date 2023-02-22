import 'package:flutter/material.dart';

import 'app_dimens.dart';

abstract class AppTheme {
  static final lightTheme = ThemeData.light().copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: Colors.white,
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1.5, color: Colors.blue),
      ),
      contentPadding: AppDimens.inputsContentPadding,
    ),
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: Colors.blue,
    ),
  );
}
