import 'package:get/get.dart';
import 'package:hrms_app/app/modules/attendance/ateendance_list_controller.dart';

class AttendanceListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AttendanceListController>(() => AttendanceListController(
          employeeId: Get.arguments['employeeId'],
          employeeName: Get.arguments['employeeName'],
        ));
  }
}
