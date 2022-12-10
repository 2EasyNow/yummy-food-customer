import 'dart:async';

import 'package:get/get.dart';
import 'package:intelligent_food_delivery/app/data/order/models/food_order.dart';
import 'package:intelligent_food_delivery/app/data/restaurant/models/restaurant.dart';
import 'package:intelligent_food_delivery/app/domain/order/use_cases/order_use_case.dart';
import 'package:intelligent_food_delivery/app/domain/restaurant/use_cases/restaurant_use_case.dart';

class OrdersListController extends GetxController {
  StreamSubscription? _ordersSubscription;
  final orderUseCase = Get.find<FoodOrderUseCase>();
  final restaurantUseCase = Get.find<RestaurantUseCase>();
  final count = 0.obs;
  final orders = <FoodOrder>[].obs;
  @override
  void onInit() {
    super.onInit();
    fetchOrders();
  }

  void fetchOrders() {
    _ordersSubscription = orderUseCase.fetchOrders().listen((event) {
      orders.assignAll(event);
      orders.refresh();
    });
  }

  Restaurant getRestaurant(String restaurantId) {
    return restaurantUseCase.allNearbyRestaurants.firstWhere((element) => element.id == restaurantId);
  }

  @override
  void onClose() {
    super.onClose();
    _ordersSubscription!.cancel();
  }
}
