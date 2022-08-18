import 'package:flutter/material.dart';

import 'app_colors.dart';

class Themes {
  static const String fontFamily = 'IBMPlexSans';

  static ThemeData lightTheme = ThemeData(
    fontFamily: fontFamily,
    backgroundColor: AppColors.lightBG,
    primaryColor: AppColors.lightPrimary,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.lightAccent,
    ),
    dividerColor: AppColors.darkBG,
    scaffoldBackgroundColor: AppColors.lightBG,
    appBarTheme: AppBarTheme(
      toolbarTextStyle: TextStyle(
        color: AppColors.darkBG,
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: _textTheme,
  );

  static ThemeData darkTheme = ThemeData(
    fontFamily: fontFamily,
    brightness: Brightness.dark,
    backgroundColor: AppColors.darkBG,
    primaryColor: AppColors.darkPrimary,
    dividerColor: AppColors.lightPrimary,
    scaffoldBackgroundColor: AppColors.darkBG,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.darkAccent,
    ),
    appBarTheme: AppBarTheme(
      color: AppColors.darkPrimary,
      toolbarTextStyle: TextStyle(
        color: AppColors.lightBG,
        fontSize: 18.0,
        fontWeight: FontWeight.w700,
      ),
    ),
    textTheme: _textTheme,
  );

  static const TextTheme _textTheme = TextTheme(
    displayLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 20,
      fontWeight: FontWeight.w600,
      height: 1.2,
      color: AppColors.black,
    ),
    displayMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 18,
      fontWeight: FontWeight.w600,
      height: 1.22,
    ),
    displaySmall: TextStyle(
      fontFamily: fontFamily,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      height: 1.18,
    ),
    titleLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 20,
      fontWeight: FontWeight.w600,
      height: 1.2,
    ),
    titleMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 18,
      fontWeight: FontWeight.w600,
      height: 1.22,
    ),
    titleSmall: TextStyle(
      fontFamily: fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w600,
      height: 1.21,
    ),
    bodyLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 20,
      fontWeight: FontWeight.w400,
      height: 1.2,
    ),
    bodyMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 18,
      fontWeight: FontWeight.w400,
      height: 1.22,
    ),
    bodySmall: TextStyle(
      fontFamily: fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 1.21,
    ),
    labelLarge: TextStyle(
      fontFamily: fontFamily,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      height: 1.5,
    ),
    labelMedium: TextStyle(
      fontFamily: fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w600,
      height: 1.5,
    ),
    labelSmall: TextStyle(
      fontFamily: fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 1.5,
    ),
  );
}
