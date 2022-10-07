import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_flutter_konsi/core/data/data.dart';
import 'package:test_flutter_konsi/core/desing_pattern/buttons_widget.dart';
import 'package:test_flutter_konsi/core/models/address_model.dart';
import 'package:test_flutter_konsi/core/routes/routes.dart';
import 'package:test_flutter_konsi/features/home/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
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
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const SizedBox(height: 38),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        child: Image.asset(
                          'assets/images/logo.png',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      SizedBox(height: Get.height * 0.22),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 80,
                          vertical: 28,
                        ),
                        child: MyButtons(
                                onPressed: () {
                                  Get.toNamed(Routes.ADDRESS_LIST);
                                },
                                text: 'VAMOS LÁ')
                            .roundedElevatedButton(),
                      ),
                      const SizedBox(height: 38),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
