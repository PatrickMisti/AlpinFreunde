
import 'package:alpin_frontend/model/user.dart';

class TripSuggestion {
  final int id;
  final String websiteLink;
  final String title;
  final String description;
  final bool publicShown;
  // final DateTime time;
  final User user;

  TripSuggestion(this.id, this.websiteLink, this.title, this.description, this.publicShown, this.user);
}