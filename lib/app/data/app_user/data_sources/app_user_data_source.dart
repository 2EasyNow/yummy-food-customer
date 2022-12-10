import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../models/app_user.dart';

abstract class AppUserDataSource {
  Future<void> addUser(AppUser user);
  Future<AppUser?> getUser(String uid);
  Future<AppUser?> getUserByPhoneNumber(String phone);
  Future<AppUser> updateUser(String uid, AppUser user);

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
