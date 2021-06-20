import 'package:demo/services/analytics_service.dart';
import 'package:demo/services/service_container.dart';
import 'package:flutter/material.dart';

class NavigationAnalytics {
  AnalyticsService get _service => ServiceContainer().analyticsService;

  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _service.logScreen('didPop ${route.settings.name}');
  }

  void didPush(Route<dynamic>? route, Route<dynamic>? previousRoute) {
    _service.logScreen('didPush ${route?.settings.name}');
  }

  void didRemove(Route<dynamic>? route, Route<dynamic>? previousRoute) {
    _service.logScreen('didRemove ${route?.settings.name}');
  }

  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    _service.logScreen('didReplace ${newRoute?.settings.name}');
  }
}
