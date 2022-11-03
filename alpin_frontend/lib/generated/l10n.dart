// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `AlpinFreunde`
  String get title {
    return Intl.message(
      'AlpinFreunde',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Let's Start!`
  String get loginLetsStart {
    return Intl.message(
      'Let`s Start!',
      name: 'loginLetsStart',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signIn {
    return Intl.message(
      'Sign In',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Swipe`
  String get loginSwipe {
    return Intl.message(
      'Swipe',
      name: 'loginSwipe',
      desc: '',
      args: [],
    );
  }

  /// `Left to Sign in`
  String get loginSwipeLeft {
    return Intl.message(
      'Left to Sign in',
      name: 'loginSwipeLeft',
      desc: '',
      args: [],
    );
  }

  /// `Continue without Sign in`
  String get continueWithoutLogin {
    return Intl.message(
      'Continue without Sign in',
      name: 'continueWithoutLogin',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get username {
    return Intl.message(
      'Name',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `Passwort`
  String get password {
    return Intl.message(
      'Passwort',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Email is incorrect`
  String get incorrectEmail {
    return Intl.message(
      'Email is incorrect',
      name: 'incorrectEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password is incorrect`
  String get incorrectPassword {
    return Intl.message(
      'Password is incorrect',
      name: 'incorrectPassword',
      desc: '',
      args: [],
    );
  }

  /// `Password is to short`
  String get toShortPassword {
    return Intl.message(
      'Password is to short',
      name: 'toShortPassword',
      desc: '',
      args: [],
    );
  }

  /// `Sign in and up the mountain`
  String get signInButtonLocal {
    return Intl.message(
      'Sign in and up the mountain',
      name: 'signInButtonLocal',
      desc: '',
      args: [],
    );
  }

  /// `Forget your password?`
  String get passwordForget {
    return Intl.message(
      'Forget your password?',
      name: 'passwordForget',
      desc: '',
      args: [],
    );
  }

  /// `Oh no! I don´t have any account`
  String get signUpIfNoAccount {
    return Intl.message(
      'Oh no! I don´t have any account',
      name: 'signUpIfNoAccount',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get resetPassword {
    return Intl.message(
      'Reset Password',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `You lost your password? No problem! Follow the instructions step by step`
  String get resetPasswordFirst {
    return Intl.message(
      'You lost your password? No problem! Follow the instructions step by step',
      name: 'resetPasswordFirst',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email`
  String get resetPassEnterEmail {
    return Intl.message(
      'Enter your email',
      name: 'resetPassEnterEmail',
      desc: '',
      args: [],
    );
  }

  /// `Enter code from the Email`
  String get resetPassEnterTwoFactor {
    return Intl.message(
      'Enter code from the Email',
      name: 'resetPassEnterTwoFactor',
      desc: '',
      args: [],
    );
  }

  /// `The {name} is invalid`
  String resetPassInvalid(Object name) {
    return Intl.message(
      'The $name is invalid',
      name: 'resetPassInvalid',
      desc: '',
      args: [name],
    );
  }

  /// `Enter your old and new Password`
  String get resetPassEnterNewPass {
    return Intl.message(
      'Enter your old and new Password',
      name: 'resetPassEnterNewPass',
      desc: '',
      args: [],
    );
  }

  /// `old Password`
  String get resetPassChangeOld {
    return Intl.message(
      'old Password',
      name: 'resetPassChangeOld',
      desc: '',
      args: [],
    );
  }

  /// `new Password`
  String get resetPassChangeNew {
    return Intl.message(
      'new Password',
      name: 'resetPassChangeNew',
      desc: '',
      args: [],
    );
  }

  /// `new Password again`
  String get resetPassChangeNewConfirmation {
    return Intl.message(
      'new Password again',
      name: 'resetPassChangeNewConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `The passwords are different`
  String get resetPassNotConfirmationCorrect {
    return Intl.message(
      'The passwords are different',
      name: 'resetPassNotConfirmationCorrect',
      desc: '',
      args: [],
    );
  }

  /// `Could not save Password. Error with Server`
  String get resetPassChangeFailed {
    return Intl.message(
      'Could not save Password. Error with Server',
      name: 'resetPassChangeFailed',
      desc: '',
      args: [],
    );
  }

  /// `Create Your Account`
  String get signInTitle {
    return Intl.message(
      'Create Your Account',
      name: 'signInTitle',
      desc: '',
      args: [],
    );
  }

  /// `Firstname`
  String get firstName {
    return Intl.message(
      'Firstname',
      name: 'firstName',
      desc: '',
      args: [],
    );
  }

  /// `Lastname`
  String get lastName {
    return Intl.message(
      'Lastname',
      name: 'lastName',
      desc: '',
      args: [],
    );
  }

  /// `Send e-mail push notification`
  String get emailPush {
    return Intl.message(
      'Send e-mail push notification',
      name: 'emailPush',
      desc: '',
      args: [],
    );
  }

  /// `Send push notification`
  String get push {
    return Intl.message(
      'Send push notification',
      name: 'push',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `{name} already exists!`
  String alreadyExists(Object name) {
    return Intl.message(
      '$name already exists!',
      name: 'alreadyExists',
      desc: '',
      args: [name],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Edit Image`
  String get changeProfileImage {
    return Intl.message(
      'Edit Image',
      name: 'changeProfileImage',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get settingsProfileLabel {
    return Intl.message(
      'Profile',
      name: 'settingsProfileLabel',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get settingsProfileEdit {
    return Intl.message(
      'Edit Profile',
      name: 'settingsProfileEdit',
      desc: '',
      args: [],
    );
  }

  /// `Preferences`
  String get settingsPreferencesLabel {
    return Intl.message(
      'Preferences',
      name: 'settingsPreferencesLabel',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get settingsLanguage {
    return Intl.message(
      'Language',
      name: 'settingsLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Dark Mode`
  String get settingsThemeMode {
    return Intl.message(
      'Dark Mode',
      name: 'settingsThemeMode',
      desc: '',
      args: [],
    );
  }

  /// `Tour suggestions`
  String get tourSuggestion {
    return Intl.message(
      'Tour suggestions',
      name: 'tourSuggestion',
      desc: '',
      args: [],
    );
  }

  /// `Add new tour suggestion`
  String get addNewTourSuggestion {
    return Intl.message(
      'Add new tour suggestion',
      name: 'addNewTourSuggestion',
      desc: '',
      args: [],
    );
  }

  /// `Add link`
  String get addLink {
    return Intl.message(
      'Add link',
      name: 'addLink',
      desc: '',
      args: [],
    );
  }

  /// `Add title`
  String get addTitle {
    return Intl.message(
      'Add title',
      name: 'addTitle',
      desc: '',
      args: [],
    );
  }

  /// `Add description`
  String get addDescription {
    return Intl.message(
      'Add description',
      name: 'addDescription',
      desc: '',
      args: [],
    );
  }

  /// `link`
  String get link {
    return Intl.message(
      'link',
      name: 'link',
      desc: '',
      args: [],
    );
  }

  /// `text`
  String get text {
    return Intl.message(
      'text',
      name: 'text',
      desc: '',
      args: [],
    );
  }

  /// `title`
  String get textTitle {
    return Intl.message(
      'title',
      name: 'textTitle',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'de'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
