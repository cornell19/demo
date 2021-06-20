import 'package:demo/routeNames.dart';
import 'package:flutter/material.dart';

class NavigationService {
  static final GlobalKey<NavigatorState> _navigationKey =
      GlobalKey<NavigatorState>();

  static GlobalKey<NavigatorState> get navigationKey => _navigationKey;

  Future<void> navigateToReplace(
    RouteNames routeName,
  ) async {
    await _navigationKey.currentState?.pushReplacementNamed(routeName.name);
  }

  Future<void> navigateTo(RouteNames routeName) async {
    await _navigationKey.currentState?.pushNamed(routeName.name);
  }

  void pop() {
    _navigationKey.currentState?.pop();
  }
}
