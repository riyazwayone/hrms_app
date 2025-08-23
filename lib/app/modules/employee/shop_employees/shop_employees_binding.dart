import 'package:get/get.dart';
import 'package:hrms_app/app/data/repositories/__employee.dart';
import 'package:hrms_app/app/modules/employee/shop_employees/shop_employees_controller.dart';
import 'package:hrms_app/service_locator.dart';

class ShopEmployeesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShopEmployeesController>(() {
      // Get shop ID from arguments
      final int shopId = Get.arguments['shopId'] ?? 0;

      return ShopEmployeesController(shopId: shopId);
    });
  }
}
