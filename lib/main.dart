import 'package:flutter/material.dart' as fm;
import 'package:restaurantour/app.dart' as app;
import 'package:flutter_dotenv/flutter_dotenv.dart' as dotenv;
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart'
    as place_picker;
import 'package:google_maps_flutter/google_maps_flutter.dart' as gm;
import 'dart:io' show Platform;

Future main() async {
  await dotenv.dotenv.load();
  if (Platform.isAndroid) {
    AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
  }

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
