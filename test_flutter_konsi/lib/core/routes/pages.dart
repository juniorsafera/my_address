import 'package:get/get.dart';
import 'package:test_flutter_konsi/core/global/global_binding.dart';
import 'package:test_flutter_konsi/core/routes/routes.dart';
import 'package:test_flutter_konsi/features/address/address_add/address_add_page.dart';
import 'package:test_flutter_konsi/features/address/address_list/address_list_page.dart';
import 'package:test_flutter_konsi/features/home/home_page.dart';
import 'package:test_flutter_konsi/features/splash/splash_page.dart';

class AppPages {
  static List<GetPage> pages = [
    GetPage(
      name: Routes.SPLASH,
      page: () => const Splashpage(),
      binding: GlobalBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => const HomePage(),
    ),
    GetPage(
      name: Routes.ADDRESS_LIST,
      page: () => const AddressListPage(),
    ),
    GetPage(
      name: Routes.ADDRESS_ADD,
      page: () => const AddressAddPage(),
    ),
  ];
}
