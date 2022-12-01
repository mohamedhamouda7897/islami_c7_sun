import 'package:flutter/material.dart';

import '../my_theme.dart';

class MyProvider extends ChangeNotifier {
  String languageCode = 'en';
  ThemeMode mode = ThemeMode.light;
  Color selected = MyThemeData.colorGold;

  void changeLanguage(String lang) {
    if (languageCode == lang) return;
    languageCode = lang;
    notifyListeners();
  }

  String getBackGroundImage() {
    if (mode == ThemeMode.light) {
      return 'assets/images/main_background.png';
    }
    return 'assets/images/main_background_dark.png';
  }

  void changeThemeMOde(ThemeMode modee) {
    mode = modee;
    notifyListeners();
  }

  Color getSelectedColor(String lang) {
    return languageCode == lang
        ? MyThemeData.colorGold
        : MyThemeData.colorBlack;
  }
}
