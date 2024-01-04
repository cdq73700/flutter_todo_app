import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_application/models/taskModel.widget.dart';

class TaskFormModel {
  TaskFormModel({required this.context, required this.formKey}) {
    provider = Provider.of<TaskModel>(context);
  }

  final BuildContext context;
  final GlobalKey<FormState> formKey;
  late TaskModel provider;
  final controller = TextEditingController();
  final focusNode = FocusNode();
  String? validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some todo name';
    }
    return null;
  }

  void onSaved() {
    if (formKey.currentState!.validate()) {
      provider.addTask(controller.text);
      Navigator.of(context).pop();
    } else {
      focusNode.requestFocus();
    }
  }

  void onChangeSaved(String id, String value, Status status) {
    if (formKey.currentState!.validate()) {
      provider.editTask(id, value, status);
    }
  }
}
