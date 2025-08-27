import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrms_app/app/data/repositories/__auth.dart';
import 'package:hrms_app/service_locator.dart';
import 'package:logger/logger.dart';

import '../../data/services/user_service.dart';
import '../../routes/app_routes.dart';

class RegisterController extends GetxController {
  static RegisterController get to => Get.find();

  // Form controllers
  final fullNameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // Observable variables
  final RxBool isLoading = false.obs;
  final RxBool isPasswordVisible = false.obs;
  final RxBool isConfirmPasswordVisible = false.obs;
  final RxBool acceptTerms = false.obs;

  // Form key
  final formKey = GlobalKey<FormState>();

  @override
  void onClose() {
    fullNameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  // Toggle password visibility
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  // Toggle confirm password visibility
  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  // Toggle accept terms
  void toggleAcceptTerms() {
    acceptTerms.value = !acceptTerms.value;
  }

  // Register method
  Future<void> register() async {
    if (formKey.currentState?.validate() ?? false) {
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

        // // Simulate API call
        final response = await sl<AuthRepository>().register(
          fullNameController.text,
          phoneController.text,
          emailController.text,
          passwordController.text,
        );

        sl<UserService>().saveUser(response);

        // Navigate to subscription plans
        Get.offAllNamed(AppRoutes.subscriptionPlans);
      } catch (e, stack) {
        Logger().e('Registration failed: $e', stackTrace: stack);
      } finally {
        isLoading.value = false;
      }
    }
  }

  // Navigate to login
  void goToLogin() {
    Get.back();
  }

  // Name validator
  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    if (value.length < 2) {
      return 'Name must be at least 2 characters';
    }
    return null;
  }

  // Name Phone validator
  String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    if (value.length < 10) {
      return 'Phone number must be at least 10 digits';
    }
    return null;
  }

  // Email validator
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    if (!GetUtils.isEmail(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

// Password validator
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }

    // Check for uppercase letters
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Password must contain at least one uppercase letter';
    }

    // Check for lowercase letters
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Password must contain at least one lowercase letter';
    }

    // Check for special characters
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'Password must contain at least one special character';
    }

    return null;
  }

  // Confirm password validator
  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }
}
