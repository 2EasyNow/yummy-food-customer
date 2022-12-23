import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:yummy_swipe_admin/converters/converters.dart';


part 'restaurant.g.dart';

@JsonSerializable(
  createFieldMap: true,
  createToJson: true,
)
class Restaurant {
  Restaurant({
    this.id = '',
    required this.name,
    required this.ownerName,
    required this.phone,
    required this.address,
    required this.coordinates,
    required this.openingTime,
    required this.closingTime,
    required this.averageTimeToCompleteOrder,
    this.foodOfferingTypes = const [],
    this.fcmTokens = const [],
    this.bannerImagePath = '',
    this.active = true,
    this.createdAt,
    required this.updatedAt,
  }) {
    // _$assertUsers(this);
  }

  factory Restaurant.fromJson(Map<String, Object?> json) => _$RestaurantFromJson(json);
  Map<String, dynamic> toJson() => _$RestaurantToJson(this);
  Restaurant copyWith({
    String? id,
    String? name,
    String? ownerName,
    String? phone,
    String? address,
    String? bannerImagePath,
    LatLng? coordinates,
    List<String>? foodOfferingTypes,
    List<String>? fcmTokens,
    TimeOfDay? openingTime,
    TimeOfDay? closingTime,
    int? averageTimeToCompleteOrder,
    bool? active,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Restaurant(
      id: id ?? this.id,
      name: name ?? this.name,
      ownerName: ownerName ?? this.ownerName,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      coordinates: coordinates ?? this.coordinates,
      foodOfferingTypes: foodOfferingTypes ?? this.foodOfferingTypes,
      fcmTokens: fcmTokens ?? this.fcmTokens,
      averageTimeToCompleteOrder: averageTimeToCompleteOrder ?? this.averageTimeToCompleteOrder,
      openingTime: openingTime ?? this.openingTime,
      closingTime: closingTime ?? this.closingTime,
      bannerImagePath: bannerImagePath ?? this.bannerImagePath,
      active: active ?? this.active,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @Id()
  final String id;
  final String name;
  final String ownerName;
  final String phone;
  final String address;
  final String bannerImagePath;
  final List<String> foodOfferingTypes;
  final List<String> fcmTokens;
  // averageTimeToCompleteOrder
  final int averageTimeToCompleteOrder;

  @TimeOfDayToTimestampConverter()
  final TimeOfDay openingTime;
  @TimeOfDayToTimestampConverter()
  final TimeOfDay closingTime;
  @LatLngConverter()
  final LatLng coordinates;
  @DateTimeToTimestampConverter()
  final DateTime? createdAt;
  @DateTimeToTimestampConverter()
  final DateTime updatedAt;
  final bool active;
}

@Collection<Restaurant>('Restaurant')
final userRef = RestaurantCollectionReference();

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

// from TimeOfDay to Timestamp and vice versa
