import 'dart:io';

import 'package:alpin_frontend/assets/Theme_Alpin.dart';
import 'package:alpin_frontend/components/base_model.dart';
import 'package:alpin_frontend/routing.dart';
import 'package:alpin_frontend/services/language-provider/l10n.dart';
import 'package:alpin_frontend/services/language-provider/translation-service.dart';
import 'package:alpin_frontend/services/login_service.dart';
import 'package:alpin_frontend/services/system_settings_service.dart';
import 'package:alpin_frontend/utilities/error_handling.dart';
import 'package:alpin_frontend/utilities/http_wrapper.dart';
import 'package:catcher/catcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:stacked/stacked.dart';

/// main methode should initialize all important [services]
/// call application with [runApp]
/// init errorHandling
void main() {
  HttpWrapper.httpUrl = "http://192.168.1.10:8000";
  Catcher(
    debugConfig: ErrorHandling.getDebugReport,
    releaseConfig: ErrorHandling.getReleaseReport,
    runAppFunction: () => runApp(Alpin()),
  );
}

final MOBILE = 'mobile';
final TABLET = 'tablet';
final DESKTOP = 'desktop';

/// init application and setup [theme], [local] and [route]
class Alpin extends StatelessWidget {
  Alpin({Key? key}) : super(key: key);

  //region build for operating system
  final responsiveWrapper =
      (child) => ResponsiveWrapper.builder(child, minWidth: 380, breakpoints: [
            ResponsiveBreakpoint.resize(380, name: MOBILE),
            ResponsiveBreakpoint.autoScale(600, name: MOBILE),
            ResponsiveBreakpoint.resize(800, name: DESKTOP),
            const ResponsiveBreakpoint.resize(1920, name: '4k'),
          ]);

  buildAndroidSystem(HomeWidget model) => MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: Catcher.navigatorKey,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: model.locale,
        theme: themeLight,
        darkTheme: themeDark,
        themeMode: model.theme,
        onGenerateRoute: RouterGenerator.generateRoute,
        builder: (context, child) => responsiveWrapper(child),
        initialRoute: RouterGenerator.overviewView,
      );

  buildIOSSystem(HomeWidget model) => CupertinoApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: Catcher.navigatorKey,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: model.locale,
        // theme: model.theme == ThemeMode.light ? themeLight : themeDark,
        onGenerateRoute: RouterGenerator.generateRoute,
        builder: (context, child) => responsiveWrapper(child),
        initialRoute: RouterGenerator.overviewView,
      );

  //endregion

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeWidget>.reactive(
      viewModelBuilder: () {
        HomeWidget.getEssentialServices();
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
        return HomeWidget(context);
      },
      builder: (context, model, child) {
        // review add Loading App Screen
        if (model.platform == null || model.theme == null)
          return const MaterialApp(
            home: Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );

        if (model.platform == TargetPlatform.iOS) return buildIOSSystem(model);

        return buildAndroidSystem(model);
      },
    );
  }
}

/// [ViewModel] for AlpinView
/// important [services] translationService
class HomeWidget extends BaseModel {
  final getIt = GetIt.instance;
  late TranslationService _translationService;
  late SystemSettingsService _systemSettingsService;
  late Locale locale;

  //region must have
  late TargetPlatform? platform;
  late ThemeMode? theme;

  //endregion

  HomeWidget(BuildContext context) : super(context) {
    platform = theme = null;
    _systemSettingsService = getIt.get<SystemSettingsService>();
    _translationService = getIt.get<TranslationService>();
    locale = !L10n.all.contains(Locale(Platform.localeName))
        ? const Locale('en')
        : Locale(Platform.localeName);
    _translationService.setLocale(locale);
    _systemSettingsService.setPlatform = Theme.of(context).platform;
    // _systemSettingsService.setPlatform = TargetPlatform.iOS;
    _systemSettingsService.setTheme = ThemeMode.light;
    registerService();
  }

  void registerService() {
    sink = _translationService.language.listen((value) {
      locale = value;
      notifyListeners();
    });
    sink = _systemSettingsService.platform.listen((TargetPlatform event) {
      RouterGenerator.platform = platform = event;
      notifyListeners();
    });
    sink = _systemSettingsService.theme.listen((event) {
      theme = event;
      notifyListeners();
    });
  }

  //region init services for app
  static void getEssentialServices() {
    final getI = GetIt.instance;
    getI.registerLazySingleton(() => TranslationService());
    getI.registerLazySingleton(() => LoginService()); // review dont know
    getI.registerLazySingleton(() => HttpWrapper());
    getI.registerLazySingleton(() => SystemSettingsService());
  }

  //endregion

  @override
  @mustCallSuper
  void dispose(){
    // final loginService = getIt.get<>();
    getIt.unregister<TranslationService>();
    getIt.unregister<LoginService>();
    getIt.unregister<HttpWrapper>();
    getIt.unregister<SystemSettingsService>();
    super.dispose();
  }
}
