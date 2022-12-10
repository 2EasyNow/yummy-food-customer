import 'package:get/get.dart';

import '../controllers/restaurant_list_controller.dart';

class RestaurantListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RestaurantListController>(
      () => RestaurantListController(),
    );
  }
}
