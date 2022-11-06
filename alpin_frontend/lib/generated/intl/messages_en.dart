// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static String m0(name) => "${name} already exists!";

  static String m1(name) => "The ${name} is invalid";

  static String m2(name) => "${name} is to short";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "addDescription":
            MessageLookupByLibrary.simpleMessage("Add description"),
        "addLink": MessageLookupByLibrary.simpleMessage("Add link"),
        "addNewTourSuggestion":
            MessageLookupByLibrary.simpleMessage("Add new tour suggestion"),
        "addTitle": MessageLookupByLibrary.simpleMessage("Add title"),
        "alreadyExists": m0,
        "appointments":
            MessageLookupByLibrary.simpleMessage("Upcoming appointment"),
        "beer": MessageLookupByLibrary.simpleMessage("Beer"),
        "changeProfileImage":
            MessageLookupByLibrary.simpleMessage("Edit Image"),
        "continueWithoutLogin":
            MessageLookupByLibrary.simpleMessage("Continue without Sign in"),
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "emailPush": MessageLookupByLibrary.simpleMessage(
            "Send e-mail push notification"),
        "firstName": MessageLookupByLibrary.simpleMessage("Firstname"),
        "incorrectEmail":
            MessageLookupByLibrary.simpleMessage("Email is incorrect"),
        "incorrectPassword":
            MessageLookupByLibrary.simpleMessage("Password is incorrect"),
        "lastName": MessageLookupByLibrary.simpleMessage("Lastname"),
        "link": MessageLookupByLibrary.simpleMessage("link"),
        "loginLetsStart": MessageLookupByLibrary.simpleMessage("Let`s Start!"),
        "loginSwipe": MessageLookupByLibrary.simpleMessage("Swipe"),
        "loginSwipeLeft":
            MessageLookupByLibrary.simpleMessage("Left to Sign in"),
        "password": MessageLookupByLibrary.simpleMessage("Passwort"),
        "passwordForget":
            MessageLookupByLibrary.simpleMessage("Forget your password?"),
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
        "resetPassNotConfirmationCorrect":
            MessageLookupByLibrary.simpleMessage("The passwords are different"),
        "resetPassword": MessageLookupByLibrary.simpleMessage("Reset Password"),
        "resetPasswordFirst": MessageLookupByLibrary.simpleMessage(
            "You lost your password? No problem! Follow the instructions step by step"),
        "save": MessageLookupByLibrary.simpleMessage("Save"),
        "settings": MessageLookupByLibrary.simpleMessage("Settings"),
        "settingsLanguage": MessageLookupByLibrary.simpleMessage("Language"),
        "settingsPreferencesLabel":
            MessageLookupByLibrary.simpleMessage("Preferences"),
        "settingsProfileEdit":
            MessageLookupByLibrary.simpleMessage("Edit Profile"),
        "settingsProfileLabel": MessageLookupByLibrary.simpleMessage("Profile"),
        "settingsThemeMode": MessageLookupByLibrary.simpleMessage("Dark Mode"),
        "signIn": MessageLookupByLibrary.simpleMessage("Sign In"),
        "signInButtonLocal":
            MessageLookupByLibrary.simpleMessage("Sign in and up the mountain"),
        "signInTitle":
            MessageLookupByLibrary.simpleMessage("Create Your Account"),
        "signUpIfNoAccount": MessageLookupByLibrary.simpleMessage(
            "Oh no! I don´t have any account"),
        "spendBeer": MessageLookupByLibrary.simpleMessage("Spend a beer!"),
        "spendBeerDesc": MessageLookupByLibrary.simpleMessage(
            "Do you want to do something for us?\nThen buy me a beer."),
        "text": MessageLookupByLibrary.simpleMessage("text"),
        "textTitle": MessageLookupByLibrary.simpleMessage("title"),
        "title": MessageLookupByLibrary.simpleMessage("AlpinFreunde"),
        "toShort": m2,
        "toShortPassword":
            MessageLookupByLibrary.simpleMessage("Password is to short"),
        "tourSuggestion":
            MessageLookupByLibrary.simpleMessage("Tour suggestions"),
        "username": MessageLookupByLibrary.simpleMessage("Name"),
        "venue": MessageLookupByLibrary.simpleMessage("Venue")
      };
}
