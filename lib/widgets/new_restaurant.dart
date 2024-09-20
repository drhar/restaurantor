import 'package:flutter/material.dart' as fm;
import 'package:restaurantour/models/restaurant_record.dart' as rr;
import 'package:restaurantour/widgets/new_restaurant_form.dart' as rf;

class NewRestaurant extends fm.StatelessWidget {
  const NewRestaurant(
    this.onSubmit, {
    super.key,
    this.restaurantRecord,
  });

  final void Function(rr.RestaurantRecord, rr.RestaurantRecord?) onSubmit;
  final rr.RestaurantRecord? restaurantRecord;

  @override
  fm.Widget build(fm.BuildContext context) {
    return fm.Padding(
      padding: const fm.EdgeInsets.all(20),
      child: rf.NewRestaurantForm(
        onSubmit,
        record: restaurantRecord,
      ),
    );
  }
}
