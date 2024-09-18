import 'package:uuid/uuid.dart' as uuid;

class RestaurantRecord {
  RestaurantRecord({
    required this.restaurantName,
    required this.demonym,
    required this.date,
    required this.organizer,
    required this.attendees,
    required String googleMapsUrl,
  })  : id = uuid.Uuid().v4(),
        googleMapsUrl = Uri.parse(googleMapsUrl);

  final String id;
  final String restaurantName;
  final String demonym;
  final DateTime date;
  final String organizer;
  final List<String> attendees;
  final Uri googleMapsUrl;

  get attendeesCount => attendees.length;
}
