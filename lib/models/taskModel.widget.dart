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
    taskList.add(TaskType(id: id, name: name));
    notifyListeners();
  }

  void removeTask(String id) {
    TaskType? task = findByid(id);
    if (task != null) {
      taskList.remove(task);
      changeTaskName("");
    }
  }

  void editTask(String id, String name) {
    int? index = findByidTheIndex(id);
    if (index != null) {
      taskList[index] = TaskType(id: id, name: name);
    }
  }

  TaskType? findByid(String id) {
    Iterable<TaskType> result = taskList.where((obj) => obj.id == id);
    return result.isNotEmpty ? result.first : null;
  }

  int? findByidTheIndex(String id) {
    int index = taskList.indexWhere((obj) => obj.id == id);
    return index != -1 ? index : null;
  }

  void changeTaskName(String newId) {
    id = newId;
    notifyListeners();
  }
}
