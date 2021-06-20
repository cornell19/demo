import 'package:demo/blocs/user_bloc.dart';
import 'package:demo/screens/screens.dart';
import 'package:demo/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'mocks/mock_blocs.dart';
import 'mocks/mock_data.dart';

void main() {
  final bloc = MockUserBlock();

  setUp(() {
    reset(bloc);
  });

  group('Users Screen', () {
    testWidgets('Loads ', (WidgetTester tester) async {
      when(() => bloc.users).thenAnswer((_) => Stream.value(users));
      await tester.pumpWidget(_buildWidget(bloc));
      await tester.pump(Duration.zero);
      expect(find.text('Smith, Frank'), findsOneWidget);
      expect(find.text('Smith, Jane'), findsOneWidget);
      expect(find.text('Smith, John'), findsOneWidget);
    });
  });
}

Widget _buildWidget(UserBloc bloc) {
  return Provider<UserBloc>(
    create: (_) => bloc,
    dispose: (_, bloc) => bloc.dispose(),
    child: MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''), // English, no country code
        const Locale('es', ''), // Spanish, no country code
      ],
      navigatorKey: NavigationService.navigationKey,
      home: UsersScreen(),
    ),
  );
}
