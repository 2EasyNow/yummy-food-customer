import '../../theme/app_colors.dart';
import 'package:sizer/sizer.dart';
import '../../../../assets/assets.gen.dart';
import '../../global_widgets/spacers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/getting_started_controller.dart';
import '../../theme/text_theme.dart';

class GettingStartedPage extends GetView<GettingStartedController> {
  const GettingStartedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Assets.svg.foodWishes.svg(
                  width: 100.w,
                  height: 30.h,
                  fit: BoxFit.contain,
                ),
              ),
              const VerticalSpacer(),
              Text(
                'Let\'s Get Started',
                style: AppTextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const VerticalSpacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextButton(
                  onPressed: controller.goToLoginScreen,
                  style: TextButton.styleFrom(minimumSize: Size(Get.width, 60)),
                  child: const Text('Log In with Phone'),
                ),
              ),
              // const VerticalSpacer(),
              Row(
                children: [
                  Expanded(child: Divider(color: Colors.grey.shade600)),
                  const Text('  or  '),
                  Expanded(child: Divider(color: Colors.grey.shade600)),
                ],
              ).paddingSymmetric(horizontal: 20, vertical: 4),
              OutlinedButton(
                onPressed: controller.goToSignUpScreen,
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  minimumSize: Size(Get.width, 60),
                  primary: Colors.grey.shade600,
                  side: BorderSide(
                    color: Colors.grey.shade600,
                    width: 2,
                  ),
                  // shape: const RoundedRectangleBorder(
                  //   borderRadius: BorderRadius.horizontal(
                  //     right: Radius.circular(999),
                  //   ),
                  // ),
                ),
                child: Text(
                  "Sign Up with Phone",
                  style: TextStyle(
                    color: Colors.grey.shade700,
                  ),
                ),
              ).paddingSymmetric(horizontal: 20),
              VerticalSpacer(space: 1.5.h),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: AppTextStyle(
                    color: AppColors(context).onBackground,
                  ),
                  children: [
                    const TextSpan(text: 'By chosing either you are agreening to our'),
                    TextSpan(
                      text: ' Terms ',
                      style: AppTextStyle(
                        color: AppColors(context).primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const TextSpan(text: '&'),
                    TextSpan(
                      text: ' Privacy Policy ',
                      style: AppTextStyle(
                        color: AppColors(context).primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              // Padding(
              //   padding: const EdgeInsetsDirectional.fromSTEB(30, 25, 30, 0),
              //   child: Row(
              //     mainAxisSize: MainAxisSize.max,
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Text(
              //         'Don\'t have an account? ',
              //         textAlign: TextAlign.center,
              //         style: AppTextStyle(
              //           fontWeight: FontWeight.normal,
              //         ),
              //       ),
              //       GestureDetector(
              //         onTap: controller.goToSignUpScreen,
              //         child: Text(
              //           'Sign Up',
              //           style: AppTextStyle(color: context.theme.colorScheme.primary),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
