import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class TaskType {
  const TaskType({required this.id, required this.name});
  final String id;
  final String name;
}

class TaskModel extends ChangeNotifier {
  List<TaskType> taskList = [];
  String id = "";

  void addTask(String name) {
    Uuid uuid = const Uuid();
    String id = uuid.v1();
    int length = taskList.length + 1;
    taskList.add(TaskType(id: id, name: name + length.toString()));
    notifyListeners();
  }

  TaskType findByid(String id) {
    var result = taskList.where((obj) => obj.id == id);
    return result.isNotEmpty ? result.first : const TaskType(id: "", name: "");
  }

  void changeTaskName(String newId) {
    id = newId;
    notifyListeners();
  }
}
