import 'package:get/get.dart';
import 'package:hrms_app/app/modules/employee/all_employees/all_employees_controller.dart';
import 'package:hrms_app/app/modules/employee/shop_employees/shop_employees_controller.dart';
import 'package:hrms_app/app/modules/home/home_controller.dart';
import 'package:hrms_app/app/modules/profile/profile_controller.dart';
import '../shop/shop_list/shop_list_controller.dart';
import '../task/task_list_controller.dart';
import 'dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.lazyPut<ShopListController>(() => ShopListController());
    Get.lazyPut<AllEmployeesController>(() => AllEmployeesController());
    Get.lazyPut<TaskListController>(() => TaskListController());
  }
}
