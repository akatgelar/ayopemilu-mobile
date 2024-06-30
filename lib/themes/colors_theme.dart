// ignore_for_file: use_full_hex_values_for_flutter_colors, prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';

class ThemeColor {
  // static const Color secondaryGrey = Color(0xffF1F3F4);
  // static const Color secondaryMediumGrey = Color(0xff0000004D);
  // static const Color secondaryDarkGrey = Color(0xff606260);
  // static const Color secondaryBlack = Color(0xff2B2F2C);
  // static const Color gradient1 = Color(0xFF2E2739);
  // static const Color gradient2 = Color(0xFF49BEE8);
  static const Color primary = Color(0xff1d4483);
  static const Color white = Color(0xffffffff);
  static const Color black = Color(0xff141915);
  static const Color grey = Colors.grey;
  static const Color greyMedium = Color(0xffE4E4E4);
  static const Color greylight = Color(0xffF9F8FF);
  static const Color blue = Color(0xff239DD1);
  static const Color red = Color(0xffE2173A);
  static const Color green = Color(0xff5EBE4E);
  static const Color yellow = Color(0xffE2B317);
  static const Color background = Color(0xffF1F6FE);
  static const Color cardBackground = Color(0xffF8F9F9);
  static const Color textBackground = Color(0xffF7F7F7);
  static const Color tabsBackground = Color(0xff239DD1);

  ThemeData get themeData {
    ColorScheme colorSchemeMovieApp = ColorScheme(
      // primary green
      primary: Color(0xff1d4483),
      // primary blue
      // primaryVariant: Color(0xffA5D7E8),
      // gradient 1
      surface: Color(0xff2E2739),
      // gradient 2
      background: Color(0xffF1F3F4),
      // secondary grey
      secondary: Color(0xffF1F3F4),
      // secondary dark grey
      // secondaryVariant: Color(0xff606260),
      // secondary red
      error: Color(0xffE2173A),
      // primary green
      onPrimary: Color(0xFFFFFFFF),
      // primary blue
      onSecondary: Color(0xff239DD1),
      // secondary grey
      onSurface: Color(0xff2E2739),
      // secondary dark grey
      onBackground: Color(0xff606260),
      // secondary red
      onError: Color(0xffE2173A),
      // white
      brightness: Brightness.light,
    );

    return ThemeData.from(colorScheme: colorSchemeMovieApp);
  }
}
