import 'package:flutter/material.dart' as fm;

import 'package:restaurantour/models/restaurant_record.dart' as rr;

class RestaurantCardContents extends fm.StatelessWidget {
  RestaurantCardContents({
    required this.restaurantRecord,
    this.padding = 10,
    super.key,
  });

  final rr.RestaurantRecord restaurantRecord;
  final double padding;

  @override
  fm.Widget build(fm.BuildContext context) {
    return fm.Row(
      mainAxisAlignment: fm.MainAxisAlignment.spaceBetween,
      mainAxisSize: fm.MainAxisSize.max,
      children: [
        fm.SizedBox(
          width: 8 * padding,
          child: fm.Column(
            children: [
              fm.Text(restaurantRecord.country.flagEmoji,
                  style: fm.Theme.of(context).textTheme.displaySmall),
              fm.Text(
                restaurantRecord.country.name,
                style: fm.Theme.of(context).textTheme.bodySmall,
                textAlign: fm.TextAlign.center,
              ),
            ],
          ),
        ),
        fm.Expanded(
          child: fm.Column(
            crossAxisAlignment: fm.CrossAxisAlignment.start,
            children: [
              fm.Text(restaurantRecord.restaurantName,
                  style: fm.Theme.of(context).textTheme.titleLarge),
              fm.Row(
                mainAxisAlignment: fm.MainAxisAlignment.spaceBetween,
                mainAxisSize: fm.MainAxisSize.max,
                children: [
                  fm.Text(restaurantRecord.formattedDate),
                  if (restaurantRecord.postCode != null)
                    fm.Text(restaurantRecord.postCode!),
                ],
              ),
              fm.Text("Organized by: ${restaurantRecord.organizer}"),
              fm.Text(
                "${restaurantRecord.attendeesCount.toString()} attendees: ${restaurantRecord.attendees.join(", ")} & ${restaurantRecord.organizer}",
                textAlign: fm.TextAlign.left,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
