import 'package:get/get.dart';
import 'package:hrms_app/app/modules/employee/employee_profile/employee_profile_controller.dart';

class EmployeeProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmployeeProfileController>(
      () => EmployeeProfileController(),
    );
  }
}
