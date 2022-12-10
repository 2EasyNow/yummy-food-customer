import '../models/food_category.dart';

abstract class FoodCategoryDataSource {
  Future<String> createFoodCategory(FoodCategory category);
  Future<FoodCategory?> getFoodCategory(String categoryId);
  Future<List<FoodCategory>> getCategoriesByRestaurant(String restaurantId);
  Future<FoodCategory> updateCategory(String uid, FoodCategory newCategory);
  Future<void> deleteCategory(String categoryId);
}
