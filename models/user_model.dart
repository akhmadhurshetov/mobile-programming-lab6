import 'package:flutter/material.dart';

class UserModel extends ChangeNotifier {
  String _username = "Guest";
  String get username => _username;

  void changeToAdmin() {
    _username = "Admin";
    notifyListeners();
  }

  void updateName(String newName) {
    _username = newName;
    notifyListeners();
  }
}
