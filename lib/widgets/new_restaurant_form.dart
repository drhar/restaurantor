import 'package:flutter/material.dart' as fm;
import 'package:country_picker/country_picker.dart' as cp;
import 'package:restaurantour/models/restaurant_record.dart' as rr;
import 'package:intl/intl.dart' as intl;

final dateFormatter = intl.DateFormat('dd/MM/yyyy');

// Define a custom Form widget.
class NewRestaurantForm extends fm.StatefulWidget {
  const NewRestaurantForm(
    this.onSubmitForm, {
    super.key,
  });

  final void Function(rr.RestaurantRecord) onSubmitForm;

  @override
  fm.State<NewRestaurantForm> createState() => _NewRestaurantFormState();
}

class _NewRestaurantFormState extends fm.State<NewRestaurantForm> {
  final _formKey = fm.GlobalKey<fm.FormState>();
  final _restaurantNameController = fm.TextEditingController();
  static const double _iconButtonWidth = 100;
  cp.Country? _selectedCountry;
  DateTime? _selectedDate;

  void _presentCountryPicker() {
    cp.showCountryPicker(
      context: context,
      showPhoneCode: false,
      showSearch: true,
      showWorldWide: true,
      onSelect: (country) {
        setState(() {
          _selectedCountry = country;
        });
      },
    );
  }

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

  @override
  fm.Widget build(fm.BuildContext context) {
    return fm.Form(
      key: _formKey,
      child: fm.Column(
        children: [
          fm.TextFormField(
            controller: _restaurantNameController,
            decoration: const fm.InputDecoration(labelText: 'Restaurant Name'),
          ),
          const fm.SizedBox(height: 10),
          fm.Row(
            mainAxisSize: fm.MainAxisSize.max,
            mainAxisAlignment: fm.MainAxisAlignment.center,
            crossAxisAlignment: fm.CrossAxisAlignment.start,
            children: [
              fm.SizedBox(
                width: _iconButtonWidth,
                child: fm.Column(
                  mainAxisAlignment: fm.MainAxisAlignment.start,
                  children: [
                    fm.IconButton(
                      onPressed: _presentCountryPicker,
                      icon: _selectedCountry == null
                          ? const fm.Icon(fm.Icons.flag)
                          : const fm.Icon(fm.Icons.flag_outlined),
                    ),
                    if (_selectedCountry != null)
                      fm.Text(_selectedCountry!.name),
                  ],
                ),
              ),
              fm.SizedBox(
                width: _iconButtonWidth,
                child: fm.Column(
                  mainAxisAlignment: fm.MainAxisAlignment.start,
                  children: [
                    fm.IconButton(
                      onPressed: _presentDatePicker,
                      icon: _selectedDate == null
                          ? const fm.Icon(fm.Icons.calendar_month)
                          : const fm.Icon(fm.Icons.calendar_month_outlined),
                    ),
                    if (_selectedDate != null)
                      fm.Text(dateFormatter.format(_selectedDate!)),
                  ],
                ),
              ),
              fm.SizedBox(
                width: _iconButtonWidth,
                child: fm.IconButton(
                  onPressed: () {},
                  icon: const fm.Icon(fm.Icons.pin_drop_rounded),
                ),
              ),
            ],
          ),
          // Select google maps URL
          // Who organized
          // Who attended
          // Cancel button and Save button
        ],
      ),
    );
  }
}
