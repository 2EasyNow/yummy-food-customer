import 'package:get/get.dart';

import '../controllers/orders_status_detail_controller.dart';

class OrdersStatusDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrdersStatusDetailController>(
      () => OrdersStatusDetailController(),
    );
  }
}
