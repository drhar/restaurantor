import 'package:restaurantour/models/restaurant_record.dart' as rr;
import 'package:country_picker/country_picker.dart' show Country;

final dummyRestaurantRecords = [
  rr.RestaurantRecord(
    restaurantName: "Land of Fire",
    country: Country.parse("Azerbaijan"),
    date: DateTime.now(),
    organizer: "Alex",
    attendees: [
      "Dan",
    ],
    googleMapsId: "ChIJB0h73UcbdkgRnGcVVmXz5x4",
  ),
  rr.RestaurantRecord(
    restaurantName: "Charista",
    country: Country.parse("Bangladesh"),
    date: DateTime.now().subtract(Duration(days: 1)),
    organizer: "Jamie",
    attendees: [
      "Chris",
    ],
    googleMapsId: "ChIJ8dCGKfwddkgRtwTr9GurFL8",
  ),
  rr.RestaurantRecord(
    restaurantName: "Crystal China",
    country: Country.parse("China"),
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
    googleMapsId: "ChIJhxHeK10DdkgRH8jAxPLAjeM",
  ),
  rr.RestaurantRecord(
    restaurantName: "Negril",
    country: Country.parse("Jamaica"),
    date: DateTime.now().subtract(Duration(days: 3)),
    organizer: "Jordan",
    attendees: [
      "Casey",
    ],
    googleMapsId: "ChIJocH8lkAEdkgRYilAGNbpxUk",
    postCode: "DK-1000",
  ),
  rr.RestaurantRecord(
    restaurantName: "BAPJO",
    country: Country.parse("South Korea"),
    date: DateTime.now().subtract(Duration(days: 4)),
    organizer: "Riley",
    attendees: [
      "Pat",
    ],
    googleMapsId: "ChIJfZ842nMFdkgRBfolNpjxj3M",
  ),
  rr.RestaurantRecord(
    restaurantName: "Andy's Greek Taverna",
    country: Country.parse("Greece"),
    date: DateTime.now().subtract(Duration(days: 3)),
    organizer: "Riley",
    attendees: [
      "Pat",
    ],
    googleMapsId: "ChIJRyzDxB8bdkgRSHoXhUaj5gk",
    postCode: "NW1 0BE",
  ),
  rr.RestaurantRecord(
    restaurantName: "Uzbek Corner",
    country: Country.parse("Uzbekistan"),
    date: DateTime.now().subtract(Duration(days: 4)),
    organizer: "Riley",
    attendees: [
      "Pat",
    ],
    googleMapsId: "ChIJ2aYbjVUFdkgRkeP7FsawL90",
    postCode: "W2 4QJ",
  ),
  rr.RestaurantRecord(
    restaurantName: "Viet Food",
    country: Country.parse("Vietnam"),
    date: DateTime.now().subtract(Duration(days: 4)),
    organizer: "Riley",
    attendees: [
      "Pat",
    ],
    googleMapsId: "ChIJe6OwstMEdkgRzVxXSkiLKq4",
    postCode: "W1D 6QT",
  ),
];
