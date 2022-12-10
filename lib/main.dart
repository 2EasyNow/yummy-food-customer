import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intelligent_food_delivery/app/core/services/fcm.service.dart';
import 'package:intelligent_food_delivery/firebase_options.dart';
import 'package:sizer/sizer.dart';

import 'app/common/constants/constants.dart';
import 'app/common/theme/theme.dart';
import 'app/dependencey_injection/di.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  // initialize the firebase App
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final fcmService = await Get.putAsync<FCMService>(() => FCMService().init(), permanent: true);
  await fcmService.requestPermissions();
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
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
