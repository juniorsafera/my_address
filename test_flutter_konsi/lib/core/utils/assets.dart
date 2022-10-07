import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppAssets {
  static void showMessage({
    String? title,
    String? message,
    bool? isError,
  }) {
    Get.snackbar(
      title ?? 'Aviso!',
      message ?? '',
      colorText: Colors.white,
      backgroundColor: isError! ? Colors.red : Colors.green,
      snackPosition: SnackPosition.TOP,
      icon: Icon(
        isError ? Icons.error : Icons.check,
        color: Colors.white,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    );
  }
}
