import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_application/models/taskModel.widget.dart';

class TaskListDetail extends StatelessWidget {
  const TaskListDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskModel>(context);
    final task = taskProvider.findByid(taskProvider.id);

    if (task != null) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text.rich(
                TextSpan(text: task.name, style: const TextStyle(fontSize: 36)))
          ],
        ),
      );
    }
    return const SizedBox();
  }
}
