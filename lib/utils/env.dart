import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'errors.dart';

const _PLACE_HOLDER = '___PROJECT_ID___';
const _PROJECT_ID = 'projectId';
const _PROJECT_DOCUMENTS_URL = 'https://fir-9c4df-default-rtdb.firebaseio.com';

class Env {
  static final Env _singleton = Env._internal();

  factory Env() {
    return _singleton;
  }

  Env._internal();

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

    if (dotenv.env[_PROJECT_ID] == null) {
      throw EnvironmentError(message: 'Missing Project ID variable');
    }

    _baseUrl = _PROJECT_DOCUMENTS_URL.replaceAll(
        _PLACE_HOLDER, dotenv.env[_PROJECT_ID] as String);

    debugPrint(baseUrl);
  }
}
