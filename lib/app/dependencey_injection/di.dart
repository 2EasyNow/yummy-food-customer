import 'package:get/get.dart';
import 'package:intelligent_food_delivery/app/data/app_user/data_sources/app_user_data_source.dart';
import 'package:intelligent_food_delivery/app/data/app_user/data_sources/app_user_remote_data_source.dart';
import 'package:intelligent_food_delivery/app/data/app_user/repositories/app_user_repository_impl.dart';
import 'package:intelligent_food_delivery/app/domain/app_settings/usecase/app_setttings_use_case.dart';
import 'package:intelligent_food_delivery/app/domain/app_user/use_cases/app_user_use_case.dart';
import 'package:intelligent_food_delivery/app/domain/app_user/use_cases/cart_use_case.dart';

import '../common/theme/theme.dart';
import '../core/controllers/authentication.controller.dart';
import '../data/food_category/data_sources/food_category_data_source.dart';
import '../data/food_category/data_sources/food_category_remote_data_source.dart';
import '../data/food_category/repository/food_category_repository_impl.dart';
import '../data/food_item/data_sources/food_item_data_source.dart';
import '../data/food_item/data_sources/food_item_remote_data_source.dart';
import '../data/food_item/repository/food_item_repository_impl.dart';
import '../data/order/data_sources/food_order_data_source.dart';
import '../data/order/data_sources/food_order_remote_data_source.dart';
import '../data/order/repository/food_order_repository_impl.dart';
import '../data/restaurant/data_sources/restaurant_data_source.dart';
import '../data/restaurant/data_sources/restaurant_remote_data_source.dart';
import '../data/restaurant/repositories/restaurant_repository_impl.dart';
import '../domain/app_user/repositories/app_user_repository.dart';
import '../domain/food_category/repositories/food_category_repository.dart';
import '../domain/food_category/use_cases/food_category_use_case.dart';
import '../domain/food_item/repositories/food_item_repository.dart';
import '../domain/food_item/use_cases/food_item_use_case.dart';
import '../domain/order/repositories/order_repository.dart';
import '../domain/order/use_cases/order_use_case.dart';
import '../domain/restaurant/repositories/restaurant_repository.dart';
import '../domain/restaurant/use_cases/restaurant_use_case.dart';

class DependecyInjection {
  static void init() {
    Get.put<ThemeController>(ThemeController());
    Get.put<AuthenticationController>(AuthenticationController(), permanent: true);
    _setupUserDependency();
    Get.put<AppSettingsUseCase>(
      AppSettingsUseCase(),
      permanent: true,
    );
    _setupRestaurantDependency();
    _setupFoodCategoryDependency();
    _setupFoodItemDependency();
    _setupFoodOrderDependency();
  }
}

injectDependencies() {}

_setupUserDependency() {
  Get.put<AppUserDataSource>(AppUserRemoteDataSource(), permanent: true);
  Get.put<AppUserRepository>(AppUserRepositoryImpl(Get.find()), permanent: true);
  Get.put<AppUserUseCase>(AppUserUseCase(Get.find()), permanent: true);
  Get.put<CartUseCase>(CartUseCase(Get.find()), permanent: true);
}

_setupRestaurantDependency() {
  Get.put<RestaurantDataSource>(
    RestaurantRemoteDataSource(),
    permanent: true,
  );
  Get.put<RestaurantRepository>(
    RestaurantRepositoryImpl(Get.find()),
    permanent: true,
  );
  Get.put<RestaurantUseCase>(
    RestaurantUseCase(Get.find()),
    permanent: true,
  );
}

_setupFoodCategoryDependency() {
  Get.lazyPut<FoodCategoryDataSource>(
    () => FoodCategoryRemoteDataSource(),
    fenix: true,
  );
  Get.lazyPut<FoodCategoryRepository>(
    () => FoodCategoryRepositoryImpl(Get.find()),
    fenix: true,
  );
  Get.lazyPut<FoodCategoryUseCase>(
    () => FoodCategoryUseCase(Get.find()),
    fenix: true,
  );
}

_setupFoodItemDependency() {
  Get.lazyPut<FoodItemDataSource>(
    () => FoodItemRemoteDataSource(),
    fenix: true,
  );
  Get.lazyPut<FoodItemRepository>(
    () => FoodItemRepositoryImpl(Get.find()),
    fenix: true,
  );
  Get.lazyPut<FoodItemUseCase>(
    () => FoodItemUseCase(Get.find()),
    fenix: true,
  );
}

_setupFoodOrderDependency() {
  Get.lazyPut<FoodOrderDataSource>(
    () => FoodOrderRemoteDataSource(),
    fenix: true,
  );
  Get.lazyPut<FoodOrderRepository>(
    () => FoodOrderRepositoryImpl(Get.find()),
    fenix: true,
  );
  Get.lazyPut<FoodOrderUseCase>(
    () => FoodOrderUseCase(Get.find()),
    fenix: true,
  );
}
