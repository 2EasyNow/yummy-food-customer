import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yummy_swipe_admin/controller/nav.controller.dart';
import 'package:yummy_swipe_admin/pages/customers.dart';
import 'package:yummy_swipe_admin/pages/orders.dart';
import 'package:yummy_swipe_admin/pages/restaurants.dart';
import 'package:yummy_swipe_admin/pages/settings.dart';

import 'di/di.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // initialize the firebase App
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  DependencyInjection.init();
  // while (!Get.isRegistered<ThemeController>()) {}
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        primarySwatch: Colors.blue,
      ),
      home: const AdminLayout(),
    );
  }
}

class AdminLayout extends StatelessWidget {
  const AdminLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 300,
          height: double.infinity,
          child: SideBar(),
        ),
        VerticalDivider(),
        Expanded(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: MainPageContainer(),
            ),
          ),
        )
      ],
    );
  }
}

class SideBar extends GetView<NavigationController> {
  const SideBar({super.key});

  Widget navTile(title, icon, index) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () => controller.selectedIndex.value = index,
      selected: controller.selectedIndex.value == index,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: StreamBuilder<int>(
          stream: controller.selectedIndex.stream,
          builder: (context, snapshot) {
            return ListView.builder(
              itemCount: controller.sidebar_options.length,
              itemBuilder: (context, index) {
                // print(controller.sidebar_options[index]);
                // return Text(index.toString());
                return navTile(
                  controller.sidebar_options[index]['title'],
                  controller.sidebar_options[index]['icon'],
                  index,
                );
              },
            );
          }),
    );
  }
}

class MainPageContainer extends GetView<NavigationController> {
  const MainPageContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: StreamBuilder<int>(
          stream: controller.selectedIndex.stream,
          builder: (context, snapshot) {
            return IndexedStack(
              index: controller.selectedIndex.value,
              children: controller.sidebar_options.map((e) => e['widget'] as Widget).toList(),
            );
          }),
    );
  }
}
