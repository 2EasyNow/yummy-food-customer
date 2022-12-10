import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:intelligent_food_delivery/app/common/theme/app_colors.dart';
import 'package:intelligent_food_delivery/app/common/theme/text_theme.dart';
import 'package:intelligent_food_delivery/app/common/utils/firebase.dart';

import '../../../data/app_user/models/app_user.dart';
import '../../../data/food_item/models/food_item.dart';
import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Obx(() {
          if (controller.isProductDataFetched.isFalse) {
            return Center(
              child: SpinKitCircle(
                color: AppColors(context).primary,
              ),
            );
          }
          if (controller.cartUseCase.cartItems.value.isEmpty) {
            return const Center(
              child: Text('No items in cart'),
            );
          }
          return Stack(
            children: [
              Positioned.fill(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // vehicle icon at start and estmated time at end
                      Row(
                        children: [
                          const SizedBox(width: 16),
                          const Icon(Icons.local_shipping),
                          const Spacer(),
                          Text(
                            'Estimated time: ${controller.restaurantEstimatedDeliveryTime()} mins',
                            style: AppTextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 16),
                        ],
                      ),
                      const SizedBox(height: 16),
                      for (int i = 0; i < controller.cartUseCase.cartItems.value.length; i++)
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CartItemCard(
                              cartItem: controller.cartUseCase.cartItems.value[i],
                              key: ValueKey(
                                controller.cartUseCase.cartItems.value[i].id + controller.cartUseCase.cartItems.value[i].quantity.toString(),
                              ),
                            ),
                            if (i != controller.cartUseCase.cartItems.value.length - 1) const Divider(height: 0),
                          ],
                        ),
                      const SizedBox(height: 20),
                      // Sub Total
                      Row(
                        children: [
                          Text(
                            'Subtotal: ',
                            style: AppTextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            'Rs. ${controller.cartSubTotalPrice()}',
                            style: AppTextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ).paddingSymmetric(horizontal: 20),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            'Delivery Fee: ',
                            style: AppTextStyle(
                              fontSize: 12,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            "Rs. ${controller.deliveryFee}",
                            style: AppTextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ).paddingSymmetric(horizontal: 20),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Text(
                            'Platform Fee: ',
                            style: AppTextStyle(
                              fontSize: 12,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            "Rs. ${controller.platformFee}",
                            style: AppTextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ).paddingSymmetric(horizontal: 20),
                      const SizedBox(height: 120),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                height: 110,
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Total:'),
                          Text(
                            'Rs. ${controller.totalCartPrice}',
                            style: AppTextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      TextButton(
                        onPressed: () => controller.onConfirmOrder(context),
                        child: const Text('Confirm Order'),
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}

// cart item card
// which have the follwing features
// 1 - image
// 2 - name
// 3 - price
// 4 - quantityCounter (which is a custom widget)
// 5 - delete button

class CartItemCard extends GetWidget<CartController> {
  const CartItemCard({
    super.key,
    required this.cartItem,
  });

  final Cart cartItem;

  FoodItem get product => controller.allProducts.firstWhere((element) => element.id == cartItem.productId);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: GetBuilder<CartController>(
              id: product.id,
              builder: (_) {
                if (!controller.productsImageUrls.containsKey(product.id)) {
                  return const FadeShimmer(
                    height: 100,
                    radius: 10,
                    width: double.infinity,
                    fadeTheme: FadeTheme.light,
                  );
                }
                return ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    controller.productsImageUrls[product.id]!,
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: SizedBox(
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        product.name,
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: AppColors(context).error,
                        ),
                        onPressed: () {
                          controller.cartUseCase.deleteItem(item: cartItem);
                        },
                      )
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Text(
                        'Rs. ${(product.price * cartItem.quantity)}',
                        key: ValueKey(product.price * cartItem.quantity),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Spacer(),
                      QuantityCounter(
                        key: ValueKey(cartItem.quantity),
                        quantity: cartItem.quantity,
                        onIncrement: () async {
                          await controller.cartUseCase.incrementQuantity(item: cartItem);
                        },
                        onDecrement: () {
                          if (cartItem.quantity == 1) {
                            controller.cartUseCase.deleteItem(item: cartItem);
                          } else {
                            controller.cartUseCase.decrementQuantity(item: cartItem);
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class QuantityCounter extends StatelessWidget {
  const QuantityCounter({super.key, required this.quantity, required this.onIncrement, required this.onDecrement});
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(width: 12),
          Material(
            child: InkWell(
              onTap: onDecrement,
              child: const Icon(
                Icons.remove,
                size: 18,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Text(
            quantity.toString(),
            style: const TextStyle(
              fontSize: 13,
            ),
          ),
          const SizedBox(width: 16),
          Material(
            child: InkWell(
              onTap: onIncrement,
              child: const Icon(
                Icons.add,
                size: 18,
              ),
            ),
          ),
          const SizedBox(width: 12),
        ],
      ),
    );
  }
}
