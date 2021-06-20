import 'package:demo/analytics/crash_analytics.dart';
import 'package:demo/analytics/navigation_analytics.dart';
import 'package:get_it/get_it.dart';

import 'crash_analytics.dart';
import 'user_analytics.dart';

final GetIt getIt = GetIt.instance;

class AnalyticsContainer {
  factory AnalyticsContainer() {
    return _singleton;
  }

  AnalyticsContainer._internal();

  static final AnalyticsContainer _singleton = AnalyticsContainer._internal();

  UserAnalytics get user => getIt<UserAnalytics>();
  CrashAnalytics get crash => getIt<CrashAnalytics>();
  NavigationAnalytics get navigation => getIt<NavigationAnalytics>();

  static void registerAnalytics() {
    getIt.registerSingleton<CrashAnalytics>(CrashAnalytics());
    getIt.registerSingleton<NavigationAnalytics>(NavigationAnalytics());
    getIt.registerLazySingleton<UserAnalytics>(() => UserAnalytics());
  }
}
