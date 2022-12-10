import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intelligent_food_delivery/app/common/widgets/snackbars.dart';
import 'package:intelligent_food_delivery/app/core/exceptions/not_logged_in.dart';
import 'package:intelligent_food_delivery/app/core/exceptions/user_not_found.dart';
import 'package:intelligent_food_delivery/app/data/food_item/models/food_item.dart';
import 'package:intelligent_food_delivery/app/data/restaurant/models/restaurant.dart';
import 'package:location/location.dart';

import '../../../data/app_user/models/app_user.dart';
import '../../restaurant/use_cases/restaurant_use_case.dart';
import '../repositories/app_user_repository.dart';

class CartUseCase {
  final totalCartItems = 0.obs;
  final AppUserRepository _appUserRepository;
  StreamSubscription? _cartSubscription;
  final cartItems = Rx<List<Cart>>([]);
  CartUseCase(this._appUserRepository);

  Future<Cart> addItem({
    required FoodItem foodItem,
    required int quantity,
  }) {
    if (isItemExistInCart(foodItem.id)) {
      final item = cartItems.value.firstWhere((element) => element.productId == foodItem.id);
      return incrementQuantity(item: item, incrementNumber: quantity);
    }
    return _appUserRepository.addItem(
      Cart(
        restaurantId: foodItem.restaurantId,
        productId: foodItem.id,
        quantity: quantity,
        updatedAt: DateTime.now(),
        createdAt: DateTime.now(),
      ),
    );
  }

  // increment Quantity
  Future<Cart> incrementQuantity({required Cart item, int incrementNumber = 1}) {
    return _appUserRepository.updateItem(
      item.copyWith(
        quantity: item.quantity + incrementNumber,
        updatedAt: DateTime.now(),
      ),
    );
  }

  // decrement Quantity
  Future<Cart> decrementQuantity({required Cart item, int decrementNumber = 1}) {
    return _appUserRepository.updateItem(
      item.copyWith(
        quantity: item.quantity - decrementNumber,
        updatedAt: DateTime.now(),
      ),
    );
  }

  // delete item
  Future<void> deleteItem({
    required Cart item,
  }) {
    return _appUserRepository.removeItem(item.id);
  }

  // get all items
  refreshCartList() async {
    if (_cartSubscription != null) {
      await _cartSubscription!.cancel();
    }
    _cartSubscription = _appUserRepository.getAllItemsStream().listen((event) {
      cartItems.value.clear();
      cartItems.value.addAll(event);
      cartItems.trigger(event);

      totalCartItems.value = event.length;
    });
  }

  // clear cart
  Future<void> clearCart() async {
    final items = [...cartItems.value];
    for (var item in items) {
      await _appUserRepository.removeItem(item.id);
    }
  }

  // check if there is anothers restaurant item in cart
  bool canAddItemInCart(String restaurantId) {
    if (cartItems.value.isEmpty) {
      return true;
    }
    return cartItems.value[0].restaurantId == restaurantId;
  }

  // check if item already exist in cart
  bool isItemExistInCart(String productId) {
    return cartItems.value.any((element) => element.productId == productId);
  }
}
