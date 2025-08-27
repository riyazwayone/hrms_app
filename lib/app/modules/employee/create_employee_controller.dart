import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hrms_app/app/core/utils/enums.dart';
import 'package:hrms_app/app/core/utils/extensions/widget_rols.dart';
import 'package:hrms_app/app/data/models/employee/employee_model.dart';
import 'package:hrms_app/app/data/models/shop/shop_model.dart';
import 'package:hrms_app/app/data/repositories/__employee.dart';
import 'package:hrms_app/app/modules/employee/all_employees/all_employees_controller.dart';
import 'package:hrms_app/app/modules/shop/shop_list/shop_list_controller.dart';
import 'package:hrms_app/service_locator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

import '../../data/services/user_service.dart';

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
  final selectedHr = Rx<EmployeeModel?>(null);
  final selectedShop = Rx<ShopModel?>(null);
  final RxString selectedEmploymentType = 'full-time'.obs;
  final RxString selectedShiftType = 'day'.obs;
  final RxString shiftTiming = '9:00 AM - 6:00 PM'.obs;

  final RxBool isLoading = false.obs;
  final RxBool showPassword = false.obs;
  final RxBool showConfirmPassword = false.obs;

  final RxInt shopId = 0.obs;

  // Image picker
  final ImagePicker _picker = ImagePicker();
  final Rx<File?> selectedImage = Rx<File?>(null);
  final RxString imagePath = ''.obs;

  // Dropdown options
  final List<String> designationOptions =
      ['employee', 'hr'.forAdmin()].whereType<String>().toList();
  final List<String> employmentTypeOptions = [
    'full-time',
    'part-time',
    'contract',
    'intern'
  ];

  final shopListController = Get.isRegistered<ShopListController>()
      ? Get.find<ShopListController>()
      : null;
  final allEmployeesController = Get.isRegistered<AllEmployeesController>()
      ? Get.find<AllEmployeesController>()
      : null;

  final List<String> shiftTypeOptions = ['day', 'night', 'rotating'];

  List<EmployeeModel> getHrList() {
    return allEmployeesController?.employees
            .where((employee) => employee.designation == 'hr')
            .toList() ??
        [];
  }

  // Pick image from gallery
  Future<void> pickImageFromGallery() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
        maxWidth: 800,
        maxHeight: 800,
      );

      if (image != null) {
        selectedImage.value = File(image.path);
        imagePath.value = image.path;
        _logger.d('Image selected: ${image.path}');
      }
    } catch (e) {
      _logger.e('Error picking image from gallery: $e');
      Get.snackbar('Error', 'Failed to pick image from gallery');
    }
  }

  // Take a photo using camera
  Future<void> takePhoto() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 80,
        maxWidth: 800,
        maxHeight: 800,
      );

      if (image != null) {
        selectedImage.value = File(image.path);
        imagePath.value = image.path;
        _logger.d('Photo taken: ${image.path}');
      }
    } catch (e) {
      _logger.e('Error taking photo: $e');
      Get.snackbar('Error', 'Failed to take photo');
    }
  }

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

  // Update selected designation
  void updateHr(String? value) {
    if (value != null) {
      final employee = getHrList().firstWhere((e) => e.employeeName == value);
      selectedHr.value = employee;
    }
  }

  // Update selected shop
  void updateShop(String? value) {
    shopId.value = shopListController?.shops
            .firstWhere((shop) => shop.shopName == value)
            .id ??
        0;
    if (value != null) {
      selectedShop.value = shopListController?.shops
          .firstWhere((shop) => shop.shopName == value);
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
    final user = sl<UserService>().getCurrentUserSync();
    _logger.f(shopListController?.shops);
    selectedShop.value = shopListController!.shops.isNotEmpty
        ? shopListController!.shops.first
        : null;
    selectedHr.value = getHrList().isNotEmpty ? getHrList().first : null;
    try {
      isLoading.value = true;

      // Create employee model
      var employee = EmployeeModel(
        employeeName: nameController.text.trim(),
        email: emailController.text.trim(),
        phoneNumber: phoneController.text.trim(),
        salary: salaryController.text.trim(),
        designation: selectedDesignation.value,
        employmentType: selectedEmploymentType.value,
        shiftType: selectedShiftType.value,
        shiftTiming: shiftTiming.value,
        password: passwordController.text,
        profileImage: imagePath.value, // Add profile image path
      );
      if (user!.role == UserRole.hr) {
        employee = employee.copyWith(recruiterId: user.id, shopId: user.shopId);
      }
      if (user.role == UserRole.admin) {
        if (selectedDesignation.value != "hr" && selectedHr.value == null) {
          Fluttertoast.showToast(msg: "Please select HR");
          return;
        }

        final shop = shopListController?.shops
            .firstWhere((shop) => shop.id == selectedShop.value?.id);
        if (shop == null) {
          Fluttertoast.showToast(msg: "Please select a valid shop");
          return;
        }

        employee = employee.copyWith(
            recruiterId: selectedHr.value?.id ?? 0, shopId: shop.id!);
      }

      // Call repository to create employee
      final imageFile =
          selectedImage.value != null ? XFile(selectedImage.value!.path) : null;
      await sl<EmployeeRepository>().createEmployee(employee, imageFile);

      // Show success message
      Fluttertoast.showToast(
        msg: "Employee created successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
      isLoading.value = false;

      // Navigate back

      Get.back(canPop: true, closeOverlays: false, result: true);
    } catch (e, stack) {
      _logger.e('Error creating employee: $e');
      _logger.e('Stack trace: $stack');
      Fluttertoast.showToast(msg: 'Failed to create employee: ${e.toString()}');
    } finally {
      isLoading.value = false;
    }
  }
}
