import 'package:flutter/material.dart';

class SettingsProvider with ChangeNotifier {
  ThemeMode mode;
  String local;

  SettingsProvider()
      : mode = ThemeMode.light,
        local = 'en';

  void changeMode(ThemeMode mode) {
    this.mode = mode;
    notifyListeners();
  }

  void changeLocal(String local) {
    this.local = local;
    notifyListeners();
  }
}
