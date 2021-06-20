import 'package:demo/screens/screens.dart';
import 'package:flutter/material.dart';

import 'routeNames.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  RouteNames.Home.name: (BuildContext context) => const HomeScreen(),
  RouteNames.Users.name: (BuildContext context) => const UsersScreen(),
};
