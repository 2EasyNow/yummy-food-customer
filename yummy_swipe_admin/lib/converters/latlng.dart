import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

// class LatLngConverter implements JsonConverter<GeoPoint, Map<String, dynamic>> {
//   const LatLngConverter();

//   // When Data comes from firebase
//   @override
//   GeoPoint fromJson(Map<String, dynamic> json) {
//     return GeoPoint(json['Latitude']!, json['Longitude']!);
//   }

//   // When Data goes to firebase
//   @override
//   Map<String, dynamic> toJson(GeoPoint latlng) {
//     return {'Latitude': latlng.latitude, 'Longitude': latlng.longitude};
//   }
// }

// class LatLngConverter implements JsonConverter<LatLng, GeoPoint> {
//   const LatLngConverter();

//   // When Data comes from firebase
//   @override
//   LatLng fromJson(GeoPoint point) {
//     return LatLng(point.latitude, point.longitude);
//   }

//   // When Data goes to firebase
//   @override
//   GeoPoint toJson(LatLng latlng) {
//     return GeoPoint(latlng.latitude, latlng.longitude);
//   }
// }

class LatLngConverter implements JsonConverter<LatLng, Object> {
  const LatLngConverter();

  // When Data comes from firebase
  @override
  LatLng fromJson(Object coordinate) {
    final location = (coordinate as Map<String, dynamic>)['geopoint'] as GeoPoint;
    return LatLng(location.latitude, location.longitude);
  }

  // When Data goes to firebase
  @override
  Object toJson(LatLng latlng) {
    return GeoFirePoint(latlng.latitude, latlng.longitude).data;
  }
}
