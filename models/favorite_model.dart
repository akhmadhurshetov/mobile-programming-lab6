import 'package:flutter/material.dart';

class FavoriteModel extends ChangeNotifier {
  bool _isFav = false;
  bool get isFav => _isFav;

  void toggle() {
    _isFav = !_isFav;
    notifyListeners();
  }
}
