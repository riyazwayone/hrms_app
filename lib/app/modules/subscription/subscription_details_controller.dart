import 'dart:async';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hrms_app/app/core/constants/api.dart';
import 'package:hrms_app/app/data/models/subscription/plan_model.dart';
import 'package:hrms_app/app/data/repositories/__subscription.dart';
import 'package:hrms_app/app/data/services/user_service.dart';
import 'package:hrms_app/app/routes/app_routes.dart';
import 'package:hrms_app/service_locator.dart';
import 'package:logger/logger.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class SubscriptionDetailsController extends GetxController {
  static SubscriptionDetailsController get to => Get.find();
  final _logger = Logger();

  // Observable variables
  final RxBool isLoading = false.obs;
  final Rx<PlanModel?> selectedPlan = Rx<PlanModel?>(null);
  final RxBool isPaymentProcessing = false.obs;
  final RxBool isPaymentVerifying = false.obs;

  // Form related observables
  final RxBool acceptTerms = false.obs;

  // Razorpay
  late Razorpay _razorpay;
  final RxString paymentId = ''.obs;
  final RxInt verificationAttempts = 0.obs;
  Timer? _verificationTimer;

  @override
  void onInit() {
    super.onInit();
    // Get selected plan from arguments
    if (Get.arguments is PlanModel) {
      selectedPlan.value = Get.arguments as PlanModel;
    }

    // Initialize Razorpay
    _initRazorpay();
  }

  @override
  void onClose() {
    _razorpay.clear();
    _verificationTimer?.cancel();
    super.onClose();
  }

  void _initRazorpay() {
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    _logger.d('Payment success: ${response.paymentId}');
    paymentId.value = response.paymentId ?? '';
    isPaymentProcessing.value = false;
    isPaymentVerifying.value = true;

    // Start verification polling
    _startPaymentVerification();
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    _logger.e('Payment error: ${response.message}');
    isPaymentProcessing.value = false;
    Get.snackbar(
      'Payment Failed',
      response.message ?? 'Something went wrong with your payment',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    _logger.d('External wallet: ${response.walletName}');
    Get.snackbar(
      'External Wallet',
      'Payment processing with ${response.walletName}',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void _startPaymentVerification() {
    verificationAttempts.value = 0;

    // Cancel any existing timer
    _verificationTimer?.cancel();

    // Start polling every 3 seconds, up to 10 attempts (30 seconds)
    _verificationTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      _verifyPayment();

      verificationAttempts.value++;
      if (verificationAttempts.value >= 10) {
        timer.cancel();
        isPaymentVerifying.value = false;
        Get.snackbar(
          'Verification Timeout',
          'Payment verification is taking longer than expected. Please contact support.',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    });
  }

  Future<void> _verifyPayment() async {
    if (paymentId.value.isEmpty) return;

    try {
      final headers = await sl<UserService>().getHeaders();
      final response = await GetConnect().get(
        '${Api.baseUrl}/payments/verify/${paymentId.value}',
        headers: headers,
      );

      _logger.d('Payment verification response: ${response.body}');

      if (response.statusCode == 200 && response.body['verified'] == true) {
        _verificationTimer?.cancel();
        isPaymentVerifying.value = false;

        // Now subscribe to plan as the payment is verified
        await _finalizePlanSubscription();
      }
    } catch (e) {
      _logger.e('Error verifying payment: $e');
      // Continue polling, don't stop on error
    }
  }

  Future<void> _finalizePlanSubscription() async {
    try {
      isLoading.value = true;

      if (selectedPlan.value == null) {
        throw Exception('No plan selected');
      }

      // Call repository to subscribe to plan with verified payment
      final success = await sl<SubscriptionRepository>().subscribeToPlan(
        selectedPlan.value?.id ?? 1,
        {'payment_id': paymentId.value},
      );

      if (success) {
        Fluttertoast.showToast(msg: 'Subscription successful');

        // Navigate to home or dashboard based on user role
        Get.offAllNamed(AppRoutes.createShop);
      } else {
        throw Exception('Subscription failed');
      }
    } catch (e, stack) {
      _logger.e('Error completing subscription: $e');
      _logger.e('Stack trace: $stack');
      Get.snackbar(
        'Error',
        'Failed to complete subscription: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
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
      if (selectedPlan.value == null) {
        throw Exception('No plan selected');
      }

      // Initiate Razorpay payment
      _startRazorpayPayment();
    } catch (e, stack) {
      _logger.e('Error starting payment: $e');
      _logger.e('Stack trace: $stack');
      Get.snackbar(
        'Error',
        'Failed to initiate payment: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void _startRazorpayPayment() {
    // Calculate amount in lowest denomination (paise)
    final amountInPaise = (selectedPlan.value!.price * 100).toInt();

    // Get a unique order ID - in production, this would come from your backend
    final orderId = 'order_${DateTime.now().millisecondsSinceEpoch}';

    var options = {
      'key': 'rzp_test_YOUR_KEY_HERE', // Replace with your Razorpay key
      'amount': amountInPaise,
      'name': 'HRMS App',
      'description': '${selectedPlan.value!.planName} Subscription',
      'order_id': orderId,
      'prefill': {
        'contact': '', // You can prefill from user data if available
        'email': ''
      },
      'theme': {'color': '#3399cc'}
    };

    isPaymentProcessing.value = true;
    try {
      _razorpay.open(options);
    } catch (e) {
      isPaymentProcessing.value = false;
      _logger.e('Error opening Razorpay: $e');
      Get.snackbar(
        'Error',
        'Failed to open payment gateway',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
