import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intelligent_food_delivery/app/domain/app_settings/models/app_settings.dart';
import 'package:intelligent_food_delivery/app/domain/app_settings/usecase/app_setttings_use_case.dart';

import '../../../common/utils/maps.dart';
import '../../../data/restaurant/models/restaurant.dart';
import '../../app_user/use_cases/app_user_use_case.dart';
import '../repositories/restaurant_repository.dart';

class RestaurantUseCase {
  final RestaurantRepository _restaurantOwnerRepository;
  final allNearbyRestaurants = (<Restaurant>[]).obs;
  final nearbyRestaurantsDistanceMatrics = <String, MapDistanceMatric>{}.obs;
  StreamSubscription? _restaurantStream;
  RestaurantUseCase(this._restaurantOwnerRepository);

  Future<List<Restaurant>> getRestaurants() async {
    final settingsUseCase = Get.find<AppSettingsUseCase>();
    final userUseCase = Get.find<AppUserUseCase>();
    if (userUseCase.userSelectedAddress == null) {
      allNearbyRestaurants.clear();
      return [];
    }
    final userCoordinates = userUseCase.userSelectedAddress!.location;
    final geo = GeoFlutterFire();
    GeoFirePoint center = geo.point(
      latitude: userCoordinates.latitude,
      longitude: userCoordinates.longitude,
    );
    double radius = settingsUseCase.appSettings!.searchInKM.toDouble();
    print('Searching in $radius km radius');
    String field = 'coordinates';
    if (_restaurantStream != null) {
      await _restaurantStream!.cancel();
      allNearbyRestaurants.clear();
    }
    _restaurantStream = geo
        .collection(
          collectionRef: FirebaseFirestore.instance.collection('Restaurant'),
        )
        .within(
          center: center,
          radius: radius,
          field: field,
        )
        .asyncMap((event) {
      return event.map(
        (e) {
          return Restaurant.fromJson({'id': e.id, ...e.data() as dynamic});
        },
      ).toList();
    }).listen((event) {
      allNearbyRestaurants.addAll(event);
      addRestaurantsDistance(event, userCoordinates);
    });

    return await _restaurantOwnerRepository.getAllRestaurants();
  }

  addRestaurantsDistance(List<Restaurant> restaurants, LatLng destination) async {
    for (var restaurant in restaurants) {
      final distanceMatric = await GoogleMapsUtils.getDistanceAndTime(
        restaurant.coordinates,
        destination,
      );
      nearbyRestaurantsDistanceMatrics[restaurant.id] = distanceMatric;
    }
  }
}
