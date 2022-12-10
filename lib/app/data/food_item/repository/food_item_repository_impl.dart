import 'dart:io';

import 'package:intelligent_food_delivery/app/data/food_item/models/food_item.dart';
import '../../../domain/food_item/repositories/food_item_repository.dart';
import '../data_sources/food_item_data_source.dart';

class FoodItemRepositoryImpl implements FoodItemRepository {
  final FoodItemDataSource _dataSource;

  FoodItemRepositoryImpl(this._dataSource);

  @override
  Future<FoodItem> createItem(FoodItem item) async {
    final id = await _dataSource.createFoodItem(item);
    return item.copyWith(id: id);
  }

  @override
  Future<List<FoodItem>> getRestaurantItems(String restaurantId) {
    return _dataSource.getItemsByRestaurant(restaurantId);
  }

  @override
  Future<List<FoodItem>> getRestaurantItemsByCategory(String categoryId) {
    return _dataSource.getItemsOfRestaurantByCategory(categoryId);
  }

  @override
  Future<FoodItem?> getItem(String id) {
    return _dataSource.getFoodItem(id);
  }

  @override
  Future<FoodItem> updateItem(FoodItem category) {
    return _dataSource.update(category);
  }

  @override
  Future<void> deleteItem(String id) {
    return _dataSource.delete(id);
  }

  @override
  Future<String> uploadItemImage(File image, String itemId) {
    return _dataSource.uploadItemImage(image, itemId);
  }

  @override
  Future<List<FoodItem>> getFoodItemsByIds(List<String> ids) {
    return _dataSource.getFoodItemsByIds(ids);
  }
}
