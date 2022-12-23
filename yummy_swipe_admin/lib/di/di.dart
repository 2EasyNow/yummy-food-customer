import 'package:get/get.dart';
import 'package:yummy_swipe_admin/controller/nav.controller.dart';

class DependencyInjection {
  static init() {
    Get.put(NavigationController(), permanent: true);
  }
}
