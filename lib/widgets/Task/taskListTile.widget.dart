import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_application/models/taskModel.widget.dart';

class TaskListTile extends StatelessWidget {
  const TaskListTile({super.key, required this.task});

  final TaskType task;

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskModel>(context);

    return Container(
        decoration: const BoxDecoration(
            border: Border(
                left: BorderSide(width: 1.0, color: Colors.grey),
                right: BorderSide(width: 1.0, color: Colors.grey),
                bottom: BorderSide(width: 1.0, color: Colors.grey))),
        child: ListTile(
            title: Text(task.name),
            onTap: () {
              taskProvider.changeTaskName(task.id);
            }));
  }
}
