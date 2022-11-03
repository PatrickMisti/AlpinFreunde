
import 'package:alpin_frontend/model/trip_suggestion.dart';
import 'package:alpin_frontend/model/user.dart';

/// mock data's for testing
class MockData {
  static User get MOCK_USER =>
      User(email: 'test@gmail.com',
          password: 'asdf1234',
          firstName: 'Max',
          lastName: 'Mustermann',
          userName: 'testUser',
          emailPush: true,
          push: false);

  static TripSuggestion get TRIP_SUGGESTION_1 => TripSuggestion('http://test.at', 'Mount everest', 'Großartige, alpine Rundtour nur für erfahrene Alpinisten auf den "Wächter des Salzkammergutes", den Traunstein, mit Aufstieg am unmarkierten und unversicherten Zierlersteig in leichter Kletterei (bis II+ kurze Stellen) und Abstieg am versicherten Naturfreundesteig (A-B). Orientierungsvermögen ist erforderlich, da es keine Markierungen, sondern nur Pfadspuren oder einzelne Steinmanndl gibt.', true, DateTime.now(), MOCK_USER);

  static TripSuggestion get TRIP_SUGGESTION_2 => TripSuggestion('http://test2.at', 'Mount Shit', 'Nix für mich', true, DateTime.now(), MOCK_USER);

  static List<TripSuggestion> get TRIP_SUGGESTIONS => [TRIP_SUGGESTION_1, TRIP_SUGGESTION_2];
}