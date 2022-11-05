import 'package:alpin_frontend/model/trip_appointment.dart';
import 'package:alpin_frontend/model/trip_suggestion.dart';
import 'package:alpin_frontend/model/user.dart';

/// mock data's for testing
class MockData {
  static User get MOCK_USER => User(
      email: 'test@gmail.com',
      password: 'asdf1234',
      firstName: 'Max',
      lastName: 'Mustermann',
      userName: 'testUser',
      emailPush: true,
      push: false);

  static TripSuggestion get TRIP_SUGGESTION_1 => TripSuggestion(
      1,
      'http://test.at',
      'Mount everest',
      'Großartige, alpine Rundtour nur für erfahrene Alpinisten auf den "Wächter des Salzkammergutes", den Traunstein, mit Aufstieg am unmarkierten und unversicherten Zierlersteig in leichter Kletterei (bis II+ kurze Stellen) und Abstieg am versicherten Naturfreundesteig (A-B). Orientierungsvermögen ist erforderlich, da es keine Markierungen, sondern nur Pfadspuren oder einzelne Steinmanndl gibt.',
      true,
      DateTime.now(),
      MOCK_USER);

  static TripSuggestion get TRIP_SUGGESTION_2 => TripSuggestion(
      2,
      'http://test2.at',
      'Mount Shit',
      'Nix für mich',
      true,
      DateTime.now(),
      MOCK_USER);

  static List<TripSuggestion> get TRIP_SUGGESTIONS =>
      [TRIP_SUGGESTION_1, TRIP_SUGGESTION_2];

  static TripAppointment get TRIP_APPOINTMENT_1 => TripAppointment(
      1,
      DateTime.now(),
      "Gmunden",
      06991500845,
      'hallo world',
      'junk',
      1703.5,
      'Coordinate',
      'Dort und dort gemma hi',
      500,
      'unwetter warnung',
      200,
      true,
      false);

  static TripAppointment get TRIP_APPOINTMENT_2 => TripAppointment(
      1,
      DateTime.now(),
      "Hinterstoder",
      06991500845,
      'hallo world',
      'junk',
      1200.5,
      'Coordinate',
      'Dort und dort gemma hi',
      500,
      'unwetter warnung',
      0,
      false,
      true);

  static List<TripAppointment> get TRIPAPPOINTMENTS =>
      [MockData.TRIP_APPOINTMENT_1, MockData.TRIP_APPOINTMENT_2];
}
