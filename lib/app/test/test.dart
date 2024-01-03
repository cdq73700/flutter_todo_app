import 'package:flutter/material.dart';
import 'package:test_application/widgets/AppBar/customAppBar.widget.dart';
import 'package:test_application/widgets/Text/home.widget.dart';

class Test extends StatelessWidget {
  const Test({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(title: title),
      body: HomeTextWidget(title: title),
    );
  }
}
