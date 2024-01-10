import 'package:flutter/material.dart';
import 'package:flutter_todo_app/services/taskService.dart';
import 'package:provider/provider.dart';
import 'package:flutter_todo_app/models/swagger/v1/model/response_task_schema.dart';
import 'package:flutter_todo_app/models/swagger/v1/model/task_schema.dart';
import 'package:flutter_todo_app/models/taskModel.widget.dart';
import 'package:flutter_todo_app/widgets/Task/taskListTile.widget.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: retrieveTaskList(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final List<MapEntry<Status, List<TaskSchema>>> list =
              listByStatus(context, snapshot.data);

          return ListView(
            children: list
                .map((element) =>
                    _TaskListView(status: element.key, list: element.value))
                .toList(),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }

  Future<List<TaskSchema>> retrieveTaskList(BuildContext context) async {
    final taskProvider = Provider.of<TaskModel>(context, listen: true);
    final Object tasks = await taskProvider.retrieveTaskList();

    if (tasks is ResponseTaskSchema) {
      return tasks.data;
    }
    return List.empty();
  }

  List<MapEntry<Status, List<TaskSchema>>> listByStatus(
      BuildContext context, List<TaskSchema>? tasks) {
    final taskService = Provider.of<TaskService>(context, listen: false);
    return taskService.listByStatus(tasks);
  }
}

class _TaskListView extends StatelessWidget {
  const _TaskListView({required this.status, required this.list});

  final Status status;
  final List<TaskSchema> list;

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
