import 'package:alpin_frontend/components/login/login_view.dart';
import 'package:alpin_frontend/components/login/reset/reset_view.dart';
import 'package:alpin_frontend/components/login/signin/signIn_view.dart';
import 'package:alpin_frontend/components/overview/overview_view.dart';
import 'package:alpin_frontend/components/settings/settings_view.dart';
import 'package:alpin_frontend/components/suggestion/suggestion_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/spendBeer/spend_beer_view.dart';

/// The router [args] is like the params in angular
/// The [name] is the route which component call next
class RouterGenerator {
  static TargetPlatform? platform;

  static String get loginView => '/login';

  static String get resetPasswordView => '/resetPassword';

  static String get signInView => '/signin';

  static String get overviewView => '/overview';

  static String get settingsView => '/settings';

  static String get suggestionView => '/suggestion';

  static String get spendBeerView => '/spendBeer';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    PageRoute pageRoute;

    switch (settings.name) {
      case '/login':
        pageRoute = _changeToDevice((context) => LoginView());
        break;
      case '/resetPassword':
        pageRoute = _changeToDevice((context) => const ResetPasswordView());
        break;
      case '/signin':
        pageRoute = _changeToDevice((context) => SignInView());
        break;
      case '/overview':
        pageRoute = _changeToDevice((context) => const OverviewView());
        break;
      case '/settings':
        pageRoute = _changeToDevice((context) => const SettingsView());
        break;
      case '/suggestion':
        pageRoute = _changeToDevice((context) => const SuggestionView());
        break;
      case '/spendBeer':
        pageRoute = _changeToDevice((context) => const SpendBeerView());
        break;
      default:
        pageRoute = _errorRoute();
        break;
    }
    return pageRoute;
  }

  static PageRoute _changeToDevice(WidgetBuilder page) {
    switch (platform) {
      case TargetPlatform.android:
        return MaterialPageRoute(builder: page);
      case TargetPlatform.iOS:
        return CupertinoPageRoute(builder: page);
      case TargetPlatform.fuchsia:
        // TODO: Handle this case.
        break;
      case TargetPlatform.linux:
        // TODO: Handle this case.
        break;
      case TargetPlatform.macOS:
        // TODO: Handle this case.
        break;
      case TargetPlatform.windows:
        // TODO: Handle this case.
        break;
      default:
        break;
    }
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const Scaffold(
        body: Center(
          child: Text("Page not found!"),
        ),
      ),
    );
  }

  /// if no router name is equal it should be a alternative route here
  static PageRoute _errorRoute() {
    return MaterialPageRoute(
        builder: (context) => Scaffold(
              appBar: AppBar(title: const Text("Error")),
              body: const Center(child: Text("Page not found!!")),
            ));
  }
}
