import 'package:flutter/material.dart';

/// basic [colorScheme] for entire application
const _primaryColor = Color.fromRGBO(255, 77, 42, 1);
const _secondColor = Color.fromRGBO(255, 132, 31, 1);
const _accentColor = Color.fromRGBO(62, 109, 156, 1);
const _secondAccentColor = Color.fromRGBO(0, 18, 83, 1);
const _error = Color.fromRGBO(250, 0, 0, 1);

///region
IconThemeData get icons => const IconThemeData(color: Colors.white);

CardTheme get cards => const CardTheme(
      margin: EdgeInsets.all(10),
      elevation: 5,
      // color: Colors.yellow,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
    );

TextTheme get texts =>  const TextTheme(
      displaySmall: TextStyle(fontSize: 16,color: Colors.black),
      displayMedium: TextStyle(fontSize: 18,color: Colors.black),
      displayLarge: TextStyle(fontSize: 20,color: Colors.black),
    );

BottomNavigationBarThemeData get bottomNavStyle =>
    const BottomNavigationBarThemeData(
        backgroundColor: _primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: _secondColor);

const _brightColorSchema = ColorScheme.light(
    primary: _primaryColor,
    secondary: _secondColor,
    tertiary: _accentColor,
    tertiaryContainer: _secondAccentColor,
    error: _error);

/// endregion

const _darkColorSchema = ColorScheme.dark(
    primary: _primaryColor,
    secondary: _secondColor,
    // primaryContainer: _accentColor,
    // secondaryContainer: _secondAccentColor,
    tertiary: _accentColor,
    tertiaryContainer: _secondAccentColor,
    error: _error);

/// add all schema's for [themeLight] and [themeDark] themes for the application
ThemeData get themeLight => ThemeData(
    primaryColor: _primaryColor,
    colorScheme: _brightColorSchema,
    textTheme: texts,

    bottomNavigationBarTheme: bottomNavStyle,
    cardTheme: cards,
    iconTheme: icons);

ThemeData get themeDark => ThemeData(
    colorScheme: _darkColorSchema,
    textTheme: texts,
    cardTheme: cards,
    bottomNavigationBarTheme: bottomNavStyle);
