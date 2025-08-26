import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hrms_app/app/core/constants/api.dart';
import 'package:hrms_app/app/data/models/subscription/plan_model.dart';
import 'package:hrms_app/app/data/repositories/__subscription.dart';
import 'package:hrms_app/app/data/services/user_service.dart';
import 'package:hrms_app/app/routes/app_routes.dart';
import 'package:hrms_app/service_locator.dart';
import 'package:logger/logger.dart';

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

  // Stripe payment
  final RxString paymentIntentId = ''.obs;
  final RxInt verificationAttempts = 0.obs;
  Timer? _verificationTimer;

  // Payment sheet
  final Rx<PaymentSheetPaymentOption?> paymentSheetPaymentOption =
      Rx<PaymentSheetPaymentOption?>(null);
  final RxBool paymentSheetEnabled = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Get selected plan from arguments
    if (Get.arguments is PlanModel) {
      selectedPlan.value = Get.arguments as PlanModel;
    }
  }

  @override
  void onClose() {
    _verificationTimer?.cancel();
    super.onClose();
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

      // Start the Stripe payment flow
      isPaymentProcessing.value = true;
      await _initializeStripePayment();
    } catch (e, stack) {
      _logger.e('Error starting payment: $e');
      _logger.e('Stack trace: $stack');
      isPaymentProcessing.value = false;
      Get.snackbar(
        'Error',
        'Failed to initiate payment: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  // Initialize Stripe Payment Sheet
  Future<void> _initializeStripePayment() async {
    try {
      // Calculate amount in lowest denomination (cents)
      final amountInCents = (selectedPlan.value!.price * 100).toInt();

      // 1. Create payment intent on the server
      final headers = await sl<UserService>().getHeaders();
      final response = await GetConnect().post(
        Api.createPaymentIntentApi,
        {
          'amount': amountInCents,
          'currency': 'usd', // Change as needed based on your currency
          'payment_method_types[]': 'card',
          'plan_id': selectedPlan.value!.id,
        },
        headers: headers,
      );

      _logger.d('Payment intent response: ${response.body}');

      if (response.statusCode != 200) {
        throw Exception('Failed to create payment intent: ${response.body}');
      }

      // Save payment intent ID for verification later
      paymentIntentId.value = response.body['paymentIntent']['id'];

      // 2. Initialize the Payment Sheet
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          // Main params
          paymentIntentClientSecret: response.body['paymentIntent']
              ['client_secret'],
          merchantDisplayName: 'HRMS App',
          // Customer params
          customerId: response.body['customer'],
          customerEphemeralKeySecret: response.body['ephemeralKey'],
          // Extra params
          applePay: const PaymentSheetApplePay(
            merchantCountryCode: 'US',
          ),
          googlePay: const PaymentSheetGooglePay(
            merchantCountryCode: 'US',
            testEnv: true,
          ),
          style: ThemeMode.system,
          appearance: PaymentSheetAppearance(
            colors: PaymentSheetAppearanceColors(
              primary: Colors.blue,
            ),
          ),
          billingDetails: const BillingDetails(),
        ),
      );

      // 3. Present payment sheet
      await _presentPaymentSheet();
    } catch (e) {
      _logger.e('Error initializing payment: $e');
      isPaymentProcessing.value = false;
      rethrow;
    }
  }

  // Present the payment sheet
  Future<void> _presentPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();

      // Payment succeeded, start verification
      isPaymentProcessing.value = false;
      isPaymentVerifying.value = true;

      // Start polling to verify payment
      _startPaymentVerification();
    } on StripeException catch (e) {
      isPaymentProcessing.value = false;

      if (e.error.code == FailureCode.Canceled) {
        // User canceled, just show a message
        Get.snackbar(
          'Payment Canceled',
          'You have canceled the payment',
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        // Other Stripe error
        Get.snackbar(
          'Payment Error',
          'Error: ${e.error.localizedMessage}',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      isPaymentProcessing.value = false;
      _logger.e('Error presenting payment sheet: $e');
      Get.snackbar(
        'Error',
        'Failed to process payment: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  // Start polling to verify payment status
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
    if (paymentIntentId.value.isEmpty) return;

    try {
      final headers = await sl<UserService>().getHeaders();
      final response = await GetConnect().get(
        Api.verifyPaymentApi + '?payment_intent_id=${paymentIntentId.value}',
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
        {'payment_intent_id': paymentIntentId.value},
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
}
