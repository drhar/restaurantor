import 'package:restaurantour/models/restaurant_record.dart' as rr;
import 'package:country_picker/country_picker.dart' show Country;

final dummyRestaurantRecords = [
  rr.RestaurantRecord(
    restaurantName: "YumYum",
    country: Country.parse("United Kingdom"),
    date: DateTime.now(),
    organizer: "Alex",
    attendees: [
      "Dan",
    ],
    googleMapsId: "ChIJgUbEo8cfqokR5lP9_Wh_DaM",
  ),
  rr.RestaurantRecord(
    restaurantName: "Tasty Treats",
    country: Country.parse("United States"),
    date: DateTime.now().subtract(Duration(days: 1)),
    organizer: "Jamie",
    attendees: [
      "Chris",
    ],
    googleMapsId: "ChIJgUbEo8cfqokR5lP9_Wh_DaM",
  ),
  rr.RestaurantRecord(
    restaurantName: "Food Fiesta",
    country: Country.parse("France"),
    date: DateTime.now().subtract(Duration(days: 2)),
    organizer: "Morgan",
    attendees: [
      "Taylor",
      "Jordan",
      "Casey",
      "Riley",
      "Pat",
      "Alex",
      "Dan",
    ],
    googleMapsId: "ChIJgUbEo8cfqokR5lP9_Wh_DaM",
  ),
  rr.RestaurantRecord(
    restaurantName: "Gourmet Galaxy",
    country: Country.parse("Denmark"),
    date: DateTime.now().subtract(Duration(days: 3)),
    organizer: "Jordan",
    attendees: [
      "Casey",
    ],
    googleMapsId: "ChIJgUbEo8cfqokR5lP9_Wh_DaM",
    postCode: "DK-1000",
  ),
  rr.RestaurantRecord(
    restaurantName: "Savory Spot",
    country: Country.parse("Germany"),
    date: DateTime.now().subtract(Duration(days: 4)),
    organizer: "Riley",
    attendees: [
      "Pat",
    ],
    googleMapsId: "ChIJgUbEo8cfqokR5lP9_Wh_DaM",
  ),
];
