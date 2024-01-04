import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_application/app/dashboard.dart';
import 'package:test_application/app/detail.dart';

class Routes {
  final GoRoute homeRoutes = GoRoute(
      path: "/",
      name: "Dashboard",
      pageBuilder: (context, state) =>
          const MaterialPage(child: Dashboard(title: "Dashboard")));

  final GoRoute detailRoutes = GoRoute(
      path: "/detail",
      name: "Detail",
      pageBuilder: (context, state) => const MaterialPage(child: Detail()));

  List<GoRoute> getRoutes() {
    return [homeRoutes, detailRoutes];
  }
}
