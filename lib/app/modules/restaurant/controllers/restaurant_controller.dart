import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';
import 'package:intelligent_food_delivery/app/common/widgets/snackbars.dart';
import 'package:intelligent_food_delivery/app/data/food_category/models/food_category.dart';
import 'package:intelligent_food_delivery/app/data/food_item/models/food_item.dart';

import '../../../data/restaurant/models/restaurant.dart';
import '../../../domain/app_user/use_cases/cart_use_case.dart';
import '../../../domain/food_category/use_cases/food_category_use_case.dart';
import '../../../domain/food_item/use_cases/food_item_use_case.dart';

class MyHeader {
  final int index;
  final bool visbile;

  MyHeader(this.index, this.visbile);
}

class RestaurantController extends GetxController {
  late final Restaurant restaurant;
  late final String? initialImageUrl;

  final foodItemsUseCase = Get.find<FoodItemUseCase>();
  final foodCategoriesUseCase = Get.find<FoodCategoryUseCase>();

  final List<FoodItem> unGroupedFoodItems = [];
  final List<FoodCategory> foodCategories = [];
  final Map<String, List<FoodItem>> groupedFoodItems = {};

  bool isCategoriesFetched = false;
  bool isFoodItemsFetched = false;
  bool isItemsGrouped = false;

  List<double> itemsHeaderOffsetList = [];

  Rx<MyHeader?> currentHeader = Rx(null);

  final globalOffsetValue = 0.0.obs;

  final scrollingDown = false.obs;

  final valueScroll = 0.0.obs;

  final isCategoriesTabsVisible = false.obs;

  late ScrollController globalScrollController;

  late ScrollController categoriesTabsScrollController;

  @override
  void onInit() {
    globalScrollController = ScrollController()
      ..addListener(() {
        globalOffsetValue.value = globalScrollController.offset;
      });
    categoriesTabsScrollController = ScrollController();
    super.onInit();
    restaurant = Get.arguments['restaurant'] as Restaurant;
    initialImageUrl = Get.arguments['imageDownloadUrl'] as String?;
    print(restaurant.toJson());
    getAllCategories();
    getAllFoodItems();
  }

  getAllCategories() async {
    foodCategories.clear();
    foodCategories.addAll(await foodCategoriesUseCase.getAllRestaurantCategories(restaurantOwnerId: restaurant.id));
    print(foodCategories.length);
    isCategoriesFetched = true;
    itemsHeaderOffsetList = List.generate(foodCategories.length, (index) => 0.0);
    if (isFoodItemsFetched) {
      groupFoodItemsByCategory();
      currentHeader.stream.listen(onCurrentHeaderChange);
      isCategoriesTabsVisible.stream.listen((visible) {
        if (visible) {
          currentHeader.value = MyHeader(0, false);
        }
      });
    }
    update();
  }

  getAllFoodItems() async {
    unGroupedFoodItems.clear();
    unGroupedFoodItems.addAll(await foodItemsUseCase.getAllFoodItems(restaurantOwnerId: restaurant.id));
    isFoodItemsFetched = true;
    if (isCategoriesFetched) {
      groupFoodItemsByCategory();
    }
    update();
  }

  onCurrentHeaderChange(MyHeader? header) {
    if (isCategoriesTabsVisible.value) {
      for (int i = 0; i < foodCategories.length; i++) {
        if (currentHeader.value?.index == i && currentHeader.value!.visbile) {
          categoriesTabsScrollController.animateTo(
            itemsHeaderOffsetList[i] - 16,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
      }
    }
  }

  // groupFoodItems
  groupFoodItemsByCategory() {
    groupedFoodItems.clear();
    groupedFoodItems.addAll(groupBy<FoodItem, String>(
      unGroupedFoodItems,
      (FoodItem item) => foodCategories.firstWhere((element) => element.id == item.categories.first).name,
    ));
    isItemsGrouped = true;
    update();
  }

  updateCategoryTabHeader(int index, bool visible, [int? lastIndex]) {
    final header = currentHeader.value;
    final headerIndex = header?.index ?? index;
    final headerVisible = header?.visbile ?? visible;

    if (headerIndex != index || lastIndex != null || headerVisible == visible) {
      Future.microtask(() {
        if (!visible && lastIndex != null) {
          currentHeader.value = MyHeader(lastIndex, true);
        } else {
          currentHeader.value = MyHeader(index, visible);
        }
      });
    }
  }

  @override
  void onClose() {
    super.onClose();
    globalScrollController.dispose();
    categoriesTabsScrollController.dispose();
  }

  void addToCart(context, FoodItem item, int quantity) async {
    final cartUseCase = Get.find<CartUseCase>();
    if (cartUseCase.canAddItemInCart(item.restaurantId)) {
      await cartUseCase.addItem(foodItem: item, quantity: quantity);
      showSuccessSnackbar('Add to Cart', 'Item added in cart');
    } else {
      0.1.delay().then(
            (value) => Get.dialog(
              _RemovePreviousItemsDialog(
                onRemove: () async {
                  await cartUseCase.clearCart();
                  cartUseCase.addItem(foodItem: item, quantity: quantity);
                  Get.back();
                  showSuccessSnackbar('Add to Cart', 'Item added in cart');
                },
              ),
            ),
          );
    }
  }
}

class _RemovePreviousItemsDialog extends StatelessWidget {
  const _RemovePreviousItemsDialog({required this.onRemove});
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 16),
          const Text(
            'Remove previous items',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'You can add items from only one restaurant at a time. Do you want to remove previous items?',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text('Cancel'),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TextButton(
                  onPressed: onRemove,
                  child: const Text('Remove'),
                ),
              ),
            ],
          ),
        ],
      ).paddingAll(20),
    );
  }
}
