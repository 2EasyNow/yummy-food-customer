import '../../../data/restaurant/models/restaurant.dart';

abstract class RestaurantRepository {
  Future<Restaurant?> getRestaurant(String uid);
  Future<List<Restaurant>> getAllRestaurants();
}
