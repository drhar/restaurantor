import 'package:flutter/material.dart' as fm;
import 'package:country_picker/country_picker.dart' as cp;
import 'package:restaurantour/models/restaurant_record.dart' as rr;
import 'package:intl/intl.dart' as intl;
import 'package:google_maps_flutter/google_maps_flutter.dart' as gm;
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart'
    as pp;
import 'package:flutter_dotenv/flutter_dotenv.dart' as dotenv;

import 'dart:io' show Platform;

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
  final _organizerController = fm.TextEditingController();
  final _attendeeController = fm.TextEditingController();
  final List<String> _attendees = [];
  cp.Country? _selectedCountry;
  DateTime? _selectedDate;
  String? _selectedPlaceId;
  String? _selectedPostCode;

  bool _submitAttempted = false;
  static const double _iconButtonWidth = 100;
  static const double _columnSpacing = 10;

  @override
  void dispose() {
    _restaurantNameController.dispose();
    _organizerController.dispose();
    _attendeeController.dispose();
    super.dispose();
  }

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
            validator: (value) => value == null || value.isEmpty
                ? 'Please enter the restaurant name.'
                : null,
            decoration: const fm.InputDecoration(labelText: 'Restaurant Name'),
          ),
          const fm.SizedBox(height: _columnSpacing),
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
                      color: _selectedCountry == null && _submitAttempted
                          ? fm.Theme.of(context).colorScheme.error
                          : null,
                    ),
                    if (_selectedCountry != null)
                      fm.Text(
                        _selectedCountry!.name,
                        textAlign: fm.TextAlign.center,
                      ),
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
                      color: _selectedDate == null && _submitAttempted
                          ? fm.Theme.of(context).colorScheme.error
                          : null,
                    ),
                    if (_selectedDate != null)
                      fm.Text(dateFormatter.format(_selectedDate!)),
                  ],
                ),
              ),
              fm.SizedBox(
                width: _iconButtonWidth,
                child: fm.Column(
                  mainAxisAlignment: fm.MainAxisAlignment.start,
                  children: [
                    fm.IconButton(
                      onPressed: () {
                        fm.Navigator.push(
                          context,
                          fm.MaterialPageRoute(
                            builder: (context) => pp.PlacePicker(
                              enableMapTypeButton: false,
                              enableMyLocationButton: false,
                              apiKey: Platform.isAndroid
                                  ? dotenv.dotenv.env['MAPS_ANDROID_API_KEY']!
                                  : dotenv.dotenv.env['MAPS_IOS_API_KEY']!,
                              onPlacePicked: (result) {
                                setState(() {
                                  _selectedPlaceId = result.placeId;
                                  for (final addr
                                      in result.addressComponents!) {
                                    if (addr.types.contains('postal_code')) {
                                      _selectedPostCode = addr.longName;
                                      break;
                                    }
                                  }
                                });
                                fm.Navigator.of(context).pop();
                              },
                              initialPosition: const gm.LatLng(51.5081, 0.1248),
                              resizeToAvoidBottomInset:
                                  false, // only works in page mode, less flickery, remove if wrong offsets
                            ),
                          ),
                        );
                      },
                      icon: _selectedPlaceId == null
                          ? const fm.Icon(fm.Icons.pin_drop)
                          : const fm.Icon(fm.Icons.pin_drop_outlined),
                      color: _selectedPlaceId == null && _submitAttempted
                          ? fm.Theme.of(context).colorScheme.error
                          : null,
                    ),
                    if (_selectedPostCode != null) fm.Text(_selectedPostCode!),
                  ],
                ),
              ),
            ],
          ),
          const fm.SizedBox(height: _columnSpacing),
          fm.TextFormField(
            controller: _organizerController,
            validator: (value) => value == null || value.isEmpty
                ? 'Please enter the organizer\'s name.'
                : null,
            decoration: const fm.InputDecoration(labelText: 'Organizer'),
          ),
          const fm.SizedBox(height: _columnSpacing),
          fm.Container(
            height: 10 * _columnSpacing,
            child: fm.SingleChildScrollView(
              keyboardDismissBehavior:
                  fm.ScrollViewKeyboardDismissBehavior.onDrag,
              child: fm.Column(
                children: [
                  for (final attendee in _attendees)
                    fm.Row(
                      mainAxisAlignment: fm.MainAxisAlignment.spaceBetween,
                      children: [
                        fm.Text(attendee),
                        fm.IconButton(
                          onPressed: () {
                            setState(() {
                              _attendees.remove(attendee);
                            });
                          },
                          icon: const fm.Icon(fm.Icons.delete),
                          color: attendee.isEmpty && _submitAttempted
                              ? fm.Theme.of(context).colorScheme.error
                              : null,
                        ),
                      ],
                    ),
                  fm.TextFormField(
                    controller: _attendeeController,
                    validator: (value) =>
                        (value == null || value.isEmpty) && _attendees.isEmpty
                            ? 'Please enter a name.'
                            : null,
                    onEditingComplete: () {
                      setState(() {
                        _attendees.add(_attendeeController.text);
                        _attendeeController.clear();
                      });
                    },
                    decoration: const fm.InputDecoration(
                      labelText: 'Add Attendee',
                      suffixIcon: fm.Icon(fm.Icons.person_add),
                    ),
                  )
                ],
              ),
            ),
          ),
          const fm.SizedBox(height: 2 * _columnSpacing),
          fm.Row(
            mainAxisAlignment: fm.MainAxisAlignment.spaceBetween,
            children: [
              fm.OutlinedButton(
                onPressed: () {
                  fm.Navigator.of(context).pop();
                },
                child: const fm.Text('Cancel'),
              ),
              fm.OutlinedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate() &&
                      _selectedCountry != null &&
                      _selectedDate != null &&
                      _selectedPlaceId != null) {
                    final newRestaurant = rr.RestaurantRecord(
                      restaurantName: _restaurantNameController.text,
                      country: _selectedCountry!,
                      date: _selectedDate!,
                      organizer: _organizerController.text,
                      attendees: _attendees,
                      googleMapsId: _selectedPlaceId!,
                      postCode: _selectedPostCode,
                    );
                    widget.onSubmitForm(newRestaurant);
                    fm.Navigator.of(context).pop();
                  } else {
                    setState(() {
                      _submitAttempted = true;
                    });
                    fm.showDialog(
                      context: context,
                      builder: (ctx) {
                        return fm.AlertDialog(
                          title: const fm.Text('Invalid Input'),
                          content: const fm.Text(
                              'Please fill in all the required fields.'),
                          actions: [
                            fm.TextButton(
                              onPressed: () {
                                fm.Navigator.of(ctx).pop();
                              },
                              child: const fm.Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: const fm.Text('Submit'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
