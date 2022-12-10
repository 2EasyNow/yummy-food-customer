import 'package:intelligent_food_delivery/app/data/order/data_sources/food_order_data_source.dart';
import 'package:intelligent_food_delivery/app/data/order/models/order_product.dart';

import 'package:intelligent_food_delivery/app/data/order/models/food_order.dart';

import '../../../domain/order/repositories/order_repository.dart';

class FoodOrderRepositoryImpl implements FoodOrderRepository {
  final FoodOrderDataSource _dataSource;

  FoodOrderRepositoryImpl(this._dataSource);

  @override
  Future<FoodOrder> createOrder(
    FoodOrder foodOrder,
    List<OrderProduct> items,
    List<String> restaurantFCMTokens,
  ) async {
    return _dataSource.createFoodOrder(foodOrder, items, restaurantFCMTokens);
  }
  @override
  Stream<List<FoodOrder>> getOrders() {
    return _dataSource.getOrders();
  }

  @override
  Future<List<OrderProduct>> getOrderProducts(FoodOrder order) {
    return _dataSource.getOrderProducts(order);
  }

  @override
  Future updateOrderStatus(FoodOrder order, OrderStatus status) {
    return _dataSource.updateOrderStatus(order, status);
  }
}
