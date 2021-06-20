import 'dart:async';

import 'package:demo/analytics/analytics_container.dart';
import 'package:demo/repositories/repository_container.dart';
import 'package:demo/services/service_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'application.dart';
import 'utils/env.dart';

Future<void> main() async {
  await initApp();
  createApp();
}

Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);

  await Env().initEnv();

  AnalyticsContainer.registerAnalytics();
  ServiceContainer.registerServices();
  RepositoryContainer.registerRepositories();
}

void createApp() {
  FlutterError.onError = AnalyticsContainer().crash.recordFlutterError;

  runZonedGuarded(() {
    runApp(const Application());
  }, (dynamic e, StackTrace st) {
    AnalyticsContainer().crash.recordError(e, st);
  });
}
