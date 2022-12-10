import 'dart:io';

import '../models/food_item.dart';

abstract class FoodItemDataSource {
  /// Returns the [String] id of the created [FoodItem]
  Future<String> createFoodItem(FoodItem item);
  Future<FoodItem?> getFoodItem(String foodItemId);
  Future<List<FoodItem>> getItemsByRestaurant(String restaurantId);
  Future<List<FoodItem>> getItemsOfRestaurantByCategory(String restaurantId);
  Future<List<FoodItem>> getFoodItemsByIds(List<String> ids);
  Future<FoodItem> update(FoodItem updatedFoodItem);
  Future<void> delete(String foodItemId);
  Future<String> uploadItemImage(File image, String itemId);
}
