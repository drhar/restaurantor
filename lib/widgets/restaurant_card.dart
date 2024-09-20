import 'package:flutter/material.dart' as fm;
import 'package:restaurantour/models/restaurant_record.dart' as rr;
import 'package:restaurantour/widgets/restaurant_card_contents.dart' as rcc;

class RestaurantCard extends fm.StatelessWidget {
  RestaurantCard({
    required this.restaurantRecord,
    required this.onEdit,
    required this.onDelete,
    super.key,
  });

  static const double padding = 10;
  final rr.RestaurantRecord restaurantRecord;
  final void Function(rr.RestaurantRecord?) onEdit;
  final void Function(rr.RestaurantRecord) onDelete;

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
            fm.Column(
              children: [
                fm.IconButton(
                  onPressed: () {
                    onEdit(restaurantRecord);
                  },
                  icon: const fm.Icon(fm.Icons.edit),
                ),
                fm.IconButton(
                  onPressed: () {
                    onDelete(restaurantRecord);
                  },
                  icon: const fm.Icon(fm.Icons.delete),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
