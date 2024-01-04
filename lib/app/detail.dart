import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_application/models/taskModel.widget.dart';
import 'package:test_application/widgets/AppBar/customAppBar.widget.dart';
import 'package:test_application/widgets/Button/menuButton.widget.dart';
import 'package:test_application/widgets/Task/taskDetail.widget.dart';

class Detail extends StatelessWidget {
  const Detail({super.key});

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskModel>(context);
    final task = taskProvider.findByid(taskProvider.id);

    if (task != null) {
      return Scaffold(
        appBar: const CustomAppBarWidget(
          title: "",
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: MenuButton(),
            )
          ],
        ),
        body: const TaskListDetail(),
        floatingActionButton: task.status == Status.incomplete
            ? FloatingActionButton(
                onPressed: () {
                  taskProvider.editTask(task.id, task.name, Status.completion);
                  Navigator.of(context).pop();
                },
                child: Text.rich(TextSpan(text: Status.completion.displayName)))
            : FloatingActionButton(
                onPressed: () {
                  taskProvider.editTask(task.id, task.name, Status.incomplete);
                },
                child:
                    Text.rich(TextSpan(text: Status.incomplete.displayName))),
      );
    }
    return const SizedBox();
  }
}
