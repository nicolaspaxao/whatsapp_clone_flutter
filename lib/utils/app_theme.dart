import 'package:flutter/material.dart';

final class AppTheme {
  static bool useMaterial3 = true;
  static Color colorSeed = Colors.greenAccent;

  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      useMaterial3: useMaterial3,
      colorSchemeSeed: colorSeed,
    );
  }

  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      useMaterial3: useMaterial3,
      colorSchemeSeed: colorSeed,
    );
  }
}
