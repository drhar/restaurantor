import 'package:flutter/material.dart' as fm;
import 'package:restaurantour/widgets/main_menu.dart' as main_menu;

void main() {
  fm.runApp(const RestauranTourApp());
}

class RestauranTourApp extends fm.StatelessWidget {
  const RestauranTourApp({super.key});

  // This widget is the root of your application.
  @override
  fm.Widget build(fm.BuildContext context) {
    return fm.MaterialApp(
      title: 'Flutter Demo',
      theme: fm.ThemeData(
        colorScheme: fm.ColorScheme.fromSeed(seedColor: fm.Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const main_menu.MainMenu(),
    );
  }
}
