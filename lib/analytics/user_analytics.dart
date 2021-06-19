import 'package:demo/models/user.dart';
import 'package:demo/services/analytics_service.dart';
import 'package:demo/services/service_container.dart';

class _UserValues {
  static const page = 'demo:users page';
  static const get = 'demo: users get';
  static const retrieved = 'demo: users retrieve';
  static const error = 'demo: users error';
}

class _UserParamValues {
  static const count = 'count';
  static const error = 'error';
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
      data: {
        _UserParamValues.error: error.toString(),
      },
    );
  }

  void retrieved(List<User> users) {
    _service.logEvent(
      _UserValues.retrieved,
      data: {
        _UserParamValues.count: users.length,
      },
    );
  }
}
