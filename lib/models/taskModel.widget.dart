import 'package:flutter/material.dart';

class TaskModel extends ChangeNotifier {
  String taskName = "";

  void changeTaskName(String newName) {
    taskName = newName;
    notifyListeners();
  }
}
