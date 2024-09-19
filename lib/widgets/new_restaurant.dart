import 'package:flutter/material.dart' as fm;
import 'package:restaurantour/models/restaurant_record.dart' as rr;

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
  // final _titleController = fm.TextEditingController();
  // final _amountController = fm.TextEditingController();
  DateTime? _selectedDate;

  // @override
  // void dispose() {
  //   _titleController.dispose();
  //   _amountController.dispose();
  //   super.dispose();
  // }

  void _presentDatePicker() async {
    final now = DateTime.now();
    final pickedDate = await fm.showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(now.year - 3, now.month, now.day),
      lastDate: now,
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _submitRestaurantData() {
    throw UnimplementedError();
  }

  @override
  fm.Widget build(fm.BuildContext context) {
    throw UnimplementedError();
  }
}
