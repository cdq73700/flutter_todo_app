import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_application/models/swagger/v1/model/task_schema.dart';

class TaskListTile extends StatelessWidget {
  const TaskListTile({super.key, required this.task});

  final TaskSchema task;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(
              left: BorderSide(width: 1.0, color: Colors.grey),
              right: BorderSide(width: 1.0, color: Colors.grey),
              bottom: BorderSide(width: 1.0, color: Colors.grey))),
      child: ListTile(
        title: Text(task.name),
        onTap: () {
          final id = task.id;
          if (id != null) {
            context.pushNamed('Detail', pathParameters: {'id': id});
          }
        },
      ),
    );
  }
}
