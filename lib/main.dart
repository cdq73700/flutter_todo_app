import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_application/routes.dart';

void main() {
  runApp(const MyApp());
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
    const String title = 'Flutter Demo';
    final ThemeData themeData = ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true);

    return MaterialApp.router(
        title: title, theme: themeData, routerConfig: goRouter());
  }
}
