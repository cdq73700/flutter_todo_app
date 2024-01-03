import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_application/models/taskModel.widget.dart';
import 'package:test_application/widgets/Button/deleteButton.widget.dart';

class TaskListDetail extends StatelessWidget {
  const TaskListDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskModel>(context);
    final task = taskProvider.findByid(taskProvider.id);

    if (task != null) {
      handleDeleteClick() {
        taskProvider.removeTask(task.id);
      }

      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text.rich(
              TextSpan(text: task.name, style: const TextStyle(fontSize: 36))),
          DeleteOutlinedButton(
              handlePress: handleDeleteClick, isDisable: false),
        ],
      );
    }
    return const SizedBox();
  }
}
