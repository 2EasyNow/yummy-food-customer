import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intelligent_food_delivery/app/common/converters/converters.dart';
import 'package:json_annotation/json_annotation.dart';

part 'app_user.g.dart';

@JsonSerializable(
  createFieldMap: true,
  createToJson: true,
  explicitToJson: true,
)
class AppUser {
  AppUser({
    this.id = '',
    required this.name,
    required this.phone,
    this.selectedAddressId = 'current',
    this.fcmTokens = const [],
    this.createdAt,
    required this.updatedAt,
  }) {
    // _$assertUsers(this);
  }

  factory AppUser.fromJson(Map<String, dynamic> json) => _$AppUserFromJson(json);

  AppUser copyWith({
    String? id,
    String? name,
    String? phone,
    String? selectedAddressId,
    List<String>? fcmTokens,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return AppUser(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      fcmTokens: fcmTokens ?? this.fcmTokens,
      selectedAddressId: selectedAddressId ?? this.selectedAddressId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @Id()
  final String id;
  final String name;
  final String phone;
  final String selectedAddressId;
  final List<String> fcmTokens;
  @DateTimeToTimestampConverter()
  final DateTime? createdAt;
  @DateTimeToTimestampConverter()
  final DateTime updatedAt;
}

enum AddressLabel {
  home,
  office,
  other,
}

@JsonSerializable(
  createFieldMap: true,
  createToJson: true,
  explicitToJson: true,
)
class Address {
  Address({
    this.id = '',
    required this.location,
    required this.address,
    required this.city,
    required this.noteForRider,
    required this.label,
  });

  // copyWith
  Address copyWith({
    LatLng? location,
    String? address,
    String? id,
    String? city,
    String? noteForRider,
    AddressLabel? label,
  }) {
    return Address(
      id: id ?? this.id,
      location: location ?? this.location,
      address: address ?? this.address,
      city: city ?? this.city,
      noteForRider: noteForRider ?? this.noteForRider,
      label: label ?? this.label,
    );
  }

  @Id()
  final String id;
  @LatLngConverter()
  final LatLng location;
  final String address;
  final String city;
  final String noteForRider;

  @JsonKey(defaultValue: AddressLabel.other)
  @AddressLabelConverter()
  final AddressLabel label;
}

@Collection<AppUser>('AppUser')
@Collection<Address>('AppUser/*/Addresses', name: 'address')
@Collection<Cart>('AppUser/*/Cart', name: 'cart')
final customerRef = AppUserCollectionReference();

extension AppUserCollectionReferenceX on AppUserCollectionReference {
  /// Get current user address collection reference
  AddressCollectionReference get address => customerRef.doc(FirebaseAuth.instance.currentUser?.uid).address;
  CartCollectionReference get cart => customerRef.doc(FirebaseAuth.instance.currentUser?.uid).cart;
}

// AddressLabel Converter
class AddressLabelConverter implements JsonConverter<AddressLabel, String> {
  const AddressLabelConverter();

  // When Data comes from firebase
  @override
  AddressLabel fromJson(String label) {
    return AddressLabel.values.byName(label);
  }

  // When Data goes to firebase
  @override
  String toJson(AddressLabel label) {
    return label.name;
  }
}

@JsonSerializable(
  createFieldMap: true,
  createToJson: true,
  explicitToJson: true,
)
class Cart {
  Cart({
    this.id = '',
    required this.restaurantId,
    required this.productId,
    required this.quantity,
    this.createdAt,
    required this.updatedAt,
  }) {
    // _$assertUsers(this);
  }

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);

  // copyWith
  Cart copyWith({
    String? id,
    String? retaurantId,
    String? productId,
    int? quantity,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Cart(
      id: id ?? this.id,
      restaurantId: retaurantId ?? this.restaurantId,
      productId: productId ?? this.productId,
      quantity: quantity ?? this.quantity,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @Id()
  final String id;
  final String restaurantId;
  final String productId;
  final int quantity;
  @DateTimeToTimestampConverter()
  final DateTime? createdAt;
  @DateTimeToTimestampConverter()
  final DateTime updatedAt;
}
