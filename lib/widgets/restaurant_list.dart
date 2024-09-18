import 'package:flutter/material.dart' as fm;
import 'package:restaurantour/models/restaurant_record.dart' as rr;

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
  @override
  fm.Widget build(fm.BuildContext context) {
    return fm.Scaffold(
      appBar: fm.AppBar(
        title: const fm.Text('RestauranTour'),
        actions: [
          fm.IconButton(
            onPressed: () {},
            icon: const fm.Icon(fm.Icons.arrow_back),
          ),
          fm.IconButton(
            onPressed: () {},
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
