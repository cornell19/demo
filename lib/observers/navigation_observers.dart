import 'package:flutter/material.dart';

final RouteObserver<PageRoute<dynamic>> routeObserver =
    RouteObserver<PageRoute<dynamic>>();

class NavigationObserver extends NavigatorObserver {
  @override
  Future<void> didPop(
      Route<dynamic> route, Route<dynamic>? previousRoute) async {
    print('didPop $route');
  }

  @override
  void didPush(Route<dynamic>? route, Route<dynamic>? previousRoute) {
    print('didPush $route');
  }

  @override
  void didRemove(Route<dynamic>? route, Route<dynamic>? previousRoute) {
    print('didRemove $route');
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    print('didReplace $newRoute');
  }
}
