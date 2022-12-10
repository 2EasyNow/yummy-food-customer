import 'dart:io';

import '../../../data/food_item/models/food_item.dart';

abstract class FoodItemRepository {
  Future<FoodItem?> getItem(String id);
  Future<FoodItem> createItem(FoodItem item);
  Future<FoodItem> updateItem(FoodItem item);
  Future<List<FoodItem>> getRestaurantItems(String restaurantId);
  Future<List<FoodItem>> getFoodItemsByIds(List<String> ids);
  Future<List<FoodItem>> getRestaurantItemsByCategory(String categoryId);
  Future<String> uploadItemImage(File image, String itemId);
  Future<void> deleteItem(String id);
}
