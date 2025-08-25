import 'package:get/get.dart';
import 'package:hrms_app/app/modules/profile/profile_controller.dart';

class ProfileDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
