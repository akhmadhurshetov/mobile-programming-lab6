import 'package:flutter/material.dart';

class ThemeModel extends ChangeNotifier {
  bool _isDark = false;
  bool get isDarkMode => _isDark;

  void toggle() {
    _isDark = !_isDark;
    notifyListeners();
  }
}
