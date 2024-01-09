import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_todo_app/models/swagger/v1/model/response_task_schema.dart';
import 'package:flutter_todo_app/models/swagger/v1/model/task_schema.dart';
import 'package:flutter_todo_app/models/taskModel.widget.dart';

class TaskTextField extends StatelessWidget {
  const TaskTextField(
      {super.key, required this.controller, required this.onFieldSubmitted});

  final TextEditingController controller;
  final VoidCallback onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: true,
      controller: controller,
      decoration: const InputDecoration(
        hintText: 'Enter todo name',
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      ),
      onFieldSubmitted: (value) => onFieldSubmitted(),
    );
  }
}

class TaskDetailTextField extends StatelessWidget {
  const TaskDetailTextField(
      {super.key, required this.task, required this.controller});

  final TaskSchema task;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        onFieldSubmitted: (value) => putTask(context, task, value));
  }

  Future<Object?> putTask(
      BuildContext context, TaskSchema task, String name) async {
    final String? id = task.id;
    if (id != null) {
      final taskProvider = Provider.of<TaskModel>(context, listen: false);
      final Object tasks = await taskProvider.putTask(id, name, task.status);

      if (tasks is ResponseTaskSchema) {
        return tasks;
      }
      return tasks;
    }
    return null;
  }
}
