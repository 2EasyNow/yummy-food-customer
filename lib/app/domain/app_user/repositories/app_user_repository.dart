import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../data/app_user/models/app_user.dart';

abstract class AppUserRepository {
  Future<AppUser?> getUser(String uid);
  Future<AppUser> createUser(AppUser user);
  Future<AppUser> updateUser(String uid, AppUser user);
  Future<AppUser?> getUserByPhoneNumber(String phoneNumber);

  Future<Address> addAddress(Address address);
  Future<List<Address>> getAddresses();
  Future<Address?> getAddress(String addressId);
  Future<void> deleteAddress(String addressId);

  // Cart
  Future<Cart> addItem(Cart item);
  Future<Cart> updateItem(Cart item);
  Future<void> removeItem(String id);
  Future<Cart?> getItem(String id);
  Future<List<Cart>> getAllItems();
  Stream<List<Cart>> getAllItemsStream();
  }
