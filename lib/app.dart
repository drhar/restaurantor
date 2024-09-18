import 'package:flutter/material.dart' as fm;
import 'package:restaurantour/models/app_screen.dart' as screen;
import 'package:restaurantour/widgets/main_menu.dart' as mm;

class RestauranTourApp extends fm.StatefulWidget {
  const RestauranTourApp({super.key});

  @override
  fm.State<RestauranTourApp> createState() => _RestauranTourAppState();
}

class _RestauranTourAppState extends fm.State<RestauranTourApp> {
  var currentScreen = screen.AppScreen.mainMenu;

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
      default:
        return mm.MainMenu(changeScreen);
    }
  }
}
