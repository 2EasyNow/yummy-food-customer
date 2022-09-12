import 'package:buildcondition/buildcondition.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../common/theme/app_colors.dart';
import '../../../common/theme/text_theme.dart';
import '../../../common/widgets/spacers.dart';
import '../../../core/controllers/customer.controller.dart';
import '../../../routes/app_pages.dart';
import '../controllers/on_boarding_controller.dart';


class OnBoardingView extends GetView<OnBoardingController> {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BuildCondition(
      condition: FirebaseAuth.instance.currentUser != null,
      builder: (context) {
        return FutureBuilder<bool>(
          future: Get.find<CustomerController>().hasCustomerDocCreated,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Material(
                child: Column(
                  children: [
                    SpinKitCircle(color: AppColors(context).primary),
                  ],
                ),
              );
            }
            if (snapshot.data!) {
              0.1.delay(() {
                Get.offAllNamed(Routes.HOME);
              });
              return const Material();
            } else {
              FirebaseAuth.instance.signOut().then((value) {
                Get.offAll(Routes.ON_BOARDING);
              });
              return Material(
                child: Column(
                  children: [
                    SpinKitCircle(color: AppColors(context).primary),
                  ],
                ),
              );
            }
          },
        );
      },
      fallback: (context) {
        return Scaffold(
          body: Column(
            children: <Widget>[
              Flexible(
                child: PageView(
                  onPageChanged: controller.onPageChange,
                  controller: controller.pageController,
                  children: <Widget>[
                    for (int i = 0; i < controller.totalPages; i++) _buildPage(i, context),
                  ],
                ),
              ),
              GetBuilder<OnBoardingController>(builder: (logic) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: _PageViewIndicators(
                        activeIndex: logic.currentPage,
                        totalPages: 2,
                        indicatorColor: AppColors(context).primary,
                      ),
                    ),
                    const VerticalSpacer(),
                    const _BackAndNextButtons(),
                    VerticalSpacer(space: 6.h),
                  ],
                );
              })
            ],
          ),
        );
      },
    );
  }

  _buildPage(int i, BuildContext context) {
    return _IntroductionPageView(
      imagePath: controller.screensData[i].lightImagePath,
      title: controller.screensData[i].title,
      content: controller.screensData[i].content,
    );
  }
}

class _BackAndNextButtons extends GetView<OnBoardingController> {
  const _BackAndNextButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        OutlinedButton(
          onPressed: controller.goToGettingStartedPage,
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.transparent,
            minimumSize: const Size(120, 60),
            foregroundColor: Colors.grey.shade600,
            side: BorderSide(
              color: Colors.grey.shade600,
              width: 2,
            ),
          ),
          child: Text(
            "SKIP",
            style: TextStyle(
              color: Colors.grey.shade700,
            ),
          ),
        ),
        GetBuilder<OnBoardingController>(builder: (logic) {
          var isLastPage = logic.currentPage == logic.totalPages - 1;
          return TextButton(
            onPressed: isLastPage ? logic.goToGettingStartedPage : logic.nextPage,
            style: TextButton.styleFrom(
              minimumSize: const Size(120, 60),
            ),
            child: isLastPage ? const Text("START") : const Text("NEXT"),
          );
        })
      ],
    ).paddingSymmetric(horizontal: 20);
  }
}

class _IntroductionPageView extends GetView<OnBoardingController> {
  const _IntroductionPageView({Key? key, required this.imagePath, required this.title, required this.content}) : super(key: key);

  final String imagePath;
  final String title, content;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Padding(
          //   padding: const EdgeInsets.only(top: 30.0, right: 30),
          //   child: InkWell(
          //     onTap: () {},
          //     child: Container(
          //       width: 80,
          //       height: 30,
          //       alignment: Alignment.center,
          //       decoration: BoxDecoration(
          //         color: AppColors(context).primary.withOpacity(0.3),
          //         borderRadius: BorderRadius.circular(9999),
          //       ),
          //       child: InkWell(
          //         onTap: controller.goToGettinStartedPage,
          //         child: Text(
          //           'Skip',
          //           style: AppTextStyle(
          //             fontSize: 12.sp,
          //             color: AppColors(context).primary,
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: SvgPicture.asset(
              imagePath,
              height: 50.h,
              alignment: Alignment.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20, top: 40),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: AppTextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 18.sp,
              ),
            ),
          ),
          const VerticalSpacer(),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: Text(
              content,
              textAlign: TextAlign.center,
              style: AppTextStyle(
                fontSize: 10.sp,
                color: AppColors(context).grey400,
              ),
            ),
          ),

          // Padding(
          //   padding: const EdgeInsetsDirectional.fromSTEB(20, 24, 20, 0),
          //   child: TextButton(
          //     onPressed: controller.goToGettinStartedPage,
          //     style: TextButton.styleFrom(
          //       minimumSize: Size(Get.width, 60),
          //       backgroundColor: context.theme.colorScheme.primary,
          //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          //     ),
          //     child: Text(
          //       'Get Started',
          //       style: AppTextStyle(
          //         color: context.theme.colorScheme.onPrimary,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

class _PageViewIndicators extends StatelessWidget {
  const _PageViewIndicators({Key? key, required this.activeIndex, required this.totalPages, required this.indicatorColor}) : super(key: key);
  final int activeIndex;
  final int totalPages;
  final Color indicatorColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < totalPages; i++)
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: 6,
            width: i == activeIndex ? 30 : 6,
            margin: const EdgeInsets.only(right: 5),
            decoration: BoxDecoration(
              color: indicatorColor,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
      ],
    );
  }
}
