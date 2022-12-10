import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intelligent_food_delivery/app/common/utils/maps.dart';
import 'package:intelligent_food_delivery/app/common/widgets/snackbars.dart';
import 'package:intelligent_food_delivery/app/core/exceptions/not_logged_in.dart';
import 'package:intelligent_food_delivery/app/core/exceptions/user_not_found.dart';
import 'package:intelligent_food_delivery/app/data/restaurant/models/restaurant.dart';
import 'package:intelligent_food_delivery/app/domain/app_user/use_cases/cart_use_case.dart';
import 'package:location/location.dart';

import '../../../data/app_user/models/app_user.dart';
import '../../restaurant/use_cases/restaurant_use_case.dart';
import '../repositories/app_user_repository.dart';

class AppUserUseCase {
  AppUser? _currentUser;
  final Rx<Address?> _userSelectedAddress = Rx(null);
  final AppUserRepository _appUserRepository;

  AppUserUseCase(this._appUserRepository) {
    onUserAddressChange.listen((event) {
      Get.find<RestaurantUseCase>().getRestaurants();
    });
  }

  AppUser? get currentUser => _currentUser;
  set currentUser(AppUser? user) {
    _currentUser = user;
    addFCMTokenfIfNotExist();
    Get.find<CartUseCase>().refreshCartList();
    if (user!.selectedAddressId == 'current') {
      Location.instance.hasPermission().then((value) async {
        PermissionStatus? secondCheckStatus;
        if (value == PermissionStatus.denied) {
          secondCheckStatus = await Location.instance.requestPermission();
        }
        if (secondCheckStatus != null && secondCheckStatus == PermissionStatus.denied) {
          showAppSnackBar('Location Permission', "Location Permission is required for the app funcationality");
          return;
        }
        LocationData locationData = await Location.instance.getLocation();
        final latlng = LatLng(locationData.latitude!, locationData.longitude!);
        final addressData = await getAddressFromCoordinates(latlng);
        _userSelectedAddress.value = Address(
          id: 'current',
          address: addressData['address']!,
          city: addressData['city']!,
          location: latlng,
          noteForRider: '',
          label: AddressLabel.other,
        );
      });
    } else {
      getAddress(user.selectedAddressId).then((value) {
        if (value == null) {
          updateDeliveryAddress('current');
        } else {
          _userSelectedAddress.value = value;
        }
      });
    }
  }

  Address? get userSelectedAddress => _userSelectedAddress.value;
  Stream<Address?> get onUserAddressChange => _userSelectedAddress.stream;

  Future<AppUser> getCurrentLoggedInUser() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) throw NotLoggedInException('User not logged in');

    currentUser = await _appUserRepository.getUser(uid);
    if (currentUser == null) throw UserNotFoundException('User record not found');

    return currentUser!;
  }

  Future<AppUser> createUser({
    required String name,
    required String phone,
  }) async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) throw NotLoggedInException('User not logged in');

    final user = AppUser(
      name: name,
      phone: phone,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
    currentUser = user;
    return await _appUserRepository.createUser(user);
  }

  // check if currentUser Record is added or not in FireStore if it is logged in
  Future<bool> isUserRecordAdded() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) throw NotLoggedInException('User not logged in');

    final user = await _appUserRepository.getUser(uid);
    currentUser = user;
    return user != null;
  }

  Future<AppUser> updateUser({
    required String name,
    required String phone,
    required String selectedAddressId,
  }) async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) throw NotLoggedInException('User not logged in');

    final user = await _appUserRepository.getUser(uid);
    if (user == null) throw UserNotFoundException('User record not found');

    final updatedUser = user.copyWith(
      name: name,
      phone: phone,
      selectedAddressId: selectedAddressId,
      updatedAt: DateTime.now(),
    );
    currentUser = updatedUser;
    return await _appUserRepository.updateUser(uid, updatedUser);
  }

  // check if someone has already registered using the phone number or not
  Future<bool> isUserRegistered(String phoneNumber) async {
    final user = await _appUserRepository.getUserByPhoneNumber(phoneNumber);
    return user != null;
  }

  Future<Map<String, String>> getAddressFromCoordinates(LatLng coordinates) {
    return GoogleMapsUtils.getAddressFromLatLng(coordinates);
  }

  Future<Address> addAddress({
    required LatLng location,
    required String address,
    required String city,
    required String note,
    required AddressLabel label,
  }) {
    final addr = Address(
      location: location,
      address: address,
      city: city,
      noteForRider: note,
      label: label,
    );
    return _appUserRepository.addAddress(addr);
  }

  Future<List<Address>> getAddresses() {
    return _appUserRepository.getAddresses();
  }

  Future<Address?> getAddress(String addressId) {
    return _appUserRepository.getAddress(addressId);
  }

  Future<void> deleteAddress(String addressId) {
    return _appUserRepository.deleteAddress(addressId);
  }

  Future<AppUser> updateDeliveryAddress(String value) async {
    final updatedUser = currentUser!.copyWith(selectedAddressId: value);
    currentUser = await _appUserRepository.updateUser(currentUser!.id, updatedUser);
    return currentUser!;
  }

  addFCMTokenfIfNotExist() async {
    final token = await FirebaseMessaging.instance.getToken();
    if (token == null) return;
    if (!currentUser!.fcmTokens.contains(token)) {
      addFCMToken(token);
    }
  }

  Future<AppUser> addFCMToken(String token) async {
    final updatedUser = currentUser!.copyWith(fcmTokens: [...currentUser!.fcmTokens, token]);
    currentUser = await _appUserRepository.updateUser(currentUser!.id, updatedUser);
    return currentUser!;
  }
}
