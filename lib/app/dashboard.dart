import 'package:flutter/material.dart';
import 'package:test_application/widgets/AppBar/customAppBar.widget.dart';
import 'package:test_application/widgets/Task/taskAddField.widget.dart';
import 'package:test_application/widgets/Task/taskListView.widget.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(title: title),
      body: const TaskListView(),
      floatingActionButton: FloatingActionButton(
          onPressed: () => showModalBottomSheet(
              context: context,
              isScrollControlled: false,
              builder: (BuildContext context) {
                return const TaskAddField();
              }),
          child: const Icon(Icons.add)),
    );
  }
}
