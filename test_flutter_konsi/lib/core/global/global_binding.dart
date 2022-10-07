

import 'package:get/get.dart';
import 'package:test_flutter_konsi/core/global/global_controller.dart';

class GlobalBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(GlobalController());
    
  }
}