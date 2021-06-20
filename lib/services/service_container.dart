import 'package:get_it/get_it.dart';

import 'analytics_service.dart';
import 'http_service.dart';
import 'navigation_service.dart';

final GetIt getIt = GetIt.instance;

class ServiceContainer {
  factory ServiceContainer() {
    return _singleton;
  }

  ServiceContainer._internal();

  static final ServiceContainer _singleton = ServiceContainer._internal();

  HttpService get httpService => getIt<HttpService>();
  NavigationService get navigationService => getIt<NavigationService>();
  AnalyticsService get analyticsService => getIt<AnalyticsService>();

  static void registerServices() {
    getIt.registerLazySingleton<HttpService>(() => HttpService());
    getIt.registerLazySingleton<NavigationService>(() => NavigationService());
    getIt.registerLazySingleton<AnalyticsService>(() => AnalyticsService());
  }
}
