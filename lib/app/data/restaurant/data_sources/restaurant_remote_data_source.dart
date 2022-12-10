import 'package:intelligent_food_delivery/app/data/restaurant/data_sources/restaurant_data_source.dart';

import '../models/restaurant.dart';

class RestaurantRemoteDataSource implements RestaurantDataSource {
  @override
  Future<List<Restaurant>> getAllRestaurants() async {
    return (await restaurantRef.get()).docs.map((e) => e.data).toList();
  }

  @override
  Future<Restaurant?> getRestaurant(String uid) async {
    final user = await restaurantRef.doc(uid).get();
    return user.data;
  }

  @override
  Future<Restaurant?> getRestaurantByPhoneNumber(String phone) async {
    final user = await restaurantRef.wherePhone(isEqualTo: phone).get();
    return user.docs.isNotEmpty ? user.docs.first.data : null;
  }
}
