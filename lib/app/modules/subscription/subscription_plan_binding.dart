import 'package:get/get.dart';
import 'package:hrms_app/app/modules/subscription/subscription_plan_controller.dart';

class SubscriptionPlanBinding extends Bindings {
  @override
  void dependencies() {
    // Register controller
    Get.lazyPut<SubscriptionPlanController>(() => SubscriptionPlanController());
  }
}
