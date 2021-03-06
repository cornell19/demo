import 'package:get_it/get_it.dart';

import 'user_repository.dart';

final GetIt getIt = GetIt.instance;

class RepositoryContainer {
  factory RepositoryContainer() {
    return _singleton;
  }

  RepositoryContainer._internal();

  static final RepositoryContainer _singleton = RepositoryContainer._internal();

  UserRepository get userRepository => getIt<UserRepository>();

  static void registerRepositories() {
    getIt.registerLazySingleton<UserRepository>(() => UserRepository());
  }
}
