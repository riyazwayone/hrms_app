import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hrms_app/app/data/models/subscription/plan_model.dart';
import 'package:hrms_app/app/data/models/subscription/subscription_plan_model.dart';
import 'package:hrms_app/app/data/repositories/__subscription.dart';
import 'package:hrms_app/app/routes/app_routes.dart';
import 'package:hrms_app/service_locator.dart';
import 'package:logger/logger.dart';

class SubscriptionDetailsController extends GetxController {
  static SubscriptionDetailsController get to => Get.find();
  final _logger = Logger();

  // Observable variables
  final RxBool isLoading = false.obs;
  final Rx<PlanModel?> selectedPlan = Rx<PlanModel?>(null);

  // Form related observables
  final RxBool acceptTerms = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Get selected plan from arguments
    if (Get.arguments is PlanModel) {
      selectedPlan.value = Get.arguments as PlanModel;
    }
  }

  // Toggle terms acceptance
  void toggleTermsAcceptance() {
    acceptTerms.value = !acceptTerms.value;
  }

  // Proceed with subscription
  Future<void> subscribeToPlan() async {
    if (!acceptTerms.value) {
      Get.snackbar(
        'Error',
        'Please accept the terms and conditions',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    try {
      isLoading.value = true;

      if (selectedPlan.value == null) {
        throw Exception('No plan selected');
      }

      // Prepare payment details (in real app, this would come from a payment form)
      final paymentDetails = {
        'card_number': '4242424242424242',
        'exp_month': 12,
        'exp_year': 2025,
        'cvc': '123',
        'amount': selectedPlan.value!.price,
        'currency': 'EUR',
      };

      // Call repository to subscribe to plan
      final success = await sl<SubscriptionRepository>().subscribeToPlan(
        selectedPlan.value!.id!,
        paymentDetails,
      );

      if (success) {
        Fluttertoast.showToast(msg: 'Subscription successful');

        // Navigate to home or dashboard based on user role
        Get.offAllNamed(AppRoutes.createShop);
      } else {
        throw Exception('Subscription failed');
      }
    } catch (e, stack) {
      _logger.e('Error subscribing to plan: $e');
      _logger.e('Stack trace: $stack');
      Get.snackbar(
        'Error',
        'Failed to subscribe: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
