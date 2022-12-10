import '../models/food_category.dart';
import 'food_category_data_source.dart';

class FoodCategoryRemoteDataSource implements FoodCategoryDataSource {
  @override
  Future<String> createFoodCategory(FoodCategory category) async {
    return (await foodCategoriesReference.add(category)).reference.id;
  }

  @override
  Future<List<FoodCategory>> getCategoriesByRestaurant(String restaurantId) async {
    final allCategoriesSnapshot = await foodCategoriesReference.whereRestaurantId(isEqualTo: restaurantId).get();
    return allCategoriesSnapshot.docs.map((e) => e.data).toList();
  }

  @override
  Future<FoodCategory?> getFoodCategory(String categoryId) async {
    final category = await foodCategoriesReference.doc(categoryId).get();
    return category.data;
  }

  @override
  Future<FoodCategory> updateCategory(String uid, FoodCategory newCategory) async {
    await foodCategoriesReference.doc(uid).set(newCategory);
    return newCategory;
  }

  @override
  Future<void> deleteCategory(String categoryId) {
    return foodCategoriesReference.doc(categoryId).delete();
  }
}
