import 'package:get/get.dart';
import 'package:flutter/material.dart';

showErrorSnackbar(title, msg) {
  Get.snackbar(
    title,
    msg,
    icon: const Icon(
      Icons.error,
      color: Colors.white,
    ),
    backgroundColor: Colors.red,
    colorText: Colors.white,
    snackPosition: SnackPosition.TOP,
    duration: const Duration(seconds: 3),
  );
}

showSuccessSnackbar(title, message) {
  Get.snackbar(
    title,
    message,
    icon: const Icon(
      Icons.check,
      color: Colors.white,
    ),
    backgroundColor: Colors.green,
    colorText: Colors.white,
    snackPosition: SnackPosition.TOP,
    duration: const Duration(seconds: 2),
  );
}

showWarningSnackbar(title, message) {
  Get.snackbar(
    title,
    message,
    icon: const Icon(
      Icons.warning,
      color: Colors.white,
    ),
    backgroundColor: Colors.orange,
    colorText: Colors.white,
    snackPosition: SnackPosition.TOP,
    duration: const Duration(seconds: 2),
  );
}

showAppSnackBar(String title, String message, {BuildContext? context, IconData? icon, int? duration, SnackPosition position = SnackPosition.TOP}) {
  context ??= Get.context!;
  duration ??= 3;
  Get.snackbar(
    title,
    message,
    backgroundColor: context.theme.colorScheme.inverseSurface,
    colorText: context.theme.colorScheme.onInverseSurface,
    margin: const EdgeInsets.only(top: 20, left: 12, right: 12),
    instantInit: true,
    snackPosition: position,
    duration: Duration(seconds: duration),
    mainButton: TextButton(
      onPressed: () {
        Get.isSnackbarOpen ? Get.back() : null;
      },
      style: TextButton.styleFrom(
        minimumSize: const Size(0, 0),
        backgroundColor: context.theme.colorScheme.errorContainer,
        foregroundColor: context.theme.colorScheme.onErrorContainer,
      ),
      child: const Icon(Icons.close, size: 16),
    ),
    icon: icon != null ? Icon(icon, color: context.theme.colorScheme.tertiaryContainer) : null,
  );
}
