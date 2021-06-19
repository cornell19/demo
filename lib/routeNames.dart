import 'package:flutter/foundation.dart';

enum RouteNames { Home, Users }

extension RouteNamesExtension on RouteNames {
  String get name {
    return describeEnum(this);
  }
}
