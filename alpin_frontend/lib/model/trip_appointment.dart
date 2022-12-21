import 'package:alpin_frontend/model/user.dart';

import 'category.dart';

class TripAppointment {
  final int id;
  final String title;
  final Category category;
  final DateTime date;
  final String location;
  final num phone;
  final String source;
  final String junk;
  final double hightDifference;
  final String gps;
  final String description;
  final double distance;
  final String warningDescription;
  final double accessiblePlace;
  final bool isAccessiblePlace;
  final bool isTicketNeeded;
  final List<User>? users;

  TripAppointment(
      this.id,
      this.title,
      this.category,
      this.date,
      this.location,
      this.phone,
      this.source,
      this.junk,
      this.hightDifference,
      this.gps,
      this.description,
      this.distance,
      this.warningDescription,
      this.accessiblePlace,
      this.isAccessiblePlace,
      this.isTicketNeeded,
      {this.users});
}
