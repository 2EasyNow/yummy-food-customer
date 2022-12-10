import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../common/converters/converters.dart';

part 'food_category.g.dart';

@JsonSerializable(createFieldMap: true)
class FoodCategory {
  FoodCategory({
    this.id = '',
    required this.restaurantId,
    required this.name,
    this.totalFoodItems = 0,
    this.active = true,
    this.createdAt,
    required this.updatedAt,
  }) {
    // _$assertUsers(this);
  }

  factory FoodCategory.fromJson(Map<String, Object?> json) => _$FoodCategoryFromJson(json);
  toMap() => _$FoodCategoryToJson(this);

  // copyWith
  FoodCategory copyWith({
    String? id,
    String? name,
    bool? active,
    int? totalFoodItems,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return FoodCategory(
      id: id ?? this.id,
      restaurantId: restaurantId,
      name: name ?? this.name,
      active: active ?? this.active,
      totalFoodItems: totalFoodItems ?? this.totalFoodItems,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @Id()
  final String id;
  final String restaurantId;
  final String name;
  final bool active;
  final int totalFoodItems;

  @DateTimeToTimestampConverter()
  final DateTime? createdAt;
  @DateTimeToTimestampConverter()
  final DateTime updatedAt;
}

@Collection<FoodCategory>('FoodCategory')
final foodCategoriesReference = FoodCategoryCollectionReference();
