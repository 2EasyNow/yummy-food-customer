import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:intelligent_food_delivery/app/common/utils/firebase.dart';

import '../models/food_item.dart';
import 'food_item_data_source.dart';

class FoodItemRemoteDataSource implements FoodItemDataSource {
  @override
  Future<String> createFoodItem(FoodItem item) async {
    return (await foodItemRef.add(item)).reference.id;
  }

  @override
  Future<List<FoodItem>> getItemsByRestaurant(String restaurantId) async {
    final data = await foodItemRef.whereRestaurantId(isEqualTo: restaurantId).get();
    return data.docs.map((e) => e.data).toList();
  }

  @override
  Future<List<FoodItem>> getItemsOfRestaurantByCategory(String categoryId) async {
    final data = await foodItemRef.whereCategories(arrayContains: categoryId).get();
    return data.docs.map((e) => e.data).toList();
  }

  @override
  Future<FoodItem?> getFoodItem(String categoryId) async {
    final category = await foodItemRef.doc(categoryId).get();
    return category.data;
  }

  @override
  Future<List<FoodItem>> getFoodItemsByIds(List<String> ids) async {
    final data = await foodItemRef.whereDocumentId(whereIn: ids).get();
    return data.docs.map((e) => e.data).toList();
  }

  @override
  Future<FoodItem> update(FoodItem updatedItem) async {
    await foodItemRef.doc(updatedItem.id).set(updatedItem);
    return updatedItem;
  }

  @override
  Future<void> delete(String categoryId) {
    return foodItemRef.doc(categoryId).delete();
  }

  @override
  Future<String> uploadItemImage(File image, String itemId) {
    return FirebaseUtils.uploadFileOnFirebaseStorage(image, 'restaurants/${FirebaseAuth.instance.currentUser!.uid}/$itemId');
  }
}
