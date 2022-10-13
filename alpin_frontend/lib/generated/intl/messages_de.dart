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

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "incorrectEmail":
            MessageLookupByLibrary.simpleMessage("Email is incorrect"),
        "incorrectPassword":
            MessageLookupByLibrary.simpleMessage("Password is incorrect"),
        "loginLetsStart": MessageLookupByLibrary.simpleMessage("Let`s Start!"),
        "loginSwipe": MessageLookupByLibrary.simpleMessage("Swipe"),
        "loginSwipeLeft":
            MessageLookupByLibrary.simpleMessage("Left to Sign in"),
        "loginSwipeRight":
            MessageLookupByLibrary.simpleMessage("Right to without Sign in"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "passwordForget": MessageLookupByLibrary.simpleMessage(
            "Hast du dein Passwort vergessen?"),
        "resetPassEnterEmail":
            MessageLookupByLibrary.simpleMessage("Enter your email"),
        "resetPassEnterNewPass": MessageLookupByLibrary.simpleMessage(
            "Enter your old and new Password"),
        "resetPassEnterTwoFactor":
            MessageLookupByLibrary.simpleMessage("Enter code from the Email"),
        "resetPassword": MessageLookupByLibrary.simpleMessage("Reset Password"),
        "resetPasswordFirst": MessageLookupByLibrary.simpleMessage(
            "You lost your password? No problem!\nFolgen Sie die Anweisungen Schritt für Schritt"),
        "signIn": MessageLookupByLibrary.simpleMessage("Anmelden"),
        "signInButtonLocal": MessageLookupByLibrary.simpleMessage(
            "Rauf auf die Berge und steig ein"),
        "signUpIfNoAccount": MessageLookupByLibrary.simpleMessage(
            "Oh no! Ich habe noch keinen Account"),
        "title": MessageLookupByLibrary.simpleMessage("AlpinFreunde"),
        "toShortPassword":
            MessageLookupByLibrary.simpleMessage("Password is to short"),
        "username": MessageLookupByLibrary.simpleMessage("Name")
      };
}
