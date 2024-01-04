import 'package:flutter/material.dart';
import 'package:test_application/models/taskFormModel.widget.dart';
import 'package:test_application/widgets/Button/saveButton.widget.dart';
import 'package:test_application/widgets/InputField/taskTextFormField.widget.dart';

class TaskAddForm extends StatelessWidget {
  const TaskAddForm({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final taskFormProvider = TaskFormModel(context: context, formKey: formKey);

    return Form(
        key: formKey,
        child: Row(children: [
          Flexible(
              child: TaskTextField(
                  controller: taskFormProvider.controller,
                  focusNode: taskFormProvider.focusNode,
                  validator: taskFormProvider.validator,
                  onSaved: taskFormProvider.onSaved)),
          SaveIconButton(handleClick: taskFormProvider.onSaved),
        ]));
  }
}
