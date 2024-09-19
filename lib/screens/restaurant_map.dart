import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:restaurantour/apis/google_places_api.dart' as places;

class RestaurantMap extends StatefulWidget {
  const RestaurantMap({super.key});

  // A restaurant's place ID
  static const placeId = 'ChIJB0h73UcbdkgRnGcVVmXz5x4';
  // final restaurant = places.getPlace(place_id);

  @override
  State<RestaurantMap> createState() => _RestaurantMapState();
}

class _RestaurantMapState extends State<RestaurantMap> {
  final Map<String, Marker> _markers = {};
  // Charing Cross
  final LatLng _center = const LatLng(51.508206, -0.125033);

  Future<void> _onMapCreated(GoogleMapController controller) async {
    final restaurant = await places.getPlace(RestaurantMap.placeId);
    setState(() {
      _markers.clear();
      final marker = Marker(
        markerId: MarkerId(restaurant.name),
        position: LatLng(
          restaurant.latitude,
          restaurant.longitude,
        ),
        infoWindow: InfoWindow(
          title: restaurant.name,
          snippet: restaurant.formattedAddress,
        ),
      );
      _markers[restaurant.name] = marker;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green[700],
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('A - Z Map'),
          elevation: 2,
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11,
          ),
          markers: _markers.values.toSet(),
        ),
      ),
    );
  }
}
