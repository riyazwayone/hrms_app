import 'package:get/get.dart';
import 'package:hrms_app/app/data/repositories/__shop.dart';
import 'package:hrms_app/app/modules/shop/shop_list/shop_list_controller.dart';
import 'package:hrms_app/service_locator.dart';

class ShopListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShopListController>(() => ShopListController());
  }
}
