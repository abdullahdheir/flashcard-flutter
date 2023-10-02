import 'package:flutter/material.dart';

class AppRoute {
  static GlobalKey<NavigatorState> navKey = GlobalKey();

  static toRoute(String route, {Object? args}) {
    navKey.currentState?.pushNamed(route, arguments: args);
  }

  static toRouteAndReplace(String route, {Object? args}) {
    navKey.currentState?.pushReplacementNamed(route, arguments: args);
  }

  static toRouteAndReplaceAll(String route, {Object? args}) {
    navKey.currentState
        ?.pushNamedAndRemoveUntil(route, (route) => false, arguments: args);
  }

  static back() {
    navKey.currentState?.pop();
  }
}
