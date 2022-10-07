import 'package:brasil_fields/brasil_fields.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_flutter_konsi/core/global/global_controller.dart';
import 'package:test_flutter_konsi/core/interfaces/address_interface.dart';
import 'package:test_flutter_konsi/core/models/address_model.dart';
import 'package:test_flutter_konsi/core/repositorys/address_repository.dart';
import 'package:test_flutter_konsi/core/utils/assets.dart';
import 'package:uuid/uuid.dart';

import '../../../core/providers/address_provider.dart';
import '../../../core/repositorys/cep_repository.dart';

class AddressAddController extends GetxController {
  final postalCodeController = TextEditingController();
  final neighborhoodController = TextEditingController();
  final streetNameController = TextEditingController();
  final complementController = TextEditingController();
  final numberController = TextEditingController();
  final stateController = TextEditingController();
  final cityController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  AddressModel addressModel = Get.arguments ?? AddressModel();
  final globalController = Get.find<GlobalController>();
  var uuid = const Uuid();
  CepRepository cepRepository = CepRepository();
  RxString title = 'Salvar endereço'.obs;
  RxBool hasDelete = false.obs;
  RxBool isUpdate = false.obs;

  var addressRepository = AddressRepository(
      AddressProvider(firebaseFirestore: FirebaseFirestore.instance));

  String? validate(String? value) {
    if (value!.isEmpty) {
      return 'Preencha este campo.';
    } else {
      return null;
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    initData();
    super.onInit();
  }

  void validateCep(String? str) async {
    print(str!.length);
    if (str.length == 10) {
      globalController.openLoading();
      await cepRepository
          .getByCep(
              postalCodeController.text.replaceAll('.', '').replaceAll('-', ''))
          .then((value) {
        if (value.toString() == '{erro: true}') {
          AppAssets.showMessage(
            message: 'Cep inválido',
            isError: true,
          );
          //
        } else {
          var mapCep = value;
          streetNameController.text = mapCep['logradouro'];
          cityController.text = mapCep['localidade'];
          stateController.text = mapCep['uf'];
          neighborhoodController.text = mapCep['bairro'];
        }
      });
      globalController.closeLoading();
    }
  }

  void initData() {
    if (Get.arguments != null) {
      isUpdate.value = true;
      title.value = 'Editar endereço';
      hasDelete.value = true;
      postalCodeController.text = addressModel.postalCode != null
          ? UtilBrasilFields.obterCep(addressModel.postalCode!)
          : '-';
      neighborhoodController.text = addressModel.neighborhood ?? '';
      streetNameController.text = addressModel.streetName ?? '';
      complementController.text = addressModel.complement ?? '';
      numberController.text = addressModel.number ?? '';
      stateController.text = addressModel.state ?? '';
      cityController.text = addressModel.city ?? '';
    }
  }

  void preparedData() {
    addressModel.postalCode =
        postalCodeController.text.replaceAll('.', '').replaceAll('-', '');
    addressModel.neighborhood = neighborhoodController.text;
    addressModel.streetName = streetNameController.text;
    addressModel.complement = complementController.text;
    addressModel.number = numberController.text;
    addressModel.state = stateController.text;
    addressModel.city = cityController.text;
  }

  Future<void> createAdress() async {
    if (formKey.currentState!.validate()) {
      globalController.openLoading();
      preparedData();
      var db = FirebaseFirestore.instance;
      try {
        if (isUpdate.value) {
          await addressRepository
              .updateAddress(data: addressModel.toJson())
              .then((value) {
            globalController.closeLoading();
            Get.back(result: true);
            AppAssets.showMessage(
              message: 'Salvo com sucesso!',
              isError: false,
            );
          });
        } else {
          addressModel.id = uuid.v4();
          await addressRepository
              .createAddress(data: addressModel.toJson())
              .then((value) {
            globalController.closeLoading();
            Get.back(result: true);
            AppAssets.showMessage(
              message: 'Salvo com sucesso!',
              isError: false,
            );
          });
        }
      } catch (e) {
        globalController.closeLoading();
        Get.back(result: true);
        AppAssets.showMessage(
          message: 'Ocorreu um erro!',
          isError: true,
        );
      }
    }
  }
}
