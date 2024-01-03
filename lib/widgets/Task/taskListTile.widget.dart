import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_application/models/taskModel.widget.dart';

class TaskListTile extends StatelessWidget {
  const TaskListTile({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskModel>(context);

    return Container(
        decoration: const BoxDecoration(
            border: Border(
                left: BorderSide(width: 1.0, color: Colors.grey),
                right: BorderSide(width: 1.0, color: Colors.grey),
                top: BorderSide(width: 1.0, color: Colors.grey),
                bottom: BorderSide(width: 1.0, color: Colors.grey))),
        child: ListTile(
            title: Text(title),
            onTap: () {
              taskProvider.changeTaskName(title);
            }));
  }
}
