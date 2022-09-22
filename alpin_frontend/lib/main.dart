import 'package:alpin_frontend/assets/Theme_Alpin.dart';
import 'package:alpin_frontend/routing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: const Locale('de'),
      theme: ThemeAlpin.light(),
      darkTheme: ThemeAlpin.dark(),
      themeMode: ThemeMode.light,
      onGenerateRoute: RouterGenerator.generateRoute,
      initialRoute: "/login",
    );
  }
}
