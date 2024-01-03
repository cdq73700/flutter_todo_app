import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_application/app/dashboard.dart';

class Routes {
  final GoRoute homeRoutes = GoRoute(
      path: "/",
      name: "Dashboard",
      pageBuilder: (context, state) =>
          const MaterialPage(child: Dashboard(title: "Dashboard")));

  List<GoRoute> getRoutes() {
    return [homeRoutes];
  }
}
