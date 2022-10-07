import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_flutter_konsi/features/splash/splash_controller.dart';

class Splashpage extends StatelessWidget {
  const Splashpage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (controller) {
        return Scaffold(
          body: SizedBox(
            width: Get.width,
            height: Get.height,
            child: Stack(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: Get.width,
                      height: Get.height,
                      child: Image.asset(
                        'assets/images/background-home.jpeg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      width: Get.width,
                      height: Get.height,
                      color: Colors.white60,
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 38),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: Image.asset(
                        'assets/images/logo.png',
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
