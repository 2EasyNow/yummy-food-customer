import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intelligent_food_delivery/app/routes/app_pages.dart';
import '../models/on_boarding_page_model.dart';

class OnBoardingController extends GetxController {
  var currentPage = 0;

  final screensData = <IntroductionScreenModel>[];
  // final screensData = <IntroductionScreenModel>[
  //   IntroductionScreenModel(
  //     AppStrings.introductionPage1Title,
  //     AppStrings.introductionPage1Content,
  //     Assets.svg.burger.path,
  //     // Assets.svg.darkManageTask.path,
  //   ),
  //   IntroductionScreenModel(
  //     AppStrings.introductionPage2Title,
  //     AppStrings.introductionPage2Content,
  //     Assets.svg.deliveryBoy.path,
  //     // Assets.svg.darkTaskList.path,
  //   ),
  // ];

  // get total pages
  int get totalPages => screensData.length;

  final PageController pageController = PageController(initialPage: 0);

  nextPage() {
    pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
  }

  goToGettingStartedPage() {
    Get.offAllNamed(Routes.GETTING_STARTED);
  }

  @override
  onClose() {
    pageController.dispose();
  }

  onPageChange(int value) {
    currentPage = value;
    update();
  }
}
