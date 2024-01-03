import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_application/models/taskModel.widget.dart';
import 'package:test_application/widgets/AppBar/customAppBar.widget.dart';
import 'package:test_application/widgets/Task/taskDetail.widget.dart';
import 'package:test_application/widgets/Task/taskListView.widget.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskModel>(context);

    return Scaffold(
      appBar: CustomAppBarWidget(title: title),
      body: const Row(children: [
        Flexible(flex: 1, child: TaskListView()),
        Flexible(flex: 2, child: TaskListDetail())
      ]),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            taskProvider.addTask("new task");
          },
          child: const Icon(Icons.add)),
    );
  }
}
