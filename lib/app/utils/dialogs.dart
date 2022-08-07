import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../ui/global_widgets/spacers.dart';
import '../ui/theme/app_colors.dart';
import '../ui/theme/text_theme.dart';

showAppDialog(
  context, {
  required String title,
  required Widget icon,
  required Widget body,
  bool barrierDismissible = true,
  bool isCancelable = true,
}) {
  Get.dialog(
    Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Positioned(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors(context).isDark ? AppColors(context).grey900 : AppColors(context).grey200,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: AppColors(context).isDark
                          ? AppColors(context).grey800
                          : AppColors(context).grey400.withOpacity(0.5),
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(16),
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: icon,
                    ),
                  ),
                  Text(
                    title,
                    style: AppTextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp,
                    ),
                  ),
                  const VerticalSpacer(),
                  body,
                ],
              ),
            ),
          ),
          if (isCancelable)
            Positioned(
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors(context).error,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                  ),
                ),
                child: InkWell(
                  onTap: Get.back,
                  child: const SizedBox(
                    height: 30,
                    width: 30,
                    child: Icon(
                      FontAwesomeIcons.xmark,
                      size: 16,
                    ),
                  ),
                ),
              ),
            )
        ],
      ),
    ),
    barrierDismissible: barrierDismissible,
  );
}

showLoadingDialog(
  BuildContext context, {
  required String title,
  bool barrierDismissible = true,
  bool isCancelable = true,
}) {
  Get.dialog(
    Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Positioned(
            child: Container(
              height: 200,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors(context).isDark ? AppColors(context).grey900 : AppColors(context).grey200,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: AppTextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp,
                    ),
                  ),
                  const VerticalSpacer(),
                  Expanded(
                    child: SizedBox(
                      child: SpinKitCircle(
                        color: AppColors(context).onBackground,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          if (isCancelable)
            Positioned(
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors(context).error,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                  ),
                ),
                child: InkWell(
                  onTap: Get.back,
                  child: const SizedBox(
                    height: 30,
                    width: 30,
                    child: Icon(
                      FontAwesomeIcons.xmark,
                      size: 16,
                    ),
                  ),
                ),
              ),
            )
        ],
      ),
    ),
    barrierDismissible: barrierDismissible,
  );
}
