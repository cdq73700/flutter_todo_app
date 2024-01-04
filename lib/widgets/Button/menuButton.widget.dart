import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_application/models/taskModel.widget.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskModel>(context);
    final task = taskProvider.findByid(taskProvider.id);

    if (task != null) {
      handleDeleteClick() {
        taskProvider.removeTask(task.id);
        Navigator.of(context).pop();
      }

      return PopupMenuButton(
          itemBuilder: (BuildContext context) => [
                PopupMenuItem(
                  onTap: handleDeleteClick,
                  child: const Text.rich(
                      TextSpan(text: "delete", style: TextStyle(fontSize: 18))),
                )
              ]);
    }
    return const SizedBox();
  }
}
