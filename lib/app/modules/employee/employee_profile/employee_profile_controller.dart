import 'package:get/get.dart';
import 'package:hrms_app/app/data/models/employee/employee_model.dart';

class EmployeeProfileController extends GetxController {
  final Rx<EmployeeModel?> employee = Rx<EmployeeModel?>(null);

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      employee.value = Get.arguments as EmployeeModel;
    }
  }
}
