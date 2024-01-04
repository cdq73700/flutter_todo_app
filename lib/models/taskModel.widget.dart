import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class TaskType {
  const TaskType({required this.id, required this.name, required this.status});
  final String id;
  final String name;
  final Status status;
}

enum Status {
  incomplete("未完了"),
  completion("完了");

  const Status(this.displayName);

  final String displayName;
}

class TaskModel extends ChangeNotifier {
  List<TaskType> taskList = [];
  String id = "";

  void addTask(String name) {
    Uuid uuid = const Uuid();
    String id = uuid.v1();
    taskList.add(TaskType(id: id, name: name, status: Status.incomplete));
    notifyListeners();
  }

  void removeTask(String id) {
    TaskType? task = findByid(id);
    if (task != null) {
      taskList.remove(task);
      changeTaskName("");
      notifyListeners();
    }
  }

  void editTask(String id, String name, Status status) {
    int? index = findByidTheIndex(id);
    if (index != null) {
      taskList[index] = TaskType(id: id, name: name, status: status);
      notifyListeners();
    }
  }

  TaskType? findByid(String id) {
    Iterable<TaskType> result = taskList.where((element) => element.id == id);
    return result.isNotEmpty ? result.first : null;
  }

  List<TaskType> findByStatus(Status status) {
    Iterable<TaskType> result =
        taskList.where((element) => element.status == status);
    return result.isNotEmpty ? result.toList() : [];
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
