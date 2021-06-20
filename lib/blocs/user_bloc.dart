import 'package:demo/analytics/analytics_container.dart';
import 'package:demo/analytics/user_analytics.dart';
import 'package:demo/blocs/bloc_base.dart';
import 'package:demo/models/user.dart';
import 'package:demo/repositories/repository_container.dart';
import 'package:demo/repositories/user_repository.dart';
import 'package:demo/routeNames.dart';
import 'package:demo/services/navigation_service.dart';
import 'package:demo/services/service_container.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class UserBloc extends BlocBase {
  final ValueNotifier<int> _userCount = ValueNotifier<int>(0);
  final BehaviorSubject<List<User>> _users = BehaviorSubject<List<User>>();

  UserRepository get _repository => RepositoryContainer().userRepository;
  NavigationService get _navigation => ServiceContainer().navigationService;
  UserAnalytics get _analytics => AnalyticsContainer().user;

  ValueNotifier<int> get userCount => _userCount;
  Stream<List<User>> get users => _users.stream;

  Future<void> navigateToUsers() async {
    try {
      _analytics.get();

      final List<User> list = await _repository.getUsers();

      _users.sink.add(list);
      _analytics.retrieved(list);

      _userCount.value = list.length;

      await _navigation.navigateTo(RouteNames.Users);

      _analytics.usersScreen();
    } catch (e) {
      _users.sink.addError(e);
      _analytics.error(e);
    }
  }

  @override
  void dispose() {
    _userCount.dispose();
    _users.close();
  }
}
