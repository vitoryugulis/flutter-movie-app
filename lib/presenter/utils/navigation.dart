import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@singleton
class Navigation {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  dynamic go(String route, {dynamic arguments}) {
    return navigatorKey.currentState?.pushNamed(route, arguments: arguments);
  }

  dynamic replace(String route, {dynamic arguments}) {
    return navigatorKey.currentState
        ?.pushReplacementNamed(route, arguments: arguments);
  }

  dynamic pop() {
    return navigatorKey.currentState?.pop();
  }
}
