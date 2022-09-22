import 'package:alpin_frontend/components/login/login_view.dart';
import 'package:flutter/material.dart';

class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch(settings.name) {
      case "/login":
        return MaterialPageRoute(builder: (context) => const LoginView());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (context) =>
        Scaffold(
          appBar: AppBar(title: const Text("Error")),
          body: const Center(child: Text("Page not found!!")),
        )
    );
  }
}