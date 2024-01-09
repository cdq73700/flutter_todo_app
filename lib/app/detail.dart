import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_todo_app/models/swagger/v1/model/response_task_schema.dart';
import 'package:flutter_todo_app/models/swagger/v1/model/task_schema.dart';
import 'package:flutter_todo_app/models/taskModel.widget.dart';
import 'package:flutter_todo_app/widgets/AppBar/customAppBar.widget.dart';
import 'package:flutter_todo_app/widgets/Button/menuButton.widget.dart';
import 'package:flutter_todo_app/widgets/Task/taskDetail.widget.dart';

class Detail extends StatefulWidget {
  const Detail({super.key, this.id});

  final String? id;

  @override
  State<Detail> createState() => _Detail();
}

class _Detail extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: retrieveTaskById(context),
      builder: (context, snapshot) {
        final Widget body;
        int status = 0;
        final TaskSchema? task = snapshot.data;
        final NavigatorState navigator = Navigator.of(context);
        TextEditingController controller = TextEditingController(text: "");

        if (snapshot.connectionState == ConnectionState.done) {
          if (task != null) {
            controller = TextEditingController(text: task.name);
            body = TaskListDetail(task: task, controller: controller);
            status = task.status;
          } else {
            body = const Text("done");
          }
        } else {
          body = const SizedBox();
        }
        return Scaffold(
          appBar: CustomAppBarWidget(
            title: "",
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: MenuButton(id: widget.id),
              )
            ],
          ),
          body: body,
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              onPressed(controller, Status.values[status], navigator);
            },
            child: Text.rich(
              TextSpan(
                  text: Status.values[status] == Status.incomplete
                      ? Status.completion.displayName
                      : Status.incomplete.displayName),
            ),
          ),
        );
      },
    );
  }

  Future<void> onPressed(TextEditingController controller, Status status,
      NavigatorState navigator) async {
    final int newStatus = status == Status.incomplete
        ? Status.completion.index
        : Status.incomplete.index;
    final response = await putTask(controller.text, newStatus);
    if (response is ResponseTaskSchema) {
      if (response.success &&
          Status.values[response.data.first.status] == Status.completion) {
        navigator.pop();
      }
    }
  }

  Future<TaskSchema> retrieveTaskById(BuildContext context) async {
    final String? id = widget.id;
    if (id != null) {
      final taskProvider = Provider.of<TaskModel>(context, listen: true);
      final Object tasks = await taskProvider.retrieveTaskById(id);

      if (tasks is ResponseTaskSchema) {
        return tasks.data.first;
      }
    }
    return TaskSchema();
  }

  Future<Object?> putTask(String name, int status) async {
    final String? id = widget.id;
    if (id != null) {
      final taskProvider = Provider.of<TaskModel>(context, listen: false);
      final Object tasks = await taskProvider.putTask(id, name, status);

      if (tasks is ResponseTaskSchema) {
        return tasks;
      }
      return tasks;
    }
    return null;
  }
}
