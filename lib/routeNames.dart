import 'package:flutter/foundation.dart' show describeEnum;

enum RouteNames { Home, Users }

extension RouteNamesExtension on RouteNames {
  String get name {
    return describeEnum(this);
  }
}
