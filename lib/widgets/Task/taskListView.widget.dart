import 'package:flutter/material.dart';
import 'package:test_application/widgets/Task/taskListTile.widget.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({super.key});

  @override
  Widget build(BuildContext context) {
    final list = List.generate(100, (index) => "neko ${index + 1}");
    return ListView.builder(itemBuilder: (BuildContext context, int index) {
      if (list.length > index) {
        return TaskListTile(title: list[index]);
      }
      return null;
    });
  }
}
