import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../bindings/create_account_binding.dart';
import '../bindings/getting_started_binding.dart';
import '../bindings/home_binding.dart';
import '../bindings/login_binding.dart';
import '../bindings/on_boarding_binding.dart';
import '../bindings/profile_binding.dart';
import '../bindings/setting_binding.dart';
import '../bindings/splash_binding.dart';
import '../ui/pages/create_account_page/create_account_page.dart';
import '../ui/pages/getting_started_page/getting_started_page.dart';
import '../ui/pages/home_page/home_page.dart';
import '../ui/pages/login_page/login_page.dart';
import '../ui/pages/on_boarding_page/on_boarding_page.dart';
import '../ui/pages/profile_page/profile_page.dart';
import '../ui/pages/setting_page/setting_page.dart';
import '../ui/pages/splash_page/splash_page.dart';
import '../ui/pages/unknown_route_page/unknown_route_page.dart';
import 'app_routes.dart';

final _defaultTransition = Transition.native;

class AppPages {
  static final unknownRoutePage = GetPage(
    name: AppRoutes.UNKNOWN,
    page: () => UnknownRoutePage(),
    transition: _defaultTransition,
  );

  static final List<GetPage> pages = [
    unknownRoutePage,
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.SPLASH,
      page: () => SplashPage(),
      binding: SplashBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.PROFILE,
      page: () => ProfilePage(),
      binding: ProfileBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.SETTING,
      page: () => SettingPage(),
      binding: SettingBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.GETTING_STARTED,
      page: () => GettingStartedPage(),
      binding: GettingStartedBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.ON_BOARDING,
      page: () => OnBoardingPage(),
      binding: OnBoardingBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
      transition: _defaultTransition,
    ),
    GetPage(
      name: AppRoutes.CREATE_ACCOUNT,
      page: () => CreateAccountPage(),
      binding: CreateAccountBinding(),
      transition: _defaultTransition,
    ), 
];
}