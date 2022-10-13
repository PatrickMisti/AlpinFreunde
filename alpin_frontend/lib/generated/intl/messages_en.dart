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
        "password": MessageLookupByLibrary.simpleMessage("Passwort"),
        "passwordForget":
            MessageLookupByLibrary.simpleMessage("Forget your password?"),
        "resetPassEnterEmail":
            MessageLookupByLibrary.simpleMessage("Enter your email"),
        "resetPassEnterNewPass": MessageLookupByLibrary.simpleMessage(
            "Enter your old and new Password"),
        "resetPassEnterTwoFactor":
            MessageLookupByLibrary.simpleMessage("Enter code from the Email"),
        "resetPassInvalid":
            MessageLookupByLibrary.simpleMessage("The \$name is invalid"),
        "resetPassword": MessageLookupByLibrary.simpleMessage("Reset Password"),
        "resetPasswordFirst": MessageLookupByLibrary.simpleMessage(
            "You lost your password? No problem! Follow the instructions step by step"),
        "signIn": MessageLookupByLibrary.simpleMessage("Sign In"),
        "signInButtonLocal":
            MessageLookupByLibrary.simpleMessage("Sign in and up the mountain"),
        "signUpIfNoAccount": MessageLookupByLibrary.simpleMessage(
            "Oh no! I don´t have any account"),
        "title": MessageLookupByLibrary.simpleMessage("AlpinFreunde"),
        "toShortPassword":
            MessageLookupByLibrary.simpleMessage("Password is to short"),
        "username": MessageLookupByLibrary.simpleMessage("Name")
      };
}
