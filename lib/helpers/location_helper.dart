import 'dart:convert';

import 'package:http/http.dart' as http;

class LocationHelper {
  static const GOOGLE_API_KEY = 'AIzaSyDbGaNaFrcfb86qhICYyZv6lcUclnoCh-Q';

  static String generateLocationPreviewImage(
      {required double latitude, required double longtitude}) {
    return '''https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longtitude&zoom=16&size=600x300&maptype=roadmap
&markers=color:red%7Clabel:A%7C$latitude,$longtitude
&key=$GOOGLE_API_KEY''';
  }

  static Future<String> getPlaceAddress(double lat, double lng) async {
    final uri = Uri.parse(
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=$GOOGLE_API_KEY');
    final response = await http.get(uri);
    return json.decode(response.body)['results'][0]['formatted_address'];
  }
}
