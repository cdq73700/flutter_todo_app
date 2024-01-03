import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_application/app/home.dart';
import 'package:test_application/app/test/test.dart';

class Routes {
  final GoRoute homeRoutes = GoRoute(
      path: "/",
      name: "Home",
      pageBuilder: (context, state) =>
          const MaterialPage(child: Home(title: "neko")));

  final GoRoute testRoutes = GoRoute(
      path: "/test",
      name: "Test",
      pageBuilder: (context, state) =>
          const MaterialPage(child: Test(title: "tako")));

  List<GoRoute> getRoutes() {
    return [homeRoutes, testRoutes];
  }
}
