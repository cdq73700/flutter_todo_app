import 'package:flutter/material.dart';
import 'package:test_application/widgets/AppBar/customAppBar.widget.dart';
import 'package:test_application/widgets/Button/menuButton.widget.dart';
import 'package:test_application/widgets/Task/taskDetail.widget.dart';

class Detail extends StatelessWidget {
  const Detail({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: CustomAppBarWidget(
          title: "",
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: MenuButton(),
            )
          ],
        ),
        body: TaskListDetail());
  }
}
