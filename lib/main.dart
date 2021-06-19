import 'package:demo/repositories/repository_container.dart';
import 'package:demo/services/service_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'application.dart';
import 'utils/env.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);

  await Env().initEnv();

  ServiceContainer.registerServices();
  RepositoryContainer.registerRepositories();

  runApp(Application());
}
