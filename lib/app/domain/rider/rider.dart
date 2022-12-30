import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rider.g.dart';

enum RiderAgeCategory {
  minor,
  adult,
}

@JsonSerializable(createFieldMap: true)
class Rider {
  Rider({
    required this.name,
    required this.phone,
    required this.city,
    required this.vehicleType,
    required String age,
    this.fcmTokens = const [],
    this.currentOrderId = '',
    this.isAvailable = true,
    this.active = true,
    this.createdAt,
    this.location,
    required this.updatedAt,
  }) {
    this.age = RiderAgeCategory.values.firstWhere(
      (category) => category.toString() == age,
      orElse: () => RiderAgeCategory.adult,
    );
    // _$assertUsers(this);
  }

  factory Rider.fromJson(Map<String, Object?> json) => _$RiderFromJson(json);
  toMap() => _$RiderToJson(this);

  // copywith Methdo
  Rider copyWith({
    String? name,
    String? phone,
    String? city,
    String? vehicleType,
    RiderAgeCategory? age,
    String? currentOrderId,
    bool? isAvailable,
    bool? active,
    DateTime? createdAt,
    LatLng? location,
    DateTime? updatedAt,
    List<String>? fcmTokens
  }) {
    return Rider(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      city: city ?? this.city,
      vehicleType: vehicleType ?? this.vehicleType,
      age: (age ?? this.age).toString(),
      currentOrderId: currentOrderId ?? this.currentOrderId,
      isAvailable: isAvailable ?? this.isAvailable,
      active: active ?? this.active,
      createdAt: createdAt ?? this.createdAt,
      location: location ?? this.location,
      updatedAt: updatedAt ?? this.updatedAt,
      fcmTokens: fcmTokens ?? this.fcmTokens,
    );
  }

  final String name;
  final String phone;
  final String city;
  final String vehicleType;
  late final RiderAgeCategory age;
  final bool isAvailable;
  final String currentOrderId;
  final bool active;
  final List<String> fcmTokens;
  @LatLngConverter()
  final LatLng? location;
  @TimestampConverter()
  final DateTime? createdAt;
  @TimestampConverter()
  final DateTime updatedAt;
}

@Collection<Rider>('Rider')
final riderRef = RiderCollectionReference();

// @Collection<User>('Users')
// // @Collection<Comment>('Users/*/comments', name: 'comments')
// final moviesRef = MovieCollectionReference();

// @JsonSerializable()
// class Comment {
//   Comment({
//     required this.authorName,
//     required this.message,
//   });

//   final String authorName;
//   final String message;
// }

class TimestampConverter implements JsonConverter<DateTime, Timestamp> {
  const TimestampConverter();

  @override
  DateTime fromJson(Timestamp json) {
    return json.toDate();
  }

  @override
  Timestamp toJson(DateTime date) {
    return Timestamp.fromDate(date);
  }
}

class LatLngConverter implements JsonConverter<LatLng?, Object?> {
  const LatLngConverter();

  // When Data comes from firebase
  @override
  LatLng? fromJson(Object? coordinate) {
    if (coordinate == null) return null;
    final location = (coordinate as Map<String, dynamic>)['geopoint'] as GeoPoint;
    return LatLng(location.latitude, location.longitude);
  }

  // When Data goes to firebase
  @override
  Object? toJson(LatLng? latlng) {
    if (latlng == null) return null;
    return GeoFirePoint(latlng.latitude, latlng.longitude).data;
  }
}
