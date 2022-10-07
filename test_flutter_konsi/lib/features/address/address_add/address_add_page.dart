import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:test_flutter_konsi/core/desing_pattern/buttons_widget.dart';
import 'package:test_flutter_konsi/core/desing_pattern/text_field_widget.dart';
import 'package:test_flutter_konsi/features/address/address_add/address_add_controller.dart';

import '../../../core/desing_pattern/appbar_widget.dart';
import '../../../core/utils/colors.dart';

class AddressAddPage extends StatelessWidget {
  const AddressAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddressAddController>(
        init: AddressAddController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBarWidget(
              text: 'Salvar endereço',
              backgroundColor: Colors.transparent,
              textColor: myPrimaryColor,
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Obx(
                    () => Visibility(
                        visible: controller.hasDelete.value,
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.delete_forever,
                              color: Colors.red,
                              size: 32,
                            ))),
                  ),
                )
              ],
            ),
            body: SizedBox(
              width: Get.width,
              height: Get.height,
              child: SizedBox(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: Get.height * 0.04),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/ilu-01.png',
                                width: Get.width * 0.3,
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          SizedBox(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'CEP:',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                SizedBox(
                                  width: Get.width * 0.9,
                                  child: TextFieldWidget(
                                    textController:
                                        controller.postalCodeController,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      CepInputFormatter(),
                                    ],
                                    validator: controller.validate,
                                    onChange: controller.validateCep,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'ENDEREÇO:',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 5),
                              SizedBox(
                                width: Get.width * 0.9,
                                child: TextFieldWidget(
                                  textController:
                                      controller.streetNameController,
                                  validator: controller.validate,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'BAIRRO:',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 5),
                              SizedBox(
                                width: Get.width * 0.9,
                                child: TextFieldWidget(
                                  textController:
                                      controller.neighborhoodController,
                                  validator: controller.validate,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'NÚMERO:',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  SizedBox(
                                    width: Get.width * 0.3,
                                    child: TextFieldWidget(
                                      textController:
                                          controller.numberController,
                                      validator: controller.validate,
                                      keyboardType: TextInputType.number,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'COMPLEMENTO:',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  SizedBox(
                                    width: Get.width * 0.5,
                                    child: TextFieldWidget(
                                      textController:
                                          controller.complementController,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'CIDADE:',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  SizedBox(
                                    width: Get.width * 0.4,
                                    child: TextFieldWidget(
                                      textController: controller.cityController,
                                      validator: controller.validate,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'ESTADO:',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  SizedBox(
                                    width: Get.width * 0.4,
                                    child: TextFieldWidget(
                                      textController:
                                          controller.stateController,
                                      validator: controller.validate,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 48),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            bottomNavigationBar: SizedBox(
              height: Get.height * 0.1,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 45),
                    child: MyButtons(
                      onPressed: controller.createAdress,
                      text: 'SALVAR',
                    ).roundedElevatedButton(),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
