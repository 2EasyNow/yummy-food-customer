import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../common/constants/constants.dart';
import '../../../common/theme/app_colors.dart';
import '../../../common/theme/text_theme.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            FontAwesomeIcons.burger,
            size: 30.w,
            color: AppColors(context).primary,
          ),
          Text(
            AppInformation.title,
            style: AppTextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 32.sp,
              letterSpacing: 0.4,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
