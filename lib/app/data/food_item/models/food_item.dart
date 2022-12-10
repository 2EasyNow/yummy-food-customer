import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../../common/converters/converters.dart';

part 'food_item.g.dart';

@JsonSerializable(createFieldMap: true)
class FoodItem {
  FoodItem({
    this.id = '',
    required this.restaurantId,
    required this.name,
    required this.description,
    required this.price,
    required this.imageName,
    this.categories = const [],
    this.tags = const [],
    this.active = true,
    this.createdAt,
    required this.updatedAt,
  }) {
    // _$assertUsers(this);
  }

  factory FoodItem.fromJson(Map<String, Object?> json) => _$FoodItemFromJson(json);
  toMap() => _$FoodItemToJson(this);

  // copyWith
  FoodItem copyWith({
    String? id,
    String? name,
    String? description,
    String? imageName,
    bool? active,
    int? price,
    List<String>? categories,
    List<String>? tags,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return FoodItem(
      id: id ?? this.id,
      restaurantId: restaurantId,
      name: name ?? this.name,
      description: description ?? this.description,
      imageName: imageName ?? this.imageName,
      active: active ?? this.active,
      price: price ?? this.price,
      categories: categories ?? this.categories,
      tags: tags ?? this.tags,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @Id()
  final String id;
  final String name;
  final String description;
  final String restaurantId;
  final int price;
  final String imageName;
  final List<String> categories;
  final List<String> tags;
  final bool active;

  @DateTimeToTimestampConverter()
  final DateTime? createdAt;
  @DateTimeToTimestampConverter()
  final DateTime updatedAt;
  String get imagePath => 'restaurants/$restaurantId/$imageName';
}

@Collection<FoodItem>('FoodItems')
final foodItemRef = FoodItemCollectionReference();
