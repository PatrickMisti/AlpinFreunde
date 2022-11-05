
class TripAppointment {
  final int id;
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

  TripAppointment(
      this.id,
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
      this.isTicketNeeded);
}