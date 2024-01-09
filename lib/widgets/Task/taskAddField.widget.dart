import 'package:flutter/material.dart';
import 'package:flutter_todo_app/widgets/Form/TaskForm.widget.dart';

class TaskAddField extends StatelessWidget {
  const TaskAddField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom + 5),
      child: const TaskAddForm(),
    );
  }
}
