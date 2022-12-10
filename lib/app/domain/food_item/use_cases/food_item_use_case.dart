import 'dart:io';

import 'package:get/get.dart';
import 'package:intelligent_food_delivery/app/common/utils/random.dart';
import 'package:intelligent_food_delivery/app/domain/food_category/use_cases/food_category_use_case.dart';

import '../../../data/food_item/models/food_item.dart';
import '../repositories/food_item_repository.dart';

class FoodItemUseCase {
  final FoodItemRepository _repository;

  FoodItemUseCase(this._repository);

  Future<FoodItem> create({
    required String restaurantOwnerId,
    required String name,
    required String description,
    required int price,
    required File image,
    List<String> categories = const [],
    List<String> tags = const [],
  }) async {
    final imageName = getRandomString(20);
    await _repository.uploadItemImage(
      image,
      imageName,
    );
    final item = FoodItem(
      restaurantId: restaurantOwnerId,
      name: name,
      description: description,
      price: price,
      imageName: imageName,
      categories: categories,
      tags: tags,
      updatedAt: DateTime.now(),
      createdAt: DateTime.now(),
    );
    final categoryUseCase = Get.find<FoodCategoryUseCase>();

    for (var element in categories) {
      categoryUseCase.incrementTotalFoodItems(categoryId: element);
    }

    return await _repository.createItem(item);
  }

  Future<FoodItem> updateItem({
    required FoodItem oldItem,
    String? name,
    String? description,
    String? imageUrl,
    int? price,
    List<String>? categories,
    List<String>? tags,
    bool? active,
  }) async {
    if (categories != null) {
      final needIncrementCategory = categories.where((element) => !oldItem.categories.contains(element)).toList();
      final needDecrementCategory = oldItem.categories.where((element) => !categories.contains(element)).toList();
      final categoryUseCase = Get.find<FoodCategoryUseCase>();
      for (var element in needIncrementCategory) {
        await categoryUseCase.incrementTotalFoodItems(categoryId: element);
      }

      for (var element in needDecrementCategory) {
        await categoryUseCase.decrementTotalFoodItems(categoryId: element);
      }
    }
    final item = oldItem.copyWith(
      name: name,
      description: description,
      imageName: imageUrl,
      price: price,
      categories: categories,
      tags: tags,
      active: active,
      updatedAt: DateTime.now(),
    );
    return await _repository.updateItem(item);
  }

  Future<FoodItem> updateCategoryStatus({
    required FoodItemDocumentSnapshot item,
    required bool active,
  }) async {
    final category = item.data!.copyWith(
      active: active,
    );
    return _repository.updateItem(category);
  }

  Future<List<FoodItem>> getAllFoodItems({
    required String restaurantOwnerId,
  }) async {
    return _repository.getRestaurantItems(restaurantOwnerId);
  }

  Future<List<FoodItem>> getAllFoodItemsByCategory({
    required String categoryId,
  }) async {
    return _repository.getRestaurantItemsByCategory(categoryId);
  }

  Future<List<FoodItemDocumentSnapshot>> searchFoodItems({
    required List<FoodItemDocumentSnapshot> items,
    required String query,
  }) async {
    return items.where((element) => element.data!.name.contains(query)).toList();
  }

  Future<void> delete({
    required String id,
  }) async {
    return _repository.deleteItem(id);
  }

  Future<FoodItem?> getItem(String productId) {
    return _repository.getItem(productId);
  }

  Future<List<FoodItem>> getItemsByIds(List<String> ids) {
    return _repository.getFoodItemsByIds(ids);
  }
}
