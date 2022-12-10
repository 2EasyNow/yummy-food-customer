import 'package:get/get.dart';
import 'package:intelligent_food_delivery/app/data/order/models/order_product.dart';
import 'package:intelligent_food_delivery/app/domain/order/use_cases/order_use_case.dart';

import '../../../data/order/models/food_order.dart';
import '../../../data/restaurant/models/restaurant.dart';

class OrdersStatusDetailController extends GetxController {
  late final FoodOrder order;
  late final Restaurant restaurant;
  final List<OrderProduct> orderProducts = [];
  final isProductsFetched = false.obs;
  final orderUseCae = Get.find<FoodOrderUseCase>();
  @override
  void onInit() {
    super.onInit();
    order = Get.arguments['order'];
    restaurant = Get.arguments['restaurant'];
    fetchOrdrProducts();
  }

  fetchOrdrProducts() {
    orderUseCae.fetchOrderProducts(order).then((value) {
      orderProducts.addAll(value);
      isProductsFetched.value = true;
    });
  }
}
