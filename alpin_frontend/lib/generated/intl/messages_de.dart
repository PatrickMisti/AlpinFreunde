// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a de locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'de';

  static String m0(name) => "${name} already exists!";

  static String m1(name) => "Der ${name} is ungültig";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "alreadyExists": m0,
        "changeProfileImage":
            MessageLookupByLibrary.simpleMessage("Profilbild ändern"),
        "continueWithoutLogin":
            MessageLookupByLibrary.simpleMessage("Continue without Sign in"),
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "emailPush": MessageLookupByLibrary.simpleMessage(
            "Send e-mail push notification"),
        "firstName": MessageLookupByLibrary.simpleMessage("Firstname"),
        "incorrectEmail":
            MessageLookupByLibrary.simpleMessage("Email ist falsch"),
        "incorrectPassword":
            MessageLookupByLibrary.simpleMessage("Password is incorrect"),
        "lastName": MessageLookupByLibrary.simpleMessage("Lastname"),
        "loginLetsStart": MessageLookupByLibrary.simpleMessage("Los gehts!"),
        "loginSwipe": MessageLookupByLibrary.simpleMessage("Swipe"),
        "loginSwipeLeft":
            MessageLookupByLibrary.simpleMessage("Left to Sign in"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "passwordForget": MessageLookupByLibrary.simpleMessage(
            "Hast du dein Passwort vergessen?"),
        "push": MessageLookupByLibrary.simpleMessage("Send push notification"),
        "resetPassChangeFailed": MessageLookupByLibrary.simpleMessage(
            "Could not save Password. Error with Server"),
        "resetPassChangeNew":
            MessageLookupByLibrary.simpleMessage("new Password"),
        "resetPassChangeNewConfirmation":
            MessageLookupByLibrary.simpleMessage("new Password again"),
        "resetPassChangeOld":
            MessageLookupByLibrary.simpleMessage("old Password"),
        "resetPassEnterEmail":
            MessageLookupByLibrary.simpleMessage("Enter your email"),
        "resetPassEnterNewPass": MessageLookupByLibrary.simpleMessage(
            "Enter your old and new Password"),
        "resetPassEnterTwoFactor":
            MessageLookupByLibrary.simpleMessage("Enter code from the Email"),
        "resetPassInvalid": m1,
        "resetPassNotConfirmationCorrect": MessageLookupByLibrary.simpleMessage(
            "Die Passwörter sind unterschiedlich"),
        "resetPassword": MessageLookupByLibrary.simpleMessage("Reset Password"),
        "resetPasswordFirst": MessageLookupByLibrary.simpleMessage(
            "You lost your password? No problem! Folgen Sie die Anweisungen Schritt für Schritt"),
        "save": MessageLookupByLibrary.simpleMessage("Speichern"),
        "settings": MessageLookupByLibrary.simpleMessage("Einstellungen"),
        "settingsLanguage": MessageLookupByLibrary.simpleMessage("Sprache"),
        "settingsPreferencesLabel":
            MessageLookupByLibrary.simpleMessage("Priorität"),
        "settingsProfileEdit":
            MessageLookupByLibrary.simpleMessage("Profil ändern"),
        "settingsProfileLabel": MessageLookupByLibrary.simpleMessage("Profil"),
        "settingsThemeMode": MessageLookupByLibrary.simpleMessage("Dark Mode"),
        "signIn": MessageLookupByLibrary.simpleMessage("Anmelden"),
        "signInButtonLocal": MessageLookupByLibrary.simpleMessage(
            "Rauf auf die Berge und steig ein"),
        "signInTitle":
            MessageLookupByLibrary.simpleMessage("Create Your Account"),
        "signUpIfNoAccount": MessageLookupByLibrary.simpleMessage(
            "Oh no! Ich habe noch keinen Account"),
        "title": MessageLookupByLibrary.simpleMessage("AlpinFreunde"),
        "toShortPassword":
            MessageLookupByLibrary.simpleMessage("Password is to short"),
        "username": MessageLookupByLibrary.simpleMessage("Name")
      };
}
