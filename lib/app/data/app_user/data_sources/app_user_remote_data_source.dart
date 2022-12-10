import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intelligent_food_delivery/app/data/app_user/data_sources/app_user_data_source.dart';
import 'package:intelligent_food_delivery/app/data/app_user/models/app_user.dart';

import '../../../../secrets.dart';

class AppUserRemoteDataSource implements AppUserDataSource {
  @override
  Future<void> addUser(AppUser user) async {
    await customerRef.doc(FirebaseAuth.instance.currentUser!.uid).set(user);
  }

  @override
  Future<AppUser?> getUser(String uid) async {
    final user = await customerRef.doc(uid).get();
    return user.data;
  }

  @override
  Future<AppUser?> getUserByPhoneNumber(String phone) async {
    final user = await customerRef.wherePhone(isEqualTo: phone).get();
    return user.docs.isNotEmpty ? user.docs.first.data : null;
  }

  @override
  Future<AppUser> updateUser(String uid, AppUser user) async {
    await customerRef.doc(uid).set(user);
    return user;
  }
  
  @override
  Future<Address> addAddress(Address address) async {
    final ref = await customerRef.address.add(address);
    return address.copyWith(id: ref.id);
  }

  @override
  Future<void> deleteAddress(String addressId) {
    return customerRef.address.doc(addressId).delete();
  }

  @override
  Future<List<Address>> getAddresses() async {
    final res = await customerRef.address.get();
    return res.docs.map((e) => e.data).toList();
  }

  @override
  Future<Address?> getAddress(String addressId) async {
    final res = await customerRef.address.doc(addressId).get();
    return res.data;
  }

  @override
  Future<Cart> addItem(Cart item) async {
    final itemRef = await customerRef.cart.add(item);
    return item.copyWith(id: itemRef.id);
  }

  @override
  Future<List<Cart>> getAllItems() async {
    final res = await customerRef.cart.get();
    return res.docs.map((e) => e.data).toList();
  }

  @override
  Stream<List<Cart>> getAllItemsStream() {
    var toCartTransformer = StreamTransformer<CartQuerySnapshot, List<Cart>>.fromHandlers(
      handleData: (data, sink) {
        sink.add(data.docs.map((e) => e.data).toList());
      },
    );
    return customerRef.cart.snapshots().transform(toCartTransformer);
  }

  @override
  Future<Cart?> getItem(String id) async {
    final res = await customerRef.cart.doc(id).get();
    return res.data;
  }

  @override
  Future<void> removeItem(String id) async {
    await customerRef.cart.doc(id).delete();
  }

  @override
  Future<Cart> updateItem(Cart item) async {
    await customerRef.cart.doc(item.id).set(item);
    return item;
  }
}
