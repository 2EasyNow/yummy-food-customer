import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class GettingStartedController extends GetxController {
  goToLoginScreen() {
    Get.toNamed(Routes.LOGIN);
  }

  goToSignUpScreen() {
    Get.toNamed(Routes.SIGN_UP);
  }
}
