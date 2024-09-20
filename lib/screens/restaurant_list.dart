import 'package:flutter/material.dart' as fm;
import 'package:restaurantour/models/restaurant_record.dart' as rr;
import 'package:restaurantour/widgets/new_restaurant.dart' as nr;
import 'package:restaurantour/widgets/restaurant_card.dart' as rc;

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
  void _openAddRestaurantModal(rr.RestaurantRecord? record) {
    fm.showModalBottomSheet(
      isScrollControlled: true,
      useSafeArea: true,
      context: context,
      builder: (ctx) {
        return nr.NewRestaurant(_editRestaurant, restaurantRecord: record);
      },
    );
  }

  void _editRestaurant(
    rr.RestaurantRecord newRecord,
    rr.RestaurantRecord? existingRecord,
  ) {
    setState(() {
      if (existingRecord == null) {
        widget.restaurantRecords.add(newRecord);
      } else {
        final index = widget.restaurantRecords
            .indexWhere((element) => element.id == existingRecord.id);
        widget.restaurantRecords[index] = newRecord;
      }
    });
  }

  void _deleteRestaurant(rr.RestaurantRecord record) {
    setState(() {
      final index = widget.restaurantRecords
          .indexWhere((element) => element.id == record.id);
      widget.restaurantRecords.removeAt(index);
    });
  }

  @override
  fm.Widget build(fm.BuildContext context) {
    widget.restaurantRecords
        .sort((a, b) => a.country.name.compareTo(b.country.name));
    return fm.Scaffold(
      appBar: fm.AppBar(
        actions: [
          fm.IconButton(
            onPressed: () {
              _openAddRestaurantModal(null);
            },
            icon: const fm.Icon(fm.Icons.add),
          ),
        ],
      ),
      body: fm.ListView.builder(
        itemCount: widget.restaurantRecords.length,
        itemBuilder: (ctx, index) => rc.RestaurantCard(
          restaurantRecord: widget.restaurantRecords[index],
          onEdit: _openAddRestaurantModal,
          onDelete: _deleteRestaurant,
        ),
      ),
    );
  }
}
