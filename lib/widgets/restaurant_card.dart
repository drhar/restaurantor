import 'package:flutter/material.dart' as fm;
import 'package:restaurantour/models/restaurant_record.dart' as rr;

class RestaurantCard extends fm.StatelessWidget {
  RestaurantCard({
    required this.restaurantRecord,
    super.key,
  });

  final rr.RestaurantRecord restaurantRecord;

  @override
  fm.Widget build(fm.BuildContext context) {
    return fm.Card(
      child: fm.Column(
        children: [
          fm.Text(restaurantRecord.restaurantName),
          fm.Row(
            mainAxisAlignment: fm.MainAxisAlignment.spaceBetween,
            children: [
              fm.Text(restaurantRecord.country.flagEmoji),
              fm.Text(restaurantRecord.country.name),
            ],
          ),
          fm.Text(restaurantRecord.date.toString()),
          fm.Text(restaurantRecord.organizer),
          fm.Text(restaurantRecord.attendees.toString()),
          if (restaurantRecord.postCode != null)
            fm.Text(restaurantRecord.postCode!),
          fm.Text(restaurantRecord.attendeesCount.toString()),
        ],
      ),
    );
  }
}
