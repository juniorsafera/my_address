import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:test_flutter_konsi/core/models/address_model.dart';
import 'package:test_flutter_konsi/core/routes/routes.dart';

class AddressListController extends GetxController {
  RxString searchText = ''.obs;
  RxList<AddressModel> listAdress = <AddressModel>[].obs;
  RxBool isloading = false.obs;
  void onChangeSearch(String? value) {
    searchText.value = value ?? '';
  }

  @override
  void onInit() async {
    await getAddress();
    super.onInit();
  }

  Future<void> getAddress() async {
    listAdress.clear();
    isloading.value = true;
    var db = FirebaseFirestore.instance;
    db.collection('address').get().then((value) {
      if (value.docs.isNotEmpty) {
        for (var i in value.docs) {
          listAdress.add(AddressModel.fromJson(i.data()));
        }
        isloading.value = false;
      } else {
        isloading.value = false;
      }
    });
  }

  void createAddress() async {
    var res = await Get.toNamed(Routes.ADDRESS_ADD);
    if (res == true) {
      await getAddress();
    }
  }

  void onTapItem(AddressModel addressModel) async {
    var res = await Get.toNamed(Routes.ADDRESS_ADD, arguments: addressModel);
    if (res == true) {
      await getAddress();
    }
  }
}
