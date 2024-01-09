import 'package:flutter/material.dart';
import 'package:flutter_todo_app/models/swagger/v1/model/task_schema.dart';
import 'package:flutter_todo_app/models/taskModel.widget.dart';
import 'package:flutter_todo_app/widgets/InputField/taskTextField.widget.dart';

class TaskListDetail extends StatelessWidget {
  const TaskListDetail(
      {super.key, required this.task, required this.controller});

  final TaskSchema task;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Form(
            key: formKey,
            child: TaskDetailTextField(task: task, controller: controller),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Text.rich(TextSpan(
                  text: "ステータス： ${Status.values[task.status].displayName}")))
        ],
      ),
    );
  }
}
