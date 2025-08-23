import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hrms_app/app/core/utils/enums.dart';
import 'package:hrms_app/app/data/models/users/user_model.dart';
import 'package:hrms_app/app/data/services/user_service.dart';
import 'package:hrms_app/app/routes/app_routes.dart';
import 'package:logger/logger.dart';

import '../../../service_locator.dart';
import '../../data/repositories/__auth.dart';

class LoginController extends GetxController {
  static LoginController get to => Get.find();

  // Form controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Observable variables
  final RxBool isLoading = false.obs;
  final RxBool isPasswordVisible = false.obs;
  final RxBool rememberMe = false.obs;

  // Form key
  final formKey = GlobalKey<FormState>();

  final _logger = Logger();

  @override
  void onInit() {
    super.onInit();
    // Load saved credentials if remember me was checked
    _loadSavedCredentials();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  // Toggle password visibility
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  // Toggle remember me
  void toggleRememberMe() {
    rememberMe.value = !rememberMe.value;
  }

  // Login method
  Future<void> login(UserRole role) async {
    _logger.f(role);
    if (formKey.currentState?.validate() ?? false) {
      try {
        isLoading.value = true;

        // Login API call
        final email = emailController.text;
        final password = passwordController.text;
        final repository = sl<AuthRepository>();
        final user = (role == UserRole.employee || role == UserRole.hr)
            ? await repository.employeeLogin(email, password, rememberMe.value)
            : await repository.login(email, password, rememberMe.value);
        _logger.f(user);
        // Save credentials if remember me is checked
        await _saveCredentials(user);

        // Navigate to dashboard
        Get.offAllNamed(AppRoutes.dashboard);

        Fluttertoast.showToast(
          msg: 'Login successful!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      } catch (e, stack) {
        _logger.f(e);
        _logger.f(stack);

        Fluttertoast.showToast(
          msg: 'Login failed. Please try again.',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      } finally {
        isLoading.value = false;
      }
    }
  }

  // Navigate to register
  void goToRegister() {
    Get.toNamed('/register');
  }

  // Navigate to forgot password
  void goToForgotPassword() {
    Get.toNamed('/forgot-password');
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
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  // Load saved credentials
  Future<void> _loadSavedCredentials() async {
    // Implementation for loading saved credentials from local storage
    // final prefs = await SharedPreferences.getInstance();
    // final savedEmail = prefs.getString('saved_email');
    // final savedPassword = prefs.getString('saved_password');
    // if (savedEmail != null && savedPassword != null) {
    //   emailController.text = savedEmail;
    //   passwordController.text = savedPassword;
    //   rememberMe.value = true;
    // }
  }

  // Save credentials
  Future<void> _saveCredentials(UserModel user) async {
    await sl<UserService>().saveUser(user);
  }
}
