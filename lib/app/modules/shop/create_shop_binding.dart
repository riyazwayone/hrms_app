import 'package:get/get.dart';
import 'package:hrms_app/app/data/repositories/__shop.dart';
import 'package:hrms_app/app/modules/shop/create_shop_controller.dart';
import 'package:hrms_app/service_locator.dart';

class CreateShopBinding extends Bindings {
  @override
  void dependencies() {
    // Register repository if not already registered
    if (!sl.isRegistered<ShopRepository>()) {
      sl.registerLazySingleton<ShopRepository>(() => ShopRepository());
    }

    // Register controller
    Get.lazyPut<CreateShopController>(() => CreateShopController());
  }
}
