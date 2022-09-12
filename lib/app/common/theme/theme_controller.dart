import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:get/get.dart';
import 'theme.dart';

class ThemeController extends GetxController {
  final lightColors = LightThemeColors();

  @override
  onInit() async {
    super.onInit();
    var color = lightColors.background;
    await FlutterStatusbarcolor.setNavigationBarColor(lightColors.backgroundVariant);
    await FlutterStatusbarcolor.setStatusBarColor(color);
    await FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
    await FlutterStatusbarcolor.setNavigationBarWhiteForeground(false);
  }
}
