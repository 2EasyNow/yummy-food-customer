import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yummy_swipe_admin/pages/customers.dart';
import 'package:yummy_swipe_admin/pages/restaurants.dart';
import 'package:yummy_swipe_admin/pages/riders.dart';

import '../pages/home.dart';
import '../pages/settings.dart';

class NavigationController extends GetxController {
  final selectedIndex = 0.obs;

  List<Map<String, dynamic>> sidebar_options = [
    {
      'title': 'Home',
      'icon': Icons.home,
      'widget': HomePage(),
    },
    {
      'title': 'Restaurants',
      'icon': Icons.restaurant,
      'widget': RestaurantsPage(),
    },
    {'title': 'Customers', 'icon': Icons.people, 'widget': CustomersPage()},
    {'title': 'Riders', 'icon': Icons.motorcycle, 'widget': RidersPage()},
    {'title': 'Settings', 'icon': Icons.settings, 'widget': SettingsPage()},
  ];
}
