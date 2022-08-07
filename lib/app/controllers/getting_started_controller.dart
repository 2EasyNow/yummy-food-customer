
import 'package:get/get.dart';

import '../routes/app_routes.dart';
class GettingStartedController extends GetxController {
  goToLoginScreen() {
    Get.toNamed(AppRoutes.LOGIN);
  }

  goToSignUpScreen() {
    Get.toNamed(AppRoutes.CREATE_ACCOUNT);
  }
}