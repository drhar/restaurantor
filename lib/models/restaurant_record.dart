import 'package:uuid/uuid.dart' as uuid;
import 'package:country_picker/country_picker.dart' show Country;

class RestaurantRecord {
  RestaurantRecord({
    required this.restaurantName,
    required this.country,
    required this.date,
    required this.organizer,
    required this.attendees,
    required this.googleMapsId,
    this.postCode,
  }) : id = uuid.Uuid().v4();

  final String id;
  final String restaurantName;
  final Country country;
  final DateTime date;
  final String organizer;
  final List<String> attendees;
  final String googleMapsId;
  final String? postCode;

  get attendeesCount => attendees.length + 1;
}
