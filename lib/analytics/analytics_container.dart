import 'package:get_it/get_it.dart';

import 'user_analytics.dart';

final getIt = GetIt.instance;

class AnalyticsContainer {
  static final AnalyticsContainer _singleton = AnalyticsContainer._internal();

  factory AnalyticsContainer() {
    return _singleton;
  }

  AnalyticsContainer._internal();

  UserAnalytics get userAnalytics => getIt<UserAnalytics>();

  static void registerRepositories() {
    getIt.registerLazySingleton<UserAnalytics>(() => UserAnalytics());
  }
}
