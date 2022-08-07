
import 'package:get/get.dart';

import '../controllers/on_boarding_controller.dart';


class OnBoardingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnBoardingController>(() => OnBoardingController());
        // Get.put<OnBoardingController>(OnBoardingController());
  }
}