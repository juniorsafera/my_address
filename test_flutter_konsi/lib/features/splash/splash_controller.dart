import 'package:get/get.dart';
import 'package:test_flutter_konsi/core/routes/routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    splashTime();
    super.onInit();
  }

  void splashTime() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.toNamed(Routes.HOME);
  }
}
