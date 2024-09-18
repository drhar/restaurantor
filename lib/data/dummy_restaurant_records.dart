import 'package:restaurantour/models/restaurant_record.dart' as rr;

final dummyRestaurantRecords = [
  rr.RestaurantRecord(
    restaurantName: "YumYum",
    demonym: "Yumistani",
    date: DateTime.now(),
    organizer: "Alex",
    attendees: [
      "Dan",
    ],
    googleMapsUrl: "content",
  ),
  rr.RestaurantRecord(
    restaurantName: "Tasty Treats",
    demonym: "Treatlandish",
    date: DateTime.now().subtract(Duration(days: 1)),
    organizer: "Jamie",
    attendees: [
      "Chris",
    ],
    googleMapsUrl: "content",
  ),
  rr.RestaurantRecord(
    restaurantName: "Food Fiesta",
    demonym: "Fiestavillian",
    date: DateTime.now().subtract(Duration(days: 2)),
    organizer: "Morgan",
    attendees: [
      "Taylor",
    ],
    googleMapsUrl: "content",
  ),
  rr.RestaurantRecord(
    restaurantName: "Gourmet Galaxy",
    demonym: "Galaxian",
    date: DateTime.now().subtract(Duration(days: 3)),
    organizer: "Jordan",
    attendees: [
      "Casey",
    ],
    googleMapsUrl: "content",
  ),
  rr.RestaurantRecord(
    restaurantName: "Savory Spot",
    demonym: "Savoryan",
    date: DateTime.now().subtract(Duration(days: 4)),
    organizer: "Riley",
    attendees: [
      "Pat",
    ],
    googleMapsUrl: "content",
  ),
];
