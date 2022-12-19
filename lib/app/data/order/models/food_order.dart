import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../../common/converters/converters.dart';

part 'food_order.g.dart';

@JsonSerializable(createFieldMap: true)
class FoodOrder {
  FoodOrder( {
    this.id = '',
    required this.restaurantId,
    this.riderId = '',
    required this.restaurantLocation,
    required this.customerId,
    required this.customerLocation,
    required this.subTotal,
    required this.deliveryFee,
    required this.platformFee,
    required this.totalItems,
    this.status = OrderStatus.pending,
    this.createdAt,
    required this.updatedAt,
  }) {
    // _$assertUsers(this);
  }

  factory FoodOrder.fromJson(Map<String, Object?> json) => _$FoodOrderFromJson(json);
  toMap() => _$FoodOrderToJson(this);

  // copyWith
  FoodOrder copyWith({
    String? id,
    String? restaurantId,
    LatLng? restaurantLocation,
    String? customerId,
    String? riderId,
    LatLng? customerLocation,
    OrderStatus? status,
    int? subTotal,
    int? deliveryFee,
    int? platformFee,
    int? totalItems,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return FoodOrder(
      id: id ?? this.id,
      riderId: riderId ?? this.riderId,
      restaurantId: restaurantId ?? this.restaurantId,
      restaurantLocation: restaurantLocation ?? this.restaurantLocation,
      customerId: customerId ?? this.customerId,
      customerLocation: customerLocation ?? this.customerLocation,
      status: status ?? this.status,
      subTotal: subTotal ?? this.subTotal,
      deliveryFee: deliveryFee ?? this.deliveryFee,
      platformFee: platformFee ?? this.platformFee,
      totalItems: totalItems ?? this.totalItems,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @Id()
  final String id;
  final String customerId;
  @LatLngConverter()
  final LatLng customerLocation;
  final String restaurantId;
  @LatLngConverter()
  final LatLng restaurantLocation;
  final String riderId;
  final int subTotal;
  final int deliveryFee;
  final int platformFee;
  final int totalItems;
  @OrderStatusConverter()
  final OrderStatus status;

  @DateTimeToTimestampConverter()
  final DateTime? createdAt;
  @DateTimeToTimestampConverter()
  final DateTime updatedAt;

  int get totalBill => subTotal + platformFee + deliveryFee;
}

@Collection<FoodOrder>('Orders')
final foodOrdersRef = FoodOrderCollectionReference();

enum OrderStatus {
  pending,
  canceledByRestaurant,
  canceledByCustomer,
  cooking,
  pickedUpByRider,
  delivered;

  // color based on the state
  Color get color {
    switch (this) {
      case OrderStatus.pending:
        return Colors.orange;
      case OrderStatus.canceledByRestaurant:
      case OrderStatus.canceledByCustomer:
        return Colors.red;
      case OrderStatus.cooking:
        return Colors.blue;
      case OrderStatus.pickedUpByRider:
        return Colors.green;
      case OrderStatus.delivered:
        return Colors.purple;
    }
  }

  String get title {
    switch (this) {
      case OrderStatus.pending:
        return 'Pending';
      case OrderStatus.canceledByRestaurant:
        return 'Restaurant Canceled';
      case OrderStatus.canceledByCustomer:
        return 'Canceled';
      case OrderStatus.cooking:
        return 'Cooking';
      case OrderStatus.pickedUpByRider:
        return 'Rider Picked';
      case OrderStatus.delivered:
        return 'Delivered';
    }
  }

  static List<OrderStatus> get activeStates {
    return [
      OrderStatus.pending,
      OrderStatus.cooking,
    ];
  }

  static List<OrderStatus> get endStates {
    return [
      OrderStatus.canceledByCustomer,
      OrderStatus.canceledByRestaurant,
      OrderStatus.pickedUpByRider,
      OrderStatus.delivered,
    ];
  }
}

class OrderStatusConverter implements JsonConverter<OrderStatus, String> {
  const OrderStatusConverter();

  @override
  OrderStatus fromJson(String status) {
    return OrderStatus.values.byName(status);
  }

  @override
  String toJson(OrderStatus status) {
    return status.name;
  }
}
