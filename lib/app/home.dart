import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_application/widgets/AppBar/customAppBar.widget.dart';
import 'package:test_application/widgets/Text/home.widget.dart';

class Home extends StatelessWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    const addIcon = Icon(Icons.add);
    handleClick() => context.push("/test");

    return Scaffold(
        appBar: CustomAppBarWidget(title: title),
        body: HomeTextWidget(title: title),
        floatingActionButton: FloatingActionButton(
          onPressed: handleClick,
          tooltip: 'test Page',
          child: addIcon,
        ));
  }
}
