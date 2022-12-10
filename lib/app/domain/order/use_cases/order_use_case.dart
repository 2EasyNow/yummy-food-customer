import 'dart:async';

import 'package:get/get.dart';
import 'package:intelligent_food_delivery/app/data/app_user/models/app_user.dart';
import 'package:intelligent_food_delivery/app/data/order/models/order_product.dart';
import '../../../data/food_item/models/food_item.dart';
import '../../../data/order/models/food_order.dart';
import '../../../data/restaurant/models/restaurant.dart';
import '../../app_user/use_cases/app_user_use_case.dart';
import '../repositories/order_repository.dart';

class FoodOrderUseCase extends GetxService {
  final FoodOrderRepository _repository;

  FoodOrderUseCase(this._repository);

  Future<FoodOrder> submitOrder(
    Restaurant restaurant,
    List<Cart> cartItems,
    List<FoodItem> foodItems,
    int deliveryFee,
    int platformFee,
    int subTotal,
  ) async {
    final order = FoodOrder(
      customerId: Get.find<AppUserUseCase>().currentUser!.id,
      restaurantId: restaurant.id,
      deliveryFee: deliveryFee,
      platformFee: platformFee,
      subTotal: subTotal,
      totalItems: cartItems.length,
      updatedAt: DateTime.now(),
      createdAt: DateTime.now(),
    );
    final orderProducts = <OrderProduct>[];
    for (var cartItem in cartItems) {
      final product = foodItems.firstWhere((element) => element.id == cartItem.productId);
      orderProducts.add(
        OrderProduct(
          orderId: '',
          restaurantId: order.restaurantId,
          customerId: order.customerId,
          productId: product.id,
          price: product.price,
          productName: product.name,
          imageName: product.imageName,
          quantity: cartItem.quantity,
          updatedAt: DateTime.now(),
          createdAt: DateTime.now(),
        ),
      );
    }

    return _repository.createOrder(
      order,
      orderProducts,
      restaurant.fcmTokens,
    );
  }

  Stream<List<FoodOrder>> fetchOrders() {
    return _repository.getOrders();
  }

  Future<List<OrderProduct>> fetchOrderProducts(FoodOrder order) {
    return _repository.getOrderProducts(order);
  }

  cancelOrder(FoodOrder order) async {
    await _repository.updateOrderStatus(order, OrderStatus.canceledByRestaurant);
  }
}
