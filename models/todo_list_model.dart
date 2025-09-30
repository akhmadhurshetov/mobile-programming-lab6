import 'package:flutter/material.dart';

class TodoListModel extends ChangeNotifier {
  final List<String> _tasks = [];
  List<String> get tasks => List.unmodifiable(_tasks);

  void addTask(String task) {
    if (task.trim().isEmpty) return;
    _tasks.add(task.trim());
    notifyListeners();
  }

  void removeTask(int index) {
    if (index < 0 || index >= _tasks.length) return;
    _tasks.removeAt(index);
    notifyListeners();
  }
}
