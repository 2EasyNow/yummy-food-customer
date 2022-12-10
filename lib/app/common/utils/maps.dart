import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../secrets.dart';

class GoogleMapsUtils {
  static Future<Map<String, String>> getAddressFromLatLng(LatLng latlng) async {
    final dio = Dio();
    final url = "https://maps.googleapis.com/maps/api/geocode/json?latlng=${latlng.latitude},${latlng.longitude}&key=$MAP_API_KEY";
    final result = await dio.get(url);
    return {
      'city': (result.data['results'][0]['address_components'] as List<dynamic>).where((obj) => obj['types'].contains('locality')).first['long_name'],
      'address': result.data['results'][0]['formatted_address'],
    };
  }

  // get the distance and travel time between two points
  static Future<MapDistanceMatric> getDistanceAndTime(LatLng origin, LatLng destination) async {
    final dio = Dio();
    final url =
        "https://maps.googleapis.com/maps/api/distancematrix/json?units=metric&origins=${origin.latitude},${origin.longitude}&destinations=${destination.latitude},${destination.longitude}&key=$MAP_API_KEY";
    final result = await dio.get(url);
    final distance = result.data['rows'][0]['elements'][0]['distance'];
    final time = result.data['rows'][0]['elements'][0]['duration'];
    return MapDistanceMatric(
      distance: distance['text'],
      distanceInMeters: distance['value'],
      time: time['text'],
      timeInSeconds: time['value'],
    );
  }
}

class MapDistanceMatric {
  final String distance;
  final int distanceInMeters;
  final String time;
  final int timeInSeconds;
  MapDistanceMatric({
    required this.distance,
    required this.distanceInMeters,
    required this.time,
    required this.timeInSeconds,
  });

  int get mins => (timeInSeconds / 60).round(); 

}
