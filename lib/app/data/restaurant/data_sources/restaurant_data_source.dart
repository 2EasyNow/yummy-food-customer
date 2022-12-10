import '../models/restaurant.dart';

abstract class RestaurantDataSource {
  Future<List<Restaurant>> getAllRestaurants();
  Future<Restaurant?> getRestaurant(String uid);
  Future<Restaurant?> getRestaurantByPhoneNumber(String phone);
}
