import 'package:get/get.dart';
import 'package:hrms_app/app/data/models/subscription/subscription_plan_model.dart';
import 'package:hrms_app/app/data/repositories/__subscription.dart';
import 'package:hrms_app/app/routes/app_routes.dart';
import 'package:hrms_app/service_locator.dart';
import 'package:logger/logger.dart';

import '../../data/models/subscription/plan_model.dart';

class SubscriptionPlanController extends GetxController {
  static SubscriptionPlanController get to => Get.find();
  final _logger = Logger();

  // Observable variables
  final RxBool isLoading = false.obs;
  final RxList<PlanModel> plans = <PlanModel>[].obs;
  final Rx<PlanModel?> selectedPlan = Rx<PlanModel?>(null);

  @override
  void onInit() {
    super.onInit();
    loadSubscriptionPlans();
  }

  // Load subscription plans
  Future<void> loadSubscriptionPlans() async {
    try {
      isLoading.value = true;
      final subscriptionPlans =
          await sl<SubscriptionRepository>().getSubscriptionPlans();
      plans.value = subscriptionPlans;

      // Set first plan as selected by default
      if (plans.isNotEmpty && selectedPlan.value == null) {
        selectedPlan.value = plans.first;
      }
    } catch (e, stack) {
      _logger.e('Error loading subscription plans: $e');
      _logger.e('Stack trace: $stack');
      Get.snackbar(
        'Error',
        'Failed to load subscription plans',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  // Select a plan
  void selectPlan(PlanModel plan) {
    selectedPlan.value = plan;
  }

  // Navigate to subscription details page
  void goToSubscriptionDetails() {
    // loadSubscriptionPlans();
    // return;
    if (selectedPlan.value != null) {
      Get.toNamed(
        AppRoutes.subscriptionDetails,
        arguments: selectedPlan.value,
      );
    } else {
      Get.snackbar(
        'Error',
        'Please select a subscription plan',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
