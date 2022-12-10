import 'package:get/get.dart';
import 'package:intelligent_food_delivery/app/common/utils/firebase.dart';
import 'package:intelligent_food_delivery/app/common/widgets/dialogs.dart';
import 'package:intelligent_food_delivery/app/common/widgets/snackbars.dart';
import 'package:intelligent_food_delivery/app/data/restaurant/models/restaurant.dart';
import 'package:intelligent_food_delivery/app/domain/app_settings/models/app_settings.dart';
import 'package:intelligent_food_delivery/app/domain/app_settings/usecase/app_setttings_use_case.dart';
import 'package:intelligent_food_delivery/app/domain/food_item/use_cases/food_item_use_case.dart';
import 'package:intelligent_food_delivery/app/domain/order/use_cases/order_use_case.dart';

import '../../../data/food_item/models/food_item.dart';
import '../../../domain/app_user/use_cases/cart_use_case.dart';
import '../../../domain/restaurant/use_cases/restaurant_use_case.dart';

class CartController extends GetxController {
  final cartUseCase = Get.find<CartUseCase>();
  final settingsUseCase = Get.find<AppSettingsUseCase>();
  final foodItemsUseCase = Get.find<FoodItemUseCase>();
  List<FoodItem> allProducts = [];
  Map<String, String> productsImageUrls = {};
  final isProductDataFetched = false.obs;

  int get platformFee => settingsUseCase.appSettings!.platformFee;
  double get deliveryFee {
    final costByDistance = settingsUseCase.appSettings!.deliveryCost['perKM']! * restaurantDistance();
    final minDeliveryCost = settingsUseCase.appSettings!.deliveryCost['min']!;
    if (minDeliveryCost < costByDistance) {
      return costByDistance;
    }
    return minDeliveryCost.toDouble();
  }

  Restaurant get restaurant {
    final restaurantUseCase = Get.find<RestaurantUseCase>();
    final restaurantId = cartUseCase.cartItems.value.first.restaurantId;
    return restaurantUseCase.allNearbyRestaurants.firstWhere((element) => element.id == restaurantId);
  }

  @override
  void onInit() {
    super.onInit();
    fetchItemsData();
  }

  fetchItemsData() async {
    allProducts = await Get.find<FoodItemUseCase>().getItemsByIds(
      cartUseCase.cartItems.value.map((data) => data.productId).toList(),
    );
    isProductDataFetched.value = true;
    for (var element in allProducts) {
      productsImageUrls[element.id] = await FirebaseUtils.fileUrlFromFirebaseStorage(element.imagePath);
      update([element.id]);
    }
  }

  FoodItem getProduct(productId) {
    return allProducts.firstWhere((element) => element.id == productId);
  }

  int cartSubTotalPrice() {
    return cartUseCase.cartItems.value.map((e) => e.quantity * getProduct(e.productId).price).reduce(
          (value, element) => value + element,
        );
  }

  int get totalCartPrice => (cartSubTotalPrice() + deliveryFee + platformFee).toInt();

  int restaurantEstimatedDeliveryTime() {
    final restaurantUseCase = Get.find<RestaurantUseCase>();
    final restaurantId = cartUseCase.cartItems.value.first.restaurantId;
    return restaurantUseCase.nearbyRestaurantsDistanceMatrics[restaurantId]!.mins + restaurant.averageTimeToCompleteOrder;
  }

  double restaurantDistance() {
    final restaurantUseCase = Get.find<RestaurantUseCase>();
    final restaurantId = cartUseCase.cartItems.value.first.restaurantId;
    return restaurantUseCase.nearbyRestaurantsDistanceMatrics[restaurantId]!.distanceInMeters / 1000;
  }

  void onConfirmOrder(context) async {
    final orderUseCase = Get.find<FoodOrderUseCase>();
    showLoadingDialog(
      context,
      title: "Placing Order",
    );
    await orderUseCase.submitOrder(
      restaurant,
      cartUseCase.cartItems.value,
      allProducts,
      deliveryFee.toInt(),
      platformFee,
      cartSubTotalPrice(),
    );
    if (Get.isDialogOpen!) {
      Get.back();
    }
    showAppSnackBar('Order', "Order Placed Successfully");
    cartUseCase.clearCart();
  }
}
