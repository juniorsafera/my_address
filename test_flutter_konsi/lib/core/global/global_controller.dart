import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_flutter_konsi/core/desing_pattern/loading.dart';

class GlobalController extends GetxController {
  RxBool isLoading = false.obs;
  void openLoading({bool? disabled}) {
    isLoading = true.obs;
    Get.dialog(
      WillPopScope(
        onWillPop: () async => false,
        child: LoadingPage(
          disabled: disabled ?? true,
        ),
      ),
      barrierDismissible: false,
    );

    update();
  }

  void closeLoading() {
    isLoading = false.obs;
    if (Get.isDialogOpen!) {
      Get.close(1);
    }
    update();
  }
}
