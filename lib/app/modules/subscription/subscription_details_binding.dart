import 'package:get/get.dart';
import 'package:hrms_app/app/modules/subscription/subscription_details_controller.dart';

class SubscriptionDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SubscriptionDetailsController>(
        () => SubscriptionDetailsController());
  }
}
