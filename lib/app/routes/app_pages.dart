import 'package:get/get.dart';

import 'package:intelligent_food_delivery/app/modules/cart/bindings/cart_binding.dart';
import 'package:intelligent_food_delivery/app/modules/cart/views/cart_view.dart';
import 'package:intelligent_food_delivery/app/modules/getting_started/bindings/getting_started_binding.dart';
import 'package:intelligent_food_delivery/app/modules/getting_started/views/getting_started_view.dart';
import 'package:intelligent_food_delivery/app/modules/home/bindings/home_binding.dart';
import 'package:intelligent_food_delivery/app/modules/home/views/home_view.dart';
import 'package:intelligent_food_delivery/app/modules/login/bindings/login_binding.dart';
import 'package:intelligent_food_delivery/app/modules/login/views/login_view.dart';
import 'package:intelligent_food_delivery/app/modules/on_boarding/bindings/on_boarding_binding.dart';
import 'package:intelligent_food_delivery/app/modules/on_boarding/views/on_boarding_view.dart';
import 'package:intelligent_food_delivery/app/modules/orders_list/bindings/orders_list_binding.dart';
import 'package:intelligent_food_delivery/app/modules/orders_list/views/orders_list_view.dart';
import 'package:intelligent_food_delivery/app/modules/orders_status_detail/bindings/orders_status_detail_binding.dart';
import 'package:intelligent_food_delivery/app/modules/orders_status_detail/views/orders_status_detail_view.dart';
import 'package:intelligent_food_delivery/app/modules/restaurant_list/bindings/restaurant_list_binding.dart';
import 'package:intelligent_food_delivery/app/modules/restaurant_list/views/restaurant_list_view.dart';
import 'package:intelligent_food_delivery/app/modules/search/bindings/search_binding.dart';
import 'package:intelligent_food_delivery/app/modules/search/views/search_view.dart';
import 'package:intelligent_food_delivery/app/modules/sign_up/bindings/sign_up_binding.dart';
import 'package:intelligent_food_delivery/app/modules/sign_up/views/sign_up_view.dart';
import 'package:intelligent_food_delivery/app/modules/splash/bindings/splash_binding.dart';
import 'package:intelligent_food_delivery/app/modules/splash/views/splash_view.dart';

import '../modules/restaurant/bindings/restaurant_binding.dart';
import '../modules/restaurant/views/restaurant_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.GETTING_STARTED,
      page: () => GettingStartedView(),
      binding: GettingStartedBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.ON_BOARDING,
      page: () => OnBoardingView(),
      binding: OnBoardingBinding(),
    ),
    GetPage(
      name: _Paths.CART,
      transition: Transition.rightToLeft,
      page: () => CartView(),
      binding: CartBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: _Paths.Restaurant,
      page: () => RestaurantView(),
      binding: RestaurantBinding(),
    ),
    GetPage(
      name: _Paths.RESTAURANT_LIST,
      page: () => RestaurantListView(),
      binding: RestaurantListBinding(),
    ),
    GetPage(
      name: _Paths.ORDERS_LIST,
      page: () => OrdersListView(),
      binding: OrdersListBinding(),
    ),
    GetPage(
      name: _Paths.ORDERS_STATUS_DETAIL,
      page: () => OrdersStatusDetailView(),
      binding: OrdersStatusDetailBinding(),
    ),
  ];
}
