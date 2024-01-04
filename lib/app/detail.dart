import 'package:flutter/material.dart';
import 'package:test_application/widgets/AppBar/customAppBar.widget.dart';
import 'package:test_application/widgets/Task/taskDetail.widget.dart';

class Detail extends StatelessWidget {
  const Detail({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: CustomAppBarWidget(title: ""), body: TaskListDetail());
  }
}
