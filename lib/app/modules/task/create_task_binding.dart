import 'package:get/get.dart';
import 'package:hrms_app/app/modules/task/create_task_controller.dart';

class CreateTaskBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateTaskController>(() => CreateTaskController());
  }
}
