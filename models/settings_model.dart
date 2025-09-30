import 'package:flutter/material.dart';

class SettingsModel extends ChangeNotifier {
  bool _notificationsEnabled = true;
  double _volumeLevel = 0.5;

  bool get notificationsEnabled => _notificationsEnabled;
  double get volumeLevel => _volumeLevel;

  void toggleNotifications(bool value) {
    _notificationsEnabled = value;
    notifyListeners();
  }

  void setVolume(double value) {
    _volumeLevel = value;
    notifyListeners();
  }
}
