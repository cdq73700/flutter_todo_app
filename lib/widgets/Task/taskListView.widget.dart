import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_application/models/taskModel.widget.dart';
import 'package:test_application/widgets/Task/taskListTile.widget.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({super.key});

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskModel>(context);

    return ListView.builder(itemBuilder: (BuildContext context, int index) {
      if (taskProvider.taskList.length > index) {
        return TaskListTile(task: taskProvider.taskList[index]);
      }
      return null;
    });
  }
}
