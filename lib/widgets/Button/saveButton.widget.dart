import 'package:flutter/material.dart';

class SaveIconButton extends StatelessWidget {
  const SaveIconButton({super.key, required this.handleClick});

  final VoidCallback handleClick;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        handleClick();
      },
      icon: const Icon(Icons.save),
      color: Colors.green,
      tooltip: "SAVE",
    );
  }
}
