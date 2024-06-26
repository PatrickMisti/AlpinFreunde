
import 'package:alpin_frontend/components/base_widget.dart';
import 'package:alpin_frontend/components/home_screen/home_screen_view.dart';
import 'package:alpin_frontend/components/newsfeed/newsfeed_view.dart';
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

  static List<MapEntry<IconData,BaseWidget>> get pageConfig => [
    const MapEntry(Icons.home, HomeScreenView()),
    const MapEntry(Icons.newspaper, NewsfeedView()),
    const MapEntry(Icons.tour, SuggestionView()),
    const MapEntry(Icons.celebration, SpendBeerView()),
    const MapEntry(Icons.settings, SettingsView())
  ];
}
