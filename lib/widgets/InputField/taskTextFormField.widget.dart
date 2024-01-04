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
