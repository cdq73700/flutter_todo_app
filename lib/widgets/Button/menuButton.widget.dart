import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_application/models/taskModel.widget.dart';

class MenuButton extends StatefulWidget {
  const MenuButton({super.key, required this.id});

  final String? id;

  @override
  State<MenuButton> createState() => _MenuButton();
}

class _MenuButton extends State<MenuButton> {
  @override
  Widget build(BuildContext context) {
    final String? id = widget.id;
    final NavigatorState navigator = Navigator.of(context);

    return PopupMenuButton(
      itemBuilder: (BuildContext context) => [
        PopupMenuItem(
          onTap: () async => await onTap(id, navigator),
          child: const Text.rich(
            TextSpan(text: "delete", style: TextStyle(fontSize: 18)),
          ),
        )
      ],
    );
  }

  Future<void> onTap(String? id, NavigatorState navigator) async {
    if (id != null) {
      final response = await deleteTask(id);
      if (response is bool) {
        if (response) {
          navigator.pop();
        }
      }
    }
  }

  Future<Object> deleteTask(String id) async {
    final taskProvider = Provider.of<TaskModel>(context, listen: false);
    final Object tasks = await taskProvider.deleteTask(id);

    return tasks;
  }
}
