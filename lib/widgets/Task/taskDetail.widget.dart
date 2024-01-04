import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_application/models/taskFormModel.widget.dart';
import 'package:test_application/models/taskModel.widget.dart';
import 'package:test_application/widgets/InputField/taskTextField.widget.dart';

class TaskListDetail extends StatelessWidget {
  const TaskListDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final taskProvider = Provider.of<TaskModel>(context);
    final taskFormProvider = TaskFormModel(context: context, formKey: formKey);
    final task = taskProvider.findByid(taskProvider.id);

    if (task != null) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Form(
              key: formKey,
              child: TaskDetailTextField(
                task: task,
                validator: taskFormProvider.validator,
                onSaved: taskFormProvider.onChangeSaved,
              ),
            ),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Text.rich(
                    TextSpan(text: "ステータス： ${task.status.displayName}")))
          ],
        ),
      );
    }
    return const SizedBox();
  }
}
