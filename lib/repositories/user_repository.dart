import 'package:demo/models/user.dart';
import 'package:demo/services/http_service.dart';
import 'package:demo/services/service_container.dart';
import 'package:demo/utils/env.dart';

class UserRepository {
  String get _url => Env().baseUrl;
  HttpService get _service => ServiceContainer().httpService;

  Future<List<User>> getUsers() async {
    final String response = await _service.getHttp('$_url/users.json');
    final List<User> users = User.fromJsonList(response);
    return users;
  }
}
