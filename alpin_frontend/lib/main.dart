import 'dart:io';

import 'package:alpin_frontend/assets/Theme_Alpin.dart';
import 'package:alpin_frontend/components/base_model.dart';
import 'package:alpin_frontend/routing.dart';
import 'package:alpin_frontend/services/language-provider/l10n.dart';
import 'package:alpin_frontend/services/language-provider/translation-service.dart';
import 'package:alpin_frontend/services/login_service.dart';
import 'package:alpin_frontend/utilities/error_handling.dart';
import 'package:alpin_frontend/utilities/http_wrapper.dart';
import 'package:catcher/catcher.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:stacked/stacked.dart';

/// main methode should initialize all important [services]
/// call application with [runApp]
/// init errorHandling
void main() {

  HttpWrapper.httpUrl = "http://192.168.1.75:8000";
  Catcher(
    debugConfig: ErrorHandling.getDebugReport,
    releaseConfig: ErrorHandling.getReleaseReport,
    runAppFunction: () => runApp(const Alpin()),
  );
}

final MOBILE = 'mobile';
final TABLET = 'tablet';
final DESKTOP = 'desktop';
/// init application and setup [theme], [local] and [route]
class Alpin extends StatelessWidget {

  const Alpin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeWidget>.reactive(
        viewModelBuilder: () {
          HomeWidget.getEssentialServices();
          return HomeWidget(context);
        },
        builder: (context, model, child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: Catcher.navigatorKey,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: model.locale,
        theme: themeLight,
        darkTheme: themeDark,
        themeMode: ThemeMode.light,
        onGenerateRoute: RouterGenerator.generateRoute,
        builder: (context, child) => ResponsiveWrapper.builder(
          child,
          minWidth: 380,
          breakpoints: [
            ResponsiveBreakpoint.resize(380, name: MOBILE),
            ResponsiveBreakpoint.autoScale(600, name: MOBILE),
            ResponsiveBreakpoint.resize(800, name: DESKTOP),
            const ResponsiveBreakpoint.resize(1920, name: '4k'),
          ]
        ),
        initialRoute: RouterGenerator.overviewView,
      );
    }
    );
  }
}

/// [ViewModel] for AlpinView
/// important [services] translationService
class HomeWidget extends BaseModel {
  final getIt = GetIt.instance;
  late TranslationService _translationService;
  late Locale locale;

  HomeWidget(BuildContext context) : super(context) {
    _translationService = getIt.get<TranslationService>();
    locale = !L10n.all.contains(Locale(Platform.localeName))
        ? const Locale('en')
        : Locale(Platform.localeName);
    _translationService.setLocale(locale);
    registerService();
  }

  void registerService() {
    _translationService.language.listen((value) {
      locale = value;
      notifyListeners();
    });
  }

  static void getEssentialServices() {
    final getI = GetIt.instance;
    getI.registerLazySingleton(() => TranslationService());
    getI.registerLazySingleton(() => LoginService()); // review dont know
    getI.registerLazySingleton(() => HttpWrapper());
  }

  @override
  void onDispose() {
    // final loginService = getIt.get<>();
    getIt.unregister(instance: _translationService);
    getIt.unregister<LoginService>();
    getIt.unregister<HttpWrapper>();
    super.onDispose();
  }
}