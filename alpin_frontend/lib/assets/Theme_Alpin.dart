import 'package:flutter/material.dart';

/*const Color primary = Color.fromRGBO(70, 48, 48, 1.0);
const Color background = Color.fromRGBO(239, 149, 68, 0.7);
const Color secondary = Color.fromRGBO(252, 239, 201, 1);
const Color third = Color.fromRGBO(219, 190, 150, 1.0);
const Color fourth = Color.fromRGBO(87, 74, 61, 1);
const Color fifth = Color.fromRGBO(0, 0, 0, 1);
const Color error = Color.fromRGBO(250, 0, 0, 1);*/

// const Color iconCheckedColor = Colors.grey;

/// basic [colorScheme] for entire application
/*final colorSchema = ColorScheme.fromSeed(
    seedColor: background,
    brightness: Brightness.light,
    primary: primary,
    background: fourth,
    error: error,
    secondary: third);*/

/// add all schema's for [light] and [dark] themes for the application
/*class ThemeAlpin {
  static ThemeData light() {
    final base = ThemeData.light();
    return base.copyWith(
      brightness: Brightness.light,
      primaryColor: primary,
      secondaryHeaderColor: secondary,
      scaffoldBackgroundColor: third,
      colorScheme: colorSchema,
      appBarTheme: const AppBarTheme(
          backgroundColor: third, foregroundColor: primary, elevation: 0),
      inputDecorationTheme: const InputDecorationTheme(
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: secondary)),
      ),
      buttonTheme: const ButtonThemeData(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25))),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
            disabledBackgroundColor: third,
            backgroundColor: fourth,
            foregroundColor: secondary),
      ),
      checkboxTheme:
          CheckboxThemeData(fillColor: MaterialStateProperty.all(primary)),
      dialogTheme: DialogTheme(

      )
    );
  }
}*/
const _primaryColor = Color.fromRGBO(255, 77, 42, 1);
const _secondColor = Color.fromRGBO(255, 132, 31, 1);
const _accentColor = Color.fromRGBO(62, 109, 156, 1);
const _secondAccentColor = Color.fromRGBO(0, 18, 83, 1);
const _error = Color.fromRGBO(250, 0, 0, 1);

CardTheme get cards => const CardTheme(
      margin: EdgeInsets.all(10),
      elevation: 5,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
    );

TextTheme get texts => const TextTheme(
  displaySmall: TextStyle(fontSize: 16),
  displayMedium: TextStyle(fontSize: 18),
  displayLarge: TextStyle(fontSize: 20),

  
);

const _brightColorSchema = ColorScheme.highContrastLight(primary: _secondColor,secondary: _primaryColor, primaryContainer: _accentColor, secondaryContainer: _secondAccentColor);
const _darkColorSchema = ColorScheme.dark(primary: _secondColor,secondary: _primaryColor, primaryContainer: _accentColor, secondaryContainer: _secondAccentColor);
ThemeData get themeLight =>
    ThemeData(
        primaryColor: _primaryColor,
        colorScheme: _brightColorSchema,
        textTheme: texts,
        cardTheme: cards);

ThemeData get themeDark =>
    ThemeData(colorScheme: _darkColorSchema,
        textTheme: texts,
        cardTheme: cards);
