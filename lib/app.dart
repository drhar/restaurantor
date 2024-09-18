import 'package:flutter/material.dart' as fm;
import 'package:restaurantour/models/app_screen.dart' as screen;
import 'package:restaurantour/widgets/main_menu.dart' as mm;
import 'package:restaurantour/widgets/restaurant_list.dart' as rl;
import 'package:restaurantour/data/dummy_restaurant_records.dart' as dummy_rr;

class RestauranTourApp extends fm.StatefulWidget {
  const RestauranTourApp({super.key});

  @override
  fm.State<RestauranTourApp> createState() => _RestauranTourAppState();
}

class _RestauranTourAppState extends fm.State<RestauranTourApp> {
  var currentScreen = screen.AppScreen.mainMenu;
  final restaurantRecords = dummy_rr.dummyRestaurantRecords;

  void changeScreen(screen.AppScreen newScreen) {
    setState(() {
      currentScreen = newScreen;
    });
  }

  @override
  fm.Widget build(fm.BuildContext context) {
    switch (currentScreen) {
      case screen.AppScreen.mainMenu:
        return mm.MainMenu(changeScreen);
      case screen.AppScreen.restaurantList:
        return rl.RestaurantList(dummy_rr.dummyRestaurantRecords);
      case screen.AppScreen.restaurantMap:
        throw UnimplementedError();
    }
  }
}
