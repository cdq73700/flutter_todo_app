import 'package:flutter_todo_app/models/swagger/v1/model/task_schema.dart';
import 'package:flutter_todo_app/models/taskModel.widget.dart';

class TaskService {
  List<MapEntry<Status, List<TaskSchema>>> listByStatus(
      List<TaskSchema>? tasks) {
    if (tasks == null) return List.empty();

    final Iterable<MapEntry<Status, List<TaskSchema>>> list = Status.values.map(
        (Status status) => MapEntry(
            status,
            tasks
                .where((TaskSchema task) => task.status == status.index)
                .toList()));

    return list.toList();
  }
}
