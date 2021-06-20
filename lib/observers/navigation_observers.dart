import 'package:demo/analytics/analytics_container.dart';
import 'package:demo/analytics/navigation_analytics.dart';
import 'package:flutter/material.dart';

class NavigationObserver extends NavigatorObserver {
  NavigationAnalytics get _analytics => AnalyticsContainer().navigation;

  @override
  Future<void> didPop(
      Route<dynamic> route, Route<dynamic>? previousRoute) async {
    _analytics.didPop(route, previousRoute);
  }

  @override
  void didPush(Route<dynamic>? route, Route<dynamic>? previousRoute) {
    _analytics.didPush(route, previousRoute);
  }

  @override
  void didRemove(Route<dynamic>? route, Route<dynamic>? previousRoute) {
    _analytics.didRemove(route, previousRoute);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    _analytics.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }
}
