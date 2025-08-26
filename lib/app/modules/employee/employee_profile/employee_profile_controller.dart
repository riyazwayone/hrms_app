import 'package:get/get.dart';
import 'package:hrms_app/app/data/models/employee/employee_model.dart';
import 'package:hrms_app/app/modules/employee/all_employees/all_employees_controller.dart';

import '../../../../service_locator.dart';
import '../../../data/repositories/__employee.dart';

class EmployeeProfileController extends GetxController {
  final Rx<EmployeeModel?> employee = Rx<EmployeeModel?>(null);
  final AllEmployeesController _allEmployeesController =
      Get.find<AllEmployeesController>();

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      employee.value = Get.arguments as EmployeeModel;
    }
  }

  void deleteEmployee(int id) async {
    if (employee.value != null) {
      final id = employee.value!.id;
      final success = await sl<EmployeeRepository>().deleteEmployee(id);
      if (success) {
        _allEmployeesController.employees
            .removeWhere((employee) => employee.id == id);
        Get.back();
      }
    }
  }
}
