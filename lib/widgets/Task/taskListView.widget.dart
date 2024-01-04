import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_application/models/taskModel.widget.dart';
import 'package:test_application/widgets/Task/taskListTile.widget.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TaskModel>(context);

    final tasks = Status.values
        .map((Status status) => MapEntry(status, provider.findByStatus(status)))
        .toList();

    return ListView(
        children: tasks
            .map((element) => _TaskListView(
                status: element.key, list: element.value.toList()))
            .toList());
  }
}

class _TaskListView extends StatelessWidget {
  const _TaskListView({required this.status, required this.list});

  final Status status;
  final List<TaskType> list;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Text.rich(TextSpan(text: status.displayName))),
      ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: list.length,
          itemBuilder: (_, index) => TaskListTile(task: list[index])),
    ]);
  }
}
