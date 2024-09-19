import 'package:flutter/material.dart' as fm;
import 'package:restaurantour/models/app_screen.dart' as screen;
import 'package:restaurantour/screens/main_menu.dart' as mm;
import 'package:restaurantour/screens/restaurant_list.dart' as rl;
import 'package:restaurantour/screens/restaurant_map.dart' as rm;
import 'package:restaurantour/data/dummy_restaurant_records.dart' as dummy_rr;

class RestauranTourApp extends fm.StatefulWidget {
  const RestauranTourApp({super.key});

  @override
  fm.State<RestauranTourApp> createState() => _RestauranTourAppState();
}

class _RestauranTourAppState extends fm.State<RestauranTourApp> {
  final restaurantRecords = dummy_rr.dummyRestaurantRecords;

  void _selectScreen(
      fm.BuildContext context, screen.AppScreen newScreen) async {
    await fm.Navigator.of(context).push(
      fm.MaterialPageRoute(
        builder: (ctx) {
          switch (newScreen) {
            case screen.AppScreen.restaurantList:
              return rl.RestaurantList(restaurantRecords);
            case screen.AppScreen.restaurantMap:
              return const rm.RestaurantMap();
            default:
              return mm.MainMenu(_selectScreen);
          }
        },
      ),
    ).then((_) {});
  }

  @override
  fm.Widget build(fm.BuildContext context) {
    return mm.MainMenu(_selectScreen);
  }
}
