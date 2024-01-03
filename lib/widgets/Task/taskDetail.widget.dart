import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_application/models/taskModel.widget.dart';

class TaskListDetail extends StatelessWidget {
  const TaskListDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskModel>(context);
    final name = taskProvider.findByid(taskProvider.id).name;
    return Center(child: Text(name));
  }
}
