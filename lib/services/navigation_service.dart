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

  Future<void> showLoadingPopup() async {
    showDialog<void>(
      context: _navigationKey.currentState!.context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            side: BorderSide(
              color: Colors.transparent,
              width: 0,
            ),
          ),
          child: Container(
            constraints: const BoxConstraints(
              maxWidth: 50,
              maxHeight: 50,
            ),
            child: Column(
              children: const <Widget>[
                CircularProgressIndicator(),
              ],
            ),
          ),
        );
      },
    );
  }
}
