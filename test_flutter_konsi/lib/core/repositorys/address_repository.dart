import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test_flutter_konsi/core/interfaces/address_interface.dart';

class AddressRepository {
  final IAddressProvider api;
  AddressRepository(
      this.api,
  );

  Future<void> createAddress({required Map<String, dynamic> data}) async {
    try {
      await api.createAddress(data: data).catchError((error) => throw error);
    } on Exception {
      rethrow;
    }
  }

  Future<void> updateAddress({required Map<String, dynamic> data}) async {
    try {
      await api.updateAddress(data: data).catchError((error) => throw error);
    } on Exception {
      rethrow;
    }
  }

  // QuerySnapshot<Map<String, dynamic>>? getAddressList() {
  //   try {
  //     api.getAddressList();
  //   } on Exception {
  //     rethrow;
  //   }
  //   return null;
  // }
}
