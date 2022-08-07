import 'package:flutter/material.dart' hide Stack;
import 'package:get/get.dart';
import '../ui_models/drawer_navigation_item.dart';
import '../data/navigations.dart' as navigations;
import '../utils/utils.dart';

class NavigationController extends GetxController {
  final scaffoldState = GlobalKey<ScaffoldState>();
  var navigationStack = StackData<NavigationItem>();
  late List<NavigationItem> navigationItems = navigations.navigationItems;
  late final Rx<NavigationItem> selectedNavItem;
  // var selectedNavigationDestination = 0.obs;

  String title = '';
  Widget? leading;
  List<Widget> actions = [];

  @override
  onInit() {
    super.onInit();
    navigationItems.first.isSelected = true;
    selectedNavItem = navigationItems.first.obs;
  }

  onDrawerItemClicked(NavigationItem item) async {
    if (item.title == selectedNavItem.value.title) {
      return;
    }
    // Get.back();
    if (selectedNavItem.value.onClose != null) await selectedNavItem.value.onClose!();
    await Future.delayed(const Duration(milliseconds: 250));
    if (item.onTap != null || item.itemType == NavItemType.callAble) {
      item.onTap!();
    }
    if (item.itemType == NavItemType.viewBased) {
      navigationStack.push(selectedNavItem.value);
      for (NavigationItem navItem in navigationItems) {
        navItem.isSelected = navItem.title == item.title;
        if (navItem.title == item.title) {
          selectedNavItem.value = navItem;
        }
      }
      update();
    }
  }

  goToBackItem(NavigationItem item) async {
    if (selectedNavItem.value.onClose != null) await selectedNavItem.value.onClose!();

    if (item.itemType == NavItemType.viewBased) {
      for (NavigationItem drawerItem in navigationItems) {
        drawerItem.isSelected = drawerItem.title == item.title;
        if (drawerItem.title == item.title) {
          if (drawerItem.onTap != null) drawerItem.onTap!();
          selectedNavItem.value = drawerItem;
        }
      }
      update();
    }
  }

  updateAppBar() {}

  onBottomNavigationSelected(int value) async {
    await onDrawerItemClicked(navigationItems[value]);
    // selectedNavigationDestination.value = value;
  }
}
