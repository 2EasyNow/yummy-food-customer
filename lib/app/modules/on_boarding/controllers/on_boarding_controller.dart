import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intelligent_food_delivery/app/domain/app_user/use_cases/app_user_use_case.dart';
import 'package:intelligent_food_delivery/app/routes/app_pages.dart';
import '../../../../assets/assets.gen.dart';
import '../models/on_boarding_page_model.dart';

class OnBoardingController extends GetxController {
  var currentPage = 0;

  Future<bool> get isUserRecordAdded async => Get.find<AppUserUseCase>().isUserRecordAdded();

  // final screensData = <IntroductionScreenModel>[];
  final screensData = <IntroductionScreenModel>[
    IntroductionScreenModel(
      "Choose your favorite",
      "Choose your favorite food of your choice by our app",
      Assets.svg.burger.path,
      // Assets.svg.darkManageTask.path,
    ),
    IntroductionScreenModel(
      "Tracking Order",
      "Real time tracking will keep you upto date about your order",
      Assets.svg.deliveryBoy.path,
      // Assets.svg.darkTaskList.path,
    ),
  ];

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
