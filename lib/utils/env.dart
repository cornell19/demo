import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'errors.dart';

class Env {
  factory Env() {
    return _singleton;
  }

  Env._internal();

  static final Env _singleton = Env._internal();

  late String _baseUrl;
  String get baseUrl => _baseUrl;

  Future<void> initEnv() async {
    const String env = String.fromEnvironment('ENV', defaultValue: 'dev');

    try {
      await dotenv.load(fileName: 'env/.env.$env');
      debugPrint('Loaded env/.env.$env');
    } catch (ex) {
      throw EnvironmentError(
          message: 'Can not load env from env/.env.$env', exception: ex);
    }

    if (dotenv.env['host'] == null) {
      throw EnvironmentError(message: 'Missing host variable');
    }

    _baseUrl = dotenv.env['host']!.toLowerCase();

    debugPrint(baseUrl);
  }
}
