
import 'package:alpin_frontend/model/user.dart';

class TripSuggestion {
  final String websiteLink;
  final String title;
  final String description;
  final bool publicShown;
  final DateTime time;
  final User user;

  TripSuggestion(this.websiteLink, this.title, this.description, this.publicShown, this.time, this.user);
}