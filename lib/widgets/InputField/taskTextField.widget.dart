import 'package:flutter/material.dart';

class TaskTextField extends StatelessWidget {
  const TaskTextField(
      {super.key,
      required this.controller,
      required this.focusNode,
      required this.validator,
      required this.onSaved});

  final TextEditingController controller;
  final FocusNode focusNode;
  final String? Function(String?) validator;
  final VoidCallback onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autofocus: true,
      focusNode: focusNode,
      decoration: const InputDecoration(
        hintText: 'Enter todo name',
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      ),
      validator: validator,
      onFieldSubmitted: (value) {
        onSaved();
      },
    );
  }
}

class TaskDetailTextField extends StatelessWidget {
  const TaskDetailTextField(
      {super.key,
      required this.id,
      required this.value,
      required this.validator,
      required this.onSaved});

  final String id;
  final String value;
  final String? Function(String?) validator;
  final Function(String, String) onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: value,
      validator: validator,
      onChanged: (value) {
        onSaved(id, value);
      },
    );
  }
}
