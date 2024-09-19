import 'package:flutter/material.dart' as fm;
import 'package:restaurantour/models/restaurant_record.dart' as rr;
import 'package:restaurantour/widgets/new_restaurant_form.dart' as rf;

class NewRestaurant extends fm.StatefulWidget {
  const NewRestaurant(
    this.onAddNew, {
    super.key,
  });

  final void Function(fm.BuildContext, rr.RestaurantRecord) onAddNew;

  @override
  fm.State<NewRestaurant> createState() => _NewRestaurantState();
}

class _NewRestaurantState extends fm.State<NewRestaurant> {
  void _submitRestaurantData(rr.RestaurantRecord newRestaurant) {
    throw UnimplementedError();
  }

  @override
  fm.Widget build(fm.BuildContext context) {
    return fm.Padding(
      padding: const fm.EdgeInsets.all(20),
      child: rf.NewRestaurantForm(
        _submitRestaurantData,
      ),
    );
  }
}
