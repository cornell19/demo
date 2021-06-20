import 'package:demo/services/analytics_service.dart';
import 'package:demo/services/service_container.dart';
import 'package:flutter/foundation.dart';

class CrashAnalytics {
  AnalyticsService get _service => ServiceContainer().analyticsService;

  void recordFlutterError(FlutterErrorDetails flutterErrorDetails) {
    _service.logEvent('crashError');
  }

  Future<void> recordError(dynamic exception, StackTrace stack) async {
    await Future<dynamic>.delayed(const Duration(seconds: 0));
  }
}
