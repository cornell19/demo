import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'blocs/user_bloc.dart';
import 'observers/navigation_observers.dart';
import 'routeNames.dart';
import 'routes.dart';
import 'services/navigation_service.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <SingleChildWidget>[
        Provider<UserBloc>(
          create: (_) => UserBloc(),
          dispose: (_, UserBloc bloc) => bloc.dispose(),
        ),
      ],
      child: MaterialApp(
        title: 'Demo App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const <Locale>[
          Locale('en', ''),
          Locale('es', ''),
        ],
        navigatorKey: NavigationService.navigationKey,
        navigatorObservers: <NavigatorObserver>[NavigationObserver()],
        routes: routes,
        initialRoute: RouteNames.Home.name,
      ),
    );
  }
}
