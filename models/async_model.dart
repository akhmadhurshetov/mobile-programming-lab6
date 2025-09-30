import 'package:flutter/material.dart';

class AsyncModel extends ChangeNotifier {
  bool _isLoading = false;
  String _data = "";
  bool get isLoading => _isLoading;
  String get data => _data;

  Future<void> fetchData() async {
    _isLoading = true;
    _data = "";
    notifyListeners();
    await Future.delayed(const Duration(seconds: 2));
    _data = "Fetched user data (fake)";
    _isLoading = false;
    notifyListeners();
  }
}
