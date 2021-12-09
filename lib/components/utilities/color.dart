import 'package:flutter/material.dart';

class ColorsBase {
  static const MaterialColor primary = MaterialColor(
    _primaryValue,
    <int, Color>{
      10: Color(0xFFECF5EF),
      25: Color(0xFF78C18E),
      50: Color(0xFFE6F5EA),
      100: Color(0xFFC3E6CA),
      200: Color(0xFF9DD6A9),
      300: Color(0xFF74C787),
      400: Color(0xFF54BB6E),
      500: Color(0xFF31AF55),
      600: Color(0xFF28A04B),
      700: Color(0xFF1D8E40),
      800: Color(_primaryValue),
      900: Color(0xFF005E22),
    },
  );
  static const int _primaryValue = 0xFF117D35;

  static const MaterialColor secondary = MaterialColor(
    _secondaryValue,
    <int, Color>{
      25: Color(0xFFE9E275),
      50: Color(0xFFFBFBE5),
      100: Color(0xFFF4F3C0),
      200: Color(0xFFEDEA97),
      300: Color(0xFFE7E26E),
      400: Color(0xFFE3DD50),
      500: Color(0xFFDFD832),
      600: Color(0xFFDEC62B),
      700: Color(_secondaryValue),
      800: Color(0xFFDA9916),
      900: Color(0xFFD57200),
    },
  );
  static const int _secondaryValue = 0xFFDCB021;

  static const MaterialColor third = MaterialColor(
    _thirdValue,
    <int, Color>{
      25: Color(0xFFD8D8DA),
      50: Color(0xFFFDF7FF),
      100: Color(0xFFF8F2FF),
      200: Color(0xFFF1EBFF),
      300: Color(0xFFE3DDF6),
      400: Color(0xFFC0BBD3),
      500: Color(0xFFA19CB3),
      600: Color(0xFF787389),
      700: Color(0xFF635F74),
      800: Color(_thirdValue),
      900: Color(0xFF221F31),
    },
  );
  static const int _thirdValue = 0xFF444054;

  static const MaterialColor danger = MaterialColor(
    _dangerValue,
    <int, Color>{
      25: Color(0xFFE6D7D9),
      50: Color(0xFFFEEBF0),
      100: Color(0xFFFECED7),
      200: Color(0xFFEF9BA3),
      300: Color(0xFFE6747F),
      400: Color(0xFFF25260),
      500: Color(0xFFF93E49),
      600: Color(_dangerValue),
      700: Color(0xFFD82B40),
      800: Color(0xFFCA2439),
      900: Color(0xFFBC162D),
    },
  );
  static const int _dangerValue = 0xFFEA3547;
}

class ColorTheme {
  static Color primary = ColorsBase.primary;
  static Color primarySec = ColorsBase.primary[600];
  static Color secondary = ColorsBase.secondary;
  static Color secondarySec = ColorsBase.secondary[500];
  static Color third = ColorsBase.third;
  static Color thirdSec = ColorsBase.third[600];
  static Color fourthColor = Color(0xFFFFF8C4);
  static Color successColor = Color(0xFF4CAF50);
  static Color successTextColor = Color(0xFF155724);
  static Color successBorderColor = Color(0xFFc3e6cb);
  static Color infoColor = Color(0xFFcce5ff);
  static Color infoTextColor = Color(0xFF004085);
  static Color infoBorderColor = Color(0xFFb8daff);
  static Color warningColor = Color(0xFFFFA000);
  static Color warningTextColor = Color(0xFF856404);
  static Color warningBorderColor = Color(0xFFffeeba);
  static Color danger = ColorsBase.danger;
  static Color dangerSec = ColorsBase.danger[400];
}