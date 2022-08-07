import 'package:flutter/material.dart';

enum NavItemType {
  callAble,
  viewBased,
}

class NavigationItem {
  final String title;
  final String svgIconPath;
  final String svgActiveIconPath;
  final VoidCallback? onTap;
  final Future<bool> Function()? onClose;
  final Widget? widget;
  final NavItemType itemType;
  bool isSelected;
  bool showAppBar;

  NavigationItem(
    this.title, {
    this.itemType = NavItemType.viewBased,
    required this.svgIconPath,
    required this.svgActiveIconPath,
    this.isSelected = false,
    this.showAppBar = true,
    this.widget,
    this.onTap,
    this.onClose,
  });
}
