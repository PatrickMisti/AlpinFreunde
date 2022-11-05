import 'package:alpin_frontend/components/home_screen/home_screen_view.dart';
import 'package:alpin_frontend/components/settings/settings_view.dart';
import 'package:alpin_frontend/components/spendBeer/spend_beer_view.dart';
import 'package:alpin_frontend/components/suggestion/suggestion_view.dart';
import 'package:alpin_frontend/routing.dart';
import 'package:alpin_frontend/services/language-provider/translation-service.dart';
import 'package:flutter/material.dart';

class Config {
  static List<Map<String, String>> drawerConfig(BuildContext context) => [
        {
          'title': translation(context).appointments,
          'route': RouterGenerator.overviewView
        },
        {
          'title': translation(context).tourSuggestion,
          'route': RouterGenerator.suggestionView
        },
        {
          'title': translation(context).spendBeer,
          'route': RouterGenerator.spendBeerView
        },
        {
          'title': translation(context).settings,
          'route': RouterGenerator.settingsView
        },
        {'title': 'Login', 'route': RouterGenerator.loginView},
      ];

  static List<MapEntry<IconData, String>> get bottomNaviConfig => [
    MapEntry(Icons.home, ''),
    MapEntry(Icons.tour, RouterGenerator.suggestionView),
    MapEntry(Icons.add, ''),
    MapEntry(Icons.add_card, RouterGenerator.spendBeerView),
    MapEntry(Icons.settings, RouterGenerator.settingsView),
  ];

  static List<Widget> get overlayScreens => [
    HomeScreenView(),
    SuggestionView(),
    Container(),
    SpendBeerView(),
    SettingsView()
  ];
}
