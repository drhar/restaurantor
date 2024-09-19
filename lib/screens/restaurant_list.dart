import 'package:flutter/material.dart' as fm;
import 'package:restaurantour/models/restaurant_record.dart' as rr;
import 'package:restaurantour/widgets/new_restaurant.dart' as nr;

class RestaurantList extends fm.StatefulWidget {
  RestaurantList(
    this.restaurantRecords, {
    super.key,
  });

  final List<rr.RestaurantRecord> restaurantRecords;

  @override
  fm.State<RestaurantList> createState() => _RestaurantListState();
}

class _RestaurantListState extends fm.State<RestaurantList> {
  void _openAddRestaurantModal() {
    fm.showModalBottomSheet(
      isScrollControlled: true,
      useSafeArea: true,
      context: context,
      builder: (ctx) {
        return nr.NewRestaurant(_addNewRestaurant);
      },
    );
  }

  void _addNewRestaurant(
    fm.BuildContext context,
    rr.RestaurantRecord newRecord,
  ) {
    setState(() {
      widget.restaurantRecords.add(newRecord);
    });
  }

  @override
  fm.Widget build(fm.BuildContext context) {
    return fm.Scaffold(
      appBar: fm.AppBar(
        actions: [
          fm.IconButton(
            onPressed: _openAddRestaurantModal,
            icon: const fm.Icon(fm.Icons.add),
          ),
        ],
      ),
      body: fm.ListView.builder(
        itemCount: widget.restaurantRecords.length,
        itemBuilder: (ctx, index) => fm.ListTile(
          title: fm.Text(widget.restaurantRecords[index].restaurantName),
        ),
      ),
    );
  }
}
