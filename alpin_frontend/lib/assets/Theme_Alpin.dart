import 'package:flutter/material.dart';

const Color primary = Colors.orange;


class ThemeAlpin {

  static ThemeData light() {
    final base = ThemeData.light();
    return base.copyWith(
        appBarTheme: const AppBarTheme(backgroundColor: primary)
    );
  }
  static ThemeData dark() {
    final base = ThemeData.dark();
    return base.copyWith(
        appBarTheme: const AppBarTheme(backgroundColor: primary)
    );
  }
}