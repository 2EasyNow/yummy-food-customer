import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';

import 'app/common/constants/constants.dart';
import 'app/common/theme/theme.dart';
import 'app/common/theme/theme_controller.dart';
import 'app/core/controllers/authentication.controller.dart';
import 'app/core/controllers/customer.controller.dart';
import 'app/routes/app_pages.dart';

class DependecyInjection {
  static void init() {
    Get.put<ThemeController>(ThemeController());
    Get.put<AuthenticationController>(AuthenticationController(), permanent: true);
    Get.put<CustomerController>(CustomerController(), permanent: true);
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  // initialize the firebase App
  await Firebase.initializeApp();
  DependecyInjection.init();
  while (!Get.isRegistered<ThemeController>()) {}

  runApp(
    Sizer(
      builder: (context, orientation, deviceType) {
        return const MyApp();
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppInformation.title,
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      themeMode: ThemeMode.light,
      // translations: Translation(),
      locale: const Locale('en'),
      fallbackLocale: const Locale('en'),
      initialRoute: Routes.SPLASH,
      // unknownRoute: AppPages.unknownRoutePage,
      getPages: AppPages.routes,
    );
  }
}
