import 'package:flutter/material.dart';
import 'package:flutter_todo_app/models/ApiConnection.dart';
import 'package:flutter_todo_app/services/taskService.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:flutter_todo_app/routes.dart';
import 'package:flutter_todo_app/models/taskModel.widget.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
        create: (context) => TaskModel(const ApiConnection())),
    Provider(create: (context) => TaskService())
  ], child: const MyApp()));
}

GoRouter goRouter() {
  final routes = Routes();
  return GoRouter(initialLocation: "/", routes: routes.getRoutes());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const String title = 'TODO Application';
    final ThemeData themeData = ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true);

    return MaterialApp.router(
        title: title, theme: themeData, routerConfig: goRouter());
  }
}
