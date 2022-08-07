import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../ui/global_widgets/spacers.dart';
import '../ui/theme/app_colors.dart';
import '../ui/theme/text_theme.dart';

showAppGeneralBottomSheet(
  BuildContext context, {
  required String title,
  required Widget body,
  double? height,
  Widget? icon,
}) {
  final colors = AppColors(context);
  Get.bottomSheet(
    Container(
      height: height,
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: colors.background,
        borderRadius: const BorderRadius.vertical(
          top: Radius.elliptical(200, 50),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BuildCondition(
                condition: icon != null,
                builder: (context) {
                  return Wrap(
                    children: [
                      SizedBox(
                        height: 20,
                        child: icon!,
                      ),
                      const HorizontalSpacer(),
                    ],
                  );
                },
                fallback: (context) {
                  return const SizedBox();
                },
              ),
              Text(
                title,
                style: AppTextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp,
                ),
              ),
            ],
          ),
          const VerticalSpacer(),
          body,
        ],
      ).paddingOnly(top: 12),
    ),
  );
}

showLoadingBottomSheet(
  BuildContext context, {
  required String title,
  bool isDismissible = true,
  bool enableDrag = true,
}) {
  Get.bottomSheet(
    WillPopScope(
      onWillPop: () => Future.value(false),
      child: Material(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.elliptical(200, 30),
          ),
        ),
        child: SizedBox(
          height: 200,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: AppTextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: SizedBox(
                  child: SpinKitCircle(
                    color: AppColors(context).primary,
                  ),
                ),
              )
            ],
          ).paddingAll(20),
        ),
      ),
    ),
    isDismissible: isDismissible,
    enableDrag: enableDrag,
  );
}
