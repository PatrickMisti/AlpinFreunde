import 'package:flutter/material.dart';

class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch(settings.name) {
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