import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../features/di/dependency_init.dart';
import 'routes.dart';

class CustomMainRouter {
  static final AppRouter appRouter = getIt<AppRouter>();

  static void navigate(PageRouteInfo route,
      {FutureOr<dynamic> Function(Object?)? then}) {
    appRouter.navigate(route).then(then ?? (Object? value) {});
  }

   static void pop({Object? result}) {
    Navigator.pop(getIt<AppRouter>().navigatorKey.currentContext!, result);
  }
  static void push(PageRouteInfo route,
      {FutureOr<dynamic> Function(Object?)? then}) {
    appRouter.push(route);
  }



  static void back() {
                                                                         final router = getIt<AppRouter>();

if (router.canPop()) {
  router.back(); // or router.back();
}
  }

  static void pushAndPopUntil(PageRouteInfo route) {
    appRouter.pushAndPopUntil(route,
        predicate: (Route<dynamic> route) => false);
  }
}
