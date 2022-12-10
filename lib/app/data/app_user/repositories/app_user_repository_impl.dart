import 'package:google_maps_flutter_platform_interface/src/types/location.dart';
import 'package:intelligent_food_delivery/app/data/app_user/data_sources/app_user_data_source.dart';
import 'package:intelligent_food_delivery/app/data/app_user/models/app_user.dart';

import '../../../domain/app_user/repositories/app_user_repository.dart';

class AppUserRepositoryImpl implements AppUserRepository {
  final AppUserDataSource _dataSource;

  AppUserRepositoryImpl(this._dataSource);

  @override
  Future<AppUser?> getUser(String uid) async {
    return await _dataSource.getUser(uid);
  }

  @override
  Future<AppUser> createUser(AppUser user) async {
    await _dataSource.addUser(user);
    return user;
  }

  @override
  Future<AppUser> updateUser(String uid, AppUser user) {
    return _dataSource.updateUser(uid, user);
  }

  @override
  Future<AppUser?> getUserByPhoneNumber(String phoneNumber) async {
    return await _dataSource.getUserByPhoneNumber(phoneNumber);
  }


  @override
  Future<Address> addAddress(Address address) {
    return _dataSource.addAddress(address);
  }

  @override
  Future<void> deleteAddress(String addressId) {
    return _dataSource.deleteAddress(addressId);
  }

  @override
  Future<Address?> getAddress(String addressId) {
    return _dataSource.getAddress(addressId);
  }

  @override
  Future<List<Address>> getAddresses() {
    return _dataSource.getAddresses();
  }

  @override
  Future<Cart> addItem(Cart item) {
    return _dataSource.addItem(item);
  }

  @override
  Future<List<Cart>> getAllItems() {
    return _dataSource.getAllItems();
  }

  @override
  Future<Cart?> getItem(String id) {
    return _dataSource.getItem(id);
  }

  @override
  Future<void> removeItem(String id) {
    return _dataSource.removeItem(id);
  }

  @override
  Future<Cart> updateItem(Cart item) {
    return _dataSource.updateItem(item);
  }
  
  @override
  Stream<List<Cart>> getAllItemsStream() {
    return _dataSource.getAllItemsStream();
  }
}
