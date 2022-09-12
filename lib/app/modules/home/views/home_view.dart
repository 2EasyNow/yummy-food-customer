import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../common/theme/app_colors.dart';
import '../../../common/theme/text_theme.dart';
import '../../../common/widgets/spacers.dart';
import '../../../core/controllers/authentication.controller.dart';
import '../../../core/controllers/customer.controller.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GetBuilder<CustomerController>(builder: (customerController) {
            return Column(
              children: [
                Text(
                  'Welcome',
                  style: AppTextStyle(
                    fontSize: 18.sp,
                    // fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  customerController.currentCustomer!.name,
                  style: AppTextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const VerticalSpacer(),
                TextButton(
                  onPressed: Get.find<AuthenticationController>().logOut,
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors(context).errorDark,
                  ),
                  child: Text(
                    'Logout',
                    style: AppTextStyle(
                      color: AppColors(context).onError,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ).paddingSymmetric(horizontal: 40),
              ],
            );
          }),
        ],
      ),
    );
  }
}
