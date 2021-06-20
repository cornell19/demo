import 'package:demo/models/user.dart';
import 'package:demo/services/analytics_service.dart';
import 'package:demo/services/service_container.dart';

class _UserValues {
  static const String page = 'demo:users page';
  static const String get = 'demo: users get';
  static const String retrieved = 'demo: users retrieve';
  static const String error = 'demo: users error';
}

class _UserParamValues {
  static const String count = 'count';
  static const String error = 'error';
}

class UserAnalytics {
  AnalyticsService get _service => ServiceContainer().analyticsService;

  void usersScreen() {
    _service.logScreen(_UserValues.page);
  }

  void get() {
    _service.logEvent(_UserValues.get);
  }

  void error(dynamic error) {
    _service.logEvent(
      _UserValues.error,
      data: <String, dynamic>{
        _UserParamValues.error: error.toString(),
      },
    );
  }

  void retrieved(List<User> users) {
    _service.logEvent(
      _UserValues.retrieved,
      data: <String, dynamic>{
        _UserParamValues.count: users.length,
      },
    );
  }
}
