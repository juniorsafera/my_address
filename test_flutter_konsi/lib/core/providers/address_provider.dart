import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test_flutter_konsi/core/interfaces/address_interface.dart';

  class AddressProvider implements IAddressProvider {
  final FirebaseFirestore firebaseFirestore;
  AddressProvider({
    required this.firebaseFirestore,
  });
  @override
  Future<void> createAddress({required Map<String, dynamic> data}) async {
    try {
      return await firebaseFirestore
          .collection('address')
          .doc(data['id'])
          .set(data);
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<void> updateAddress({required Map<String, dynamic> data}) async {
    try {
      return await firebaseFirestore
          .collection('address')
          .doc(data['id'])
          .update(data);
    } on Exception {
      rethrow;
    }
  }
  
  // Future<QuerySnapshot<Map<String, dynamic>>> getAdressList()  async  {
  //   try {
  //     return  await firebaseFirestore.collection('address').get();
  //   } on Exception {
  //     rethrow;
  //   }
  // }
  
   
}
