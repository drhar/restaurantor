import 'package:flutter/material.dart' as fm;
import 'package:restaurantour/app.dart' as app;

void main() {
  fm.runApp(
    fm.MaterialApp(
      title: 'RestauranTour',
      theme: fm.ThemeData().copyWith(
        colorScheme: fm.ColorScheme.fromSeed(
            seedColor: fm.Color.fromARGB(255, 148, 62, 28)),
      ),
      home: const app.RestauranTourApp(),
    ),
  );
}
