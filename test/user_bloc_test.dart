import 'package:demo/analytics/user_analytics.dart';
import 'package:demo/blocs/user_bloc.dart';

import 'package:demo/repositories/user_repository.dart';
import 'package:demo/routeNames.dart';
import 'package:demo/services/navigation_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import 'mocks/mock_analytics.dart';
import 'mocks/mock_data.dart';
import 'mocks/mock_repositories.dart';
import 'mocks/mock_services.dart';

void main() {
  final analytics = MockUserAnalytics();
  final repository = MockUserRepository();
  final navigation = MockNavigationService();

  GetIt.instance
    ..registerSingleton<UserAnalytics>(analytics)
    ..registerSingleton<NavigationService>(navigation)
    ..registerSingleton<UserRepository>(repository);
  UserBloc? bloc;

  setUp(() {
    reset(analytics);
    reset(repository);
    reset(navigation);
  });

  tearDown(() {
    bloc?.dispose();
  });

  group('User Bloc', () {
    test('Navigate to Users', () async {
      when(() => repository.getUsers()).thenAnswer((_) async => users);
      when(() => navigation.navigateTo(RouteNames.Users))
          .thenAnswer((_) async => () {});
      bloc = UserBloc();
      await bloc!.navigateToUsers();

      verify(() => analytics.get()).called(1);
      verify(() => repository.getUsers()).called(1);
      verify(() => analytics.retrieved(users)).called(1);
      verify(() => analytics.usersScreen()).called(1);
      verify(() => navigation.navigateTo(RouteNames.Users)).called(1);
      expect(bloc!.userCount.value, 3);
      expectLater(bloc!.users, emits(users));
    });
  });
}
