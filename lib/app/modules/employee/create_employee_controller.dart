import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrms_app/app/data/models/employee/employee_model.dart';
import 'package:hrms_app/app/data/repositories/__employee.dart';
import 'package:hrms_app/service_locator.dart';
import 'package:logger/logger.dart';

class CreateEmployeeController extends GetxController {
  static CreateEmployeeController get to => Get.find();
  final _logger = Logger();

  // Form controllers
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final salaryController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // Form keys
  final formKey = GlobalKey<FormState>();

  // Observable variables
  final RxString selectedDesignation = 'employee'.obs;
  final RxString selectedEmploymentType = 'full-time'.obs;
  final RxString selectedShiftType = 'day'.obs;
  final RxString shiftTiming = '9:00 AM - 6:00 PM'.obs;

  final RxBool isLoading = false.obs;
  final RxBool showPassword = false.obs;
  final RxBool showConfirmPassword = false.obs;

  // Dropdown options
  final List<String> designationOptions = [
    'employee',
    'hr',
    'manager',
    'admin'
  ];
  final List<String> employmentTypeOptions = [
    'full-time',
    'part-time',
    'contract',
    'intern'
  ];
  final List<String> shiftTypeOptions = ['day', 'night', 'rotating'];

  @override
  void onClose() {
    // Dispose controllers
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    salaryController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  // Toggle password visibility
  void togglePasswordVisibility() {
    showPassword.value = !showPassword.value;
  }

  // Toggle confirm password visibility
  void toggleConfirmPasswordVisibility() {
    showConfirmPassword.value = !showConfirmPassword.value;
  }

  // Update selected designation
  void updateDesignation(String? value) {
    if (value != null) {
      selectedDesignation.value = value;
    }
  }

  // Update selected employment type
  void updateEmploymentType(String? value) {
    if (value != null) {
      selectedEmploymentType.value = value;
    }
  }

  // Update selected shift type
  void updateShiftType(String? value) {
    if (value != null) {
      selectedShiftType.value = value;
    }
  }

  // Update shift timing
  void updateShiftTiming(String value) {
    shiftTiming.value = value;
  }

  // Form validation
  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }

  // Submit form
  Future<void> submitForm() async {
    if (!validateForm()) {
      Get.snackbar(
        'Error',
        'Please fix the errors in the form',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    try {
      isLoading.value = true;

      // Create employee model
      final employee = EmployeeModel(
        employeeName: nameController.text.trim(),
        email: emailController.text.trim(),
        phoneNumber: phoneController.text.trim(),
        salary: salaryController.text.trim(),
        designation: selectedDesignation.value,
        employmentType: selectedEmploymentType.value,
        shiftType: selectedShiftType.value,
        shiftTiming: shiftTiming.value,
        password: passwordController.text,
      );

      // Call repository to create employee
      await sl<EmployeeRepository>().createEmployee(employee);

      // Show success message
      Get.snackbar(
        'Success',
        'Employee created successfully',
        snackPosition: SnackPosition.BOTTOM,
      );

      // Navigate back
      Get.back();
    } catch (e, stack) {
      _logger.e('Error creating employee: $e');
      _logger.e('Stack trace: $stack');
      Get.snackbar(
        'Error',
        'Failed to create employee: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
