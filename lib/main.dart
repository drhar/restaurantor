import 'package:flutter/material.dart' as fm;
import 'package:restaurantour/app.dart' as app;
import 'package:flutter_dotenv/flutter_dotenv.dart' as dotenv;
import 'package:google_maps_flutter_android/google_maps_flutter_android.dart'
    show GoogleMapsFlutterAndroid;
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart'
    show GoogleMapsFlutterPlatform;
import 'package:flutter/services.dart' as svcs;

Future main() async {
  await dotenv.dotenv.load();

  fm.WidgetsFlutterBinding.ensureInitialized();

  final mapsImplementation = GoogleMapsFlutterPlatform.instance;
  if (mapsImplementation is GoogleMapsFlutterAndroid) {
    mapsImplementation.useAndroidViewSurface = true;
  }

  svcs.SystemChrome.setPreferredOrientations([
    svcs.DeviceOrientation.portraitUp,
  ]).then(
    (value) => fm.runApp(
      fm.MaterialApp(
        title: 'RestauranTour',
        home: const app.RestauranTourApp(),
      ),
    ),
  );
}
