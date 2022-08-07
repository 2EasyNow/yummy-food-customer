import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intelligent_food_delivery/app/controllers/core/authentication.controller.dart';
import 'package:intelligent_food_delivery/app/controllers/core/customer.controller.dart';
import 'package:intelligent_food_delivery/app/ui/global_widgets/global_widgets.dart';
import 'package:intelligent_food_delivery/app/ui/theme/app_colors.dart';
import 'package:intelligent_food_delivery/app/ui/theme/text_theme.dart';
import 'package:sizer/sizer.dart';
import '../../../controllers/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);
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
