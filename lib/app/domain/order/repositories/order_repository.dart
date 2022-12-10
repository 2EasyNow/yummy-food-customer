import '../../../data/order/models/food_order.dart';
import '../../../data/order/models/order_product.dart';

abstract class FoodOrderRepository {
  Future<FoodOrder> createOrder(
    FoodOrder foodOrder,
    List<OrderProduct> items,
    List<String> restaurantFCMTokens,
  );
  Stream<List<FoodOrder>> getOrders();
  Future<List<OrderProduct>> getOrderProducts(FoodOrder order);

  Future updateOrderStatus(FoodOrder order, OrderStatus accepted);
}
