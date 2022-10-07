import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_flutter_konsi/core/desing_pattern/appbar_widget.dart';
import 'package:test_flutter_konsi/core/desing_pattern/buttons_widget.dart';
import 'package:test_flutter_konsi/core/desing_pattern/loading.dart';
import 'package:test_flutter_konsi/core/desing_pattern/search_text_form_field_widget.dart';
import 'package:test_flutter_konsi/core/routes/routes.dart';
import 'package:test_flutter_konsi/core/utils/colors.dart';
import 'package:test_flutter_konsi/features/address/address_list/address_list_controller.dart';
import 'package:test_flutter_konsi/features/address/address_list/widgets/address_item.dart';

import '../../../core/data/data.dart';
import '../../../core/models/address_model.dart';

class AddressListPage extends StatelessWidget {
  const AddressListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddressListController>(
        init: AddressListController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBarWidget(
              text: 'Endereços',
              backgroundColor: Colors.transparent,
              textColor: myPrimaryColor,
              actions: [
                Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: IconButton(
                      onPressed: controller.createAddress,
                      icon: const Icon(
                        Icons.add_location_alt,
                        color: myPrimaryColor,
                        size: 32,
                      ),
                    ))
              ],
            ),
            body: SizedBox(
              width: Get.width,
              height: Get.height,
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: SizedBox(
                  child: Column(
                    children: [
                      const SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        child: SearchTextFormFieldWidget(
                          hintText: 'Ex. cep, rua, bairro, cidade ou bairro',
                          onChange: controller.onChangeSearch,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Obx(
                        () => controller.isloading.value
                            ? SizedBox(
                                height: Get.height * 0.75, child: LoadingPage())
                            : controller.listAdress.isNotEmpty
                                ? SizedBox(
                                    height: Get.height * 0.79,
                                    child: ListView.builder(
                                        itemCount: controller.listAdress.length,
                                        itemBuilder: (context, index) {
                                          AddressModel addressModel =
                                              controller.listAdress[index];
                                          return Obx(
                                            () => controller
                                                    .searchText.value.isEmpty
                                                ? AddressItemWidget(
                                                    onTap: () =>
                                                        controller.onTapItem(
                                                            addressModel),
                                                    addressModel: addressModel)
                                                : addressModel.filter(controller
                                                        .searchText.value)
                                                    ? AddressItemWidget(
                                                        addressModel:
                                                            addressModel)
                                                    : Container(),
                                          );
                                        }),
                                  )
                                : Column(
                                    children: [
                                      SizedBox(height: Get.height * 0.35),
                                      const Text('Nenhum endereço cadastrado.'),
                                    ],
                                  ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
