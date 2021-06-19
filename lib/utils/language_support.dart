import 'package:demo/services/navigation_service.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

AppLocalizations retrieveLocale() =>
    AppLocalizations.of(NavigationService.navigationKey.currentContext!);
