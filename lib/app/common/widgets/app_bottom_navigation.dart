// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import '../../controllers/navigation_controller.dart';
// import 'package:sizer/sizer.dart';

// import '../theme/app_colors.dart';
// import '../theme/text_theme.dart';

// class AppBottomNavigation extends GetView<NavigationController> {
//   const AppBottomNavigation({Key? key, this.haveActionWidget = false, this.actionWidget}) : super(key: key);
//   final Widget? actionWidget;
//   final bool haveActionWidget;

//   List<Widget> getNavigationItems(context, selectedIndex) {
//     final colors = AppColors(context);

//     return controller.navigationItems
//         .asMap()
//         .map((key, item) {
//           final isSelected = key == selectedIndex;
//           return MapEntry(
//             key,
//             Expanded(
//               flex: 6,
//               child: Material(
//                 color: colors.backgroundVariant,
//                 child: InkWell(
//                   onTap: () => controller.onBottomNavigationSelected(key),
//                   child: AppNavigaitionBarItem(
//                     icon: isSelected ? item.svgActiveIconPath : item.svgIconPath,
//                     color: isSelected ? colors.primary : colors.onBackground,
//                     // selectedIcon: Icon(item.activeIcon, color: Colors.black),
//                     title: item.title,
//                   ),
//                 ),
//               ),
//             ),
//           );
//         })
//         .values
//         .toList();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//       () {
//         final selectedIndex = controller.navigationItems.indexOf(controller.selectedNavItem.value);
//         final items = getNavigationItems(context, selectedIndex);
//         if (haveActionWidget) {
//           items.insert(items.length ~/ 2, Expanded(flex: 9, child: actionWidget!));
//         }
//         return Container(
//           height: 80,
//           width: double.infinity,
//           decoration: BoxDecoration(
//             color: AppColors(context).backgroundVariant,
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: items,
//           ),
//         );
//       },
//     );

//     // return BottomBarCreative(
//     //   items: const [
//     //     TabItem<IconData>(
//     //       icon: Icons.home,
//     //       title: "Home",
//     //     ),
//     //     TabItem(
//     //       icon: Icons.home,
//     //       title: "Home",
//     //     ),
//     //   ],
//     //   backgroundColor: Colors.green.withOpacity(0.21),
//     //   color: const Color(0XFF7AC0FF),
//     //   colorSelected: const Color(0XFF0686F8),
//     //   indexSelected: 0,
//     //   isFloating: false,
//     //   onTap: (int index) {},
//     // );
//     //   return BottomBarCreative(
//     //     color: colors.onBackground,
//     //     backgroundColor: colors.isDark ? const Color(0xFF0B0B0B) : colors.grey100,
//     //     colorSelected: colors.primary,
//     //     indexSelected: controller.navigationItems.indexOf(controller.selectedNavItem.value),
//     //     onTap: controller.onBottomNavigationSelected,
//     //     isFloating: false,
//     //     backgroundSelected: Colors.red,
//     //     visitHighlight: 2,

//     //     highlightStyle: HighlightStyle(
//     //       sizeLarge: true,
//     //       background: colors.primary,
//     //       elevation: 0.0,
//     //     ),
//     // items: controller.navigationItems.map((item) {
//     //   return TabItem<IconData>(
//     //     icon: item.icon,
//     //     // selectedIcon: Icon(item.activeIcon, color: Colors.black),
//     //     title: item.title,
//     //   );
//     // }).toList(),
//     //   );
//     // });
//   }

//   // @override
//   // Widget build(BuildContext context) {
//   //   return Obx(() {
//   //     return NavigationBar(
//   //       selectedIndex: controller.navigationItems.indexOf(controller.selectedNavItem.value),
//   //       onDestinationSelected: controller.onBottomNavigationSelected,
//   //       destinations: controller.navigationItems.map((item) {
//   //         return NavigationDestination(
//   //           icon: Icon(item.icon),
//   //           selectedIcon: Icon(item.activeIcon, color: Colors.black),
//   //           label: item.title,
//   //         );
//   //       }).toList(),
//   //     );
//   //   });
//   // }

// }

// class AppNavigaitionBarItem extends StatelessWidget {
//   const AppNavigaitionBarItem({Key? key, required this.icon, required this.title, required this.color}) : super(key: key);
//   final String icon;
//   final String title;
//   final Color color;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 100.h,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           AnimatedSwitcher(
//             duration: const Duration(milliseconds: 100),
//             child: SvgPicture.asset(
//               icon,
//               key: Key(icon),
//               color: color,
//             ),
//           ),
//           Text(
//             title,
//             style: AppTextStyle(
//               fontSize: 8.sp,
//               color: color,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
