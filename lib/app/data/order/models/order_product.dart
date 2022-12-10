import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../../common/converters/converters.dart';

part 'order_product.g.dart';

@JsonSerializable(createFieldMap: true)
class OrderProduct {
  OrderProduct({
    this.id = '',
    required this.orderId,
    required this.restaurantId,
    required this.customerId,
    required this.productId,
    required this.productName,
    required this.imageName,
    required this.price,
    required this.quantity,
    this.createdAt,
    required this.updatedAt,
  }) {
    // _$assertUsers(this);
  }

  factory OrderProduct.fromJson(Map<String, Object?> json) => _$OrderProductFromJson(json);
  toMap() => _$OrderProductToJson(this);

  // copyWith
  OrderProduct copyWith({
    String? id,
    String? orderId,
    String? restaurantId,
    String? customerId,
    String? productId,
    String? productName,
    String? imageName,
    int? price,
    int? quantity,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return OrderProduct(
      id: id ?? this.id,
      orderId: orderId ?? this.orderId,
      restaurantId: restaurantId ?? this.restaurantId,
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      imageName: imageName ?? this.imageName,
      customerId: customerId ?? this.customerId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
    );
  }

  @Id()
  final String id;
  final String orderId;
  final String customerId;
  final String restaurantId;
  final String productId;
  final String productName;
  final String imageName;
  final int price;
  final int quantity;

  @DateTimeToTimestampConverter()
  final DateTime? createdAt;
  @DateTimeToTimestampConverter()
  final DateTime updatedAt;

  String get imagePath => 'restaurants/$restaurantId/$imageName';
}

@Collection<OrderProduct>('OrderProducts')
final orderProductsRef = OrderProductCollectionReference();
