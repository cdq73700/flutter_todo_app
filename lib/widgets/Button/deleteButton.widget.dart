import 'package:flutter/material.dart';

class DeleteOutlinedButton extends StatelessWidget {
  const DeleteOutlinedButton(
      {super.key, required this.handlePress, required this.isDisable});

  final dynamic handlePress;
  final bool isDisable;

  @override
  Widget build(BuildContext context) {
    if (handlePress != null && !isDisable) {
      return OutlinedButton(
          style: OutlinedButton.styleFrom(
              foregroundColor: Colors.red,
              side: const BorderSide(color: Colors.red)),
          onPressed: handlePress,
          child: const Icon(
            Icons.delete,
            color: Colors.red,
          ));
    }
    return const OutlinedButton(onPressed: null, child: Icon(Icons.delete));
  }
}
