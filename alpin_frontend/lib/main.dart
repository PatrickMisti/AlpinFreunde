import 'dart:io';

import 'package:alpin_frontend/assets/Theme_Alpin.dart';
import 'package:alpin_frontend/routing.dart';
import 'package:alpin_frontend/services/language-provider/l10n.dart';
import 'package:alpin_frontend/services/language-provider/translation-service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:stacked/stacked.dart';


void main() {
  final getIt = GetIt.instance;
  getIt.registerLazySingleton(() => TranslationService());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeWidget>.reactive(
        viewModelBuilder: () => HomeWidget(),
        builder: (context, model, child) {
      return MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: model.locale,
        theme: ThemeAlpin.light(),
        darkTheme: ThemeAlpin.dark(),
        themeMode: ThemeMode.light,
        onGenerateRoute: RouterGenerator.generateRoute,
        initialRoute: "/signin",
      );
    }
    );
  }
}

class HomeWidget extends ChangeNotifier {
  final getIt = GetIt.instance;
  late TranslationService _translationService;
  late Locale locale;

  HomeWidget(){
    _translationService = getIt.get<TranslationService>();
    locale = !L10n.all.contains(Locale(Platform.localeName))
        ? const Locale('en')
        : Locale(Platform.localeName);
    registerService();
  }

  void registerService() {
    _translationService.language.listen((value) {
      locale = value;
      notifyListeners();
    });
  }
}