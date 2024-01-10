import 'package:flutter/material.dart';
import 'package:flutter_todo_app/models/taskModel.widget.dart';

class StatusFloatingActionButton extends StatelessWidget {
  const StatusFloatingActionButton(
      {super.key, required this.status, required this.onPressed});
  final int status;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        onPressed();
      },
      child: Text.rich(
        TextSpan(
            text: Status.values[status] == Status.incomplete
                ? Status.completion.displayName
                : Status.incomplete.displayName),
      ),
    );
  }
}
