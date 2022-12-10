import 'package:get/get.dart';

import '../controllers/orders_list_controller.dart';

class OrdersListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrdersListController>(
      () => OrdersListController(),
    );
  }
}
