
abstract class IAddressProvider {
  Future<void> createAddress({required Map<String, dynamic> data});
  Future<void> updateAddress({required Map<String, dynamic> data});
  
}
