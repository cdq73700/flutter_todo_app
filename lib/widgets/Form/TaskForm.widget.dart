import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_todo_app/models/swagger/v1/model/response_task_schema.dart';
import 'package:flutter_todo_app/models/taskModel.widget.dart';
import 'package:flutter_todo_app/widgets/Button/saveButton.widget.dart';
import 'package:flutter_todo_app/widgets/InputField/taskTextField.widget.dart';

class TaskAddForm extends StatefulWidget {
  const TaskAddForm({super.key});

  @override
  State<TaskAddForm> createState() => _TaskAddForm();
}

class _TaskAddForm extends State<TaskAddForm> {
  final TextEditingController controller = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    final NavigatorState navigator = Navigator.of(context);
    return Form(
        child: Row(children: [
      Flexible(
          child: TaskTextField(
              controller: controller,
              onFieldSubmitted: () async =>
                  await handleClick(controller, navigator))),
      SaveIconButton(
          handleClick: () async => await handleClick(controller, navigator))
    ]));
  }

  Future<void> handleClick(
      TextEditingController controller, NavigatorState navigator) async {
    final Object response = await postTask(controller.text);
    if (response is ResponseTaskSchema) {
      if (response.success) {
        navigator.pop();
      }
    }
  }

  Future<Object> postTask(String name) async {
    final taskProvider = Provider.of<TaskModel>(context, listen: false);
    final Object tasks = await taskProvider.postTask(name);

    return tasks;
  }
}
