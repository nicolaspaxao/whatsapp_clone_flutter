import 'package:flutter/material.dart';

final themeCtrl = ThemeController();

class ThemeController extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  void handleChange(bool useLighTheme) {
    themeMode = useLighTheme ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }
}
