import '../../../domain/restaurant/repositories/restaurant_repository.dart';
import '../data_sources/restaurant_data_source.dart';
import '../models/restaurant.dart';

class RestaurantRepositoryImpl implements RestaurantRepository {
  final RestaurantDataSource _dataSource;

  RestaurantRepositoryImpl(this._dataSource);
  
  @override
  Future<List<Restaurant>> getAllRestaurants() {
    return _dataSource.getAllRestaurants();
  }
  
  @override
  Future<Restaurant?> getRestaurant(String uid) {
    return _dataSource.getRestaurant(uid);
  }

}
