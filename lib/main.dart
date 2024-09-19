import 'package:flutter/material.dart' as fm;
import 'package:restaurantour/app.dart' as app;
import 'package:flutter_dotenv/flutter_dotenv.dart' as dotenv;

Future main() async {
  await dotenv.dotenv.load();
  
  fm.runApp(
    fm.MaterialApp(
      title: 'RestauranTour',
      theme: fm.ThemeData().copyWith(
        colorScheme: fm.ColorScheme.fromSeed(
            seedColor: fm.Color.fromARGB(255, 24, 60, 151)),
      ),
      home: const app.RestauranTourApp(),
    ),
  );
}
