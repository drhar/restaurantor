import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart' as dotenv;
import 'dart:convert';

Future<GooglePlace> getPlace(String placeId) async {
  // I think this should live in the application layer - we can send a request to our server, which can own the API key (in a proper way,
  // with a secrets store etc.). Then whatever we have in our Flutter App can only be used for our specific APIs not all the ones you could
  // use with Google.
  var headers = {
    'Content-Type': 'application/json',
    'X-Goog-Api-Key': dotenv.dotenv.env['MAPS_ANDROID_API_KEY']!,
    'X-Goog-FieldMask': 'displayName,name,id,formattedAddress,location'
  };
  var request = http.Request(
      'GET', Uri.parse('https://places.googleapis.com/v1/places/$placeId'));
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    String result = await response.stream.bytesToString();
    var jsonResult = json.decode(result);

    return GooglePlace(
      name: jsonResult['displayName']['text'],
      formattedAddress: jsonResult['formattedAddress'],
      id: jsonResult['id'],
      latitude: jsonResult['location']['latitude'],
      longitude: jsonResult['location']['longitude'],
    );
  } else {
    // This is bad - might leak API key to console. At the moment, that can only be someone with access to the key already though!!
    String requestInfo =
        'Request: ${request.method} ${request.url}\nHeaders: ${request.headers}';
    String responseInfo =
        'Response: ${response.statusCode} ${response.reasonPhrase}\nHeaders: ${response.headers}';
    String responseBody = await response.stream.bytesToString();
    throw Exception(
        'Failed to load place:\n$requestInfo\n$responseInfo\nBody: $responseBody');
  }
}

class GooglePlace {
  final String name;
  final String formattedAddress;
  final String id;
  final double latitude;
  final double longitude;

  GooglePlace({
    required this.name,
    required this.formattedAddress,
    required this.id,
    required this.latitude,
    required this.longitude,
  });
}
