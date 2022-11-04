import 'package:alpin_frontend/components/login/login_view.dart';
import 'package:alpin_frontend/components/login/reset/reset_view.dart';
import 'package:alpin_frontend/components/login/signin/signIn_view.dart';
import 'package:alpin_frontend/components/overview/overview_view.dart';
import 'package:alpin_frontend/components/settings/settings_view.dart';
import 'package:alpin_frontend/components/suggestion/suggestion_view.dart';
import 'package:flutter/material.dart';

import 'components/spendBeer/spend_beer_view.dart';

/// The router [args] is like the params in angular
/// The [name] is the route which component call next
class RouterGenerator {
  static String get loginView => '/login';
  static String get resetPasswordView => '/resetPassword';
  static String get signInView => '/signin';
  static String get overviewView => '/overview';
  static String get settingsView => '/settings';
  static String get suggestionView => '/suggestion';
  static String get spendBeerView => '/spendBeer';


  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch(settings.name) {
      case '/login':
        return MaterialPageRoute(builder: (context) => LoginView());
      case '/resetPassword':
        return MaterialPageRoute(builder: (context) => const ResetPasswordView());
      case '/signin':
        return MaterialPageRoute(builder: (context) => SignInView());
      case '/overview':
        return MaterialPageRoute(builder: (context) =>  const OverviewView());
      case '/settings':
        return MaterialPageRoute(builder: (context) => const SettingsView());
      case '/suggestion':
        return MaterialPageRoute(builder: (context) => const SuggestionView());
      case '/spendBeer':
        return MaterialPageRoute(builder: (context) => const SpendBeerView());
      default:
        return _errorRoute();
    }
  }

  /// if no router name is equal it should be a alternative route here
  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (context) =>
        Scaffold(
          appBar: AppBar(title: const Text("Error")),
          body: const Center(child: Text("Page not found!!")),
        )
    );
  }
}