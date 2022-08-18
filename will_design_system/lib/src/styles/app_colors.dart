library color;

import 'package:flutter/material.dart';

class AppColors {
  //Colors for theme
  static Color lightPrimary = const Color(0xffe43e07);
  static Color darkPrimary = const Color(0xff16161C);
  static Color lightAccent = Colors.orange;
  static Color darkAccent = Colors.orange;
  static Color lightBG = const Color(0xfffcfcff);
  static Color darkBG = const Color(0xff212121);

  /// Neutral Colors
  static const Color black = Color(0xFF101111);
  static const Color grey80 = Color(0xFF303030);
  static const Color grey60 = Color(0xFF505050);
  static const Color grey40 = Color(0xFF888888);
  static const Color grey20 = Color(0xFFCDCDCD);
  static const Color grey10 = Color(0xFFEDEBEB);
  static const Color blue = Color(0xFF7186C8);

  static Color white = const Color(0xffffffff);
  static Color whiteSemiTransparent = Colors.white70;
  static Color grey = Colors.grey;
  static Color greyBg = const Color(0xfff0f0f0);
  static Color red = Colors.red;
  static Color yellow = Colors.yellow;
  static Color green = Colors.green;
  static Color setActive = Colors.grey[500] ?? const Color(0xFF9E9E9E);
  static Color blueGrey = Colors.blueGrey;
  static Color black12 = Colors.black12;
  static Color transparent = const Color(0x00000000);

  static Color getColorCircleProgress(double s) {
    var r = AppColors.red;
    if (s > 4.5 && s < 7) {
      r = AppColors.yellow;
    } else if (s >= 7) {
      r = AppColors.green;
    }
    return r;
  }
}
