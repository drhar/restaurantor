import 'package:flutter/material.dart' as fm;
import 'package:restaurantour/models/restaurant_record.dart' as rr;
import 'package:restaurantour/widgets/restaurant_card_contents.dart' as rcc;

class RestaurantCard extends fm.StatelessWidget {
  RestaurantCard({
    required this.restaurantRecord,
    super.key,
  });

  static const double padding = 10;
  final rr.RestaurantRecord restaurantRecord;

  @override
  fm.Widget build(fm.BuildContext context) {
    return fm.Card(
      margin: const fm.EdgeInsets.all(padding),
      child: fm.Padding(
        padding: const fm.EdgeInsets.all(padding),
        child: fm.Row(
          mainAxisAlignment: fm.MainAxisAlignment.spaceBetween,
          mainAxisSize: fm.MainAxisSize.max,
          children: [
            fm.Expanded(
              child: rcc.RestaurantCardContents(
                restaurantRecord: restaurantRecord,
                padding: padding,
              ),
            ),
            fm.IconButton(
              onPressed: () {},
              icon: fm.Icon(fm.Icons.edit),
            )
          ],
        ),
      ),
    );
  }
}
