import 'package:flutter/material.dart' as fm;

class RestaurantList extends fm.StatefulWidget {
  const RestaurantList({super.key});

  @override
  fm.State<RestaurantList> createState() => _RestaurantListState();
}

class _RestaurantListState extends fm.State<RestaurantList> {
  final restaurantRecords = [
    'Restaurant 1',
    'Restaurant 2',
    'Restaurant 3',
  ];

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
        itemBuilder: (ctx, index) => fm.ListTile(
          title: fm.Text('Restaurant ${restaurantRecords[index]}'),
        ),
      ),
    );
  }
}
