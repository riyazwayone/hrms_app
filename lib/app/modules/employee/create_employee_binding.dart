import 'package:get/get.dart';
import 'package:hrms_app/app/data/repositories/__employee.dart';
import 'package:hrms_app/app/modules/employee/create_employee_controller.dart';
import 'package:hrms_app/service_locator.dart';

class CreateEmployeeBinding extends Bindings {
  @override
  void dependencies() {
    // Register repository if not already registered
    if (!sl.isRegistered<EmployeeRepository>()) {
      sl.registerLazySingleton<EmployeeRepository>(() => EmployeeRepository());
    }

    // Register controller
    Get.lazyPut<CreateEmployeeController>(() => CreateEmployeeController());
  }
}
