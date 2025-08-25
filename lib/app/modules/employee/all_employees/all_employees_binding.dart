import 'package:get/get.dart';
import 'package:hrms_app/app/modules/employee/all_employees/all_employees_controller.dart';

class AllEmployeesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllEmployeesController>(
      () => AllEmployeesController(),
    );
  }
}
