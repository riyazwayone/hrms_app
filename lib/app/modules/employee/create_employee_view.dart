import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hrms_app/app/core/constants/app_constants.dart';
import 'package:hrms_app/app/core/theme/app_colors.dart';
import 'package:hrms_app/app/core/utils/extensions/widget_rols.dart';
import 'package:hrms_app/app/global_widgets/custom_button.dart';
import 'package:hrms_app/app/global_widgets/custom_text_field.dart';
import 'package:hrms_app/app/modules/employee/create_employee_controller.dart';

class CreateEmployeeView extends GetView<CreateEmployeeController> {
  const CreateEmployeeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create New Employee'),
      ),
      body: Obx(() {
        return Stack(
          fit: StackFit.expand, // Ensure Stack fills the available space
          children: [
            _buildForm(context),
            if (controller.isLoading.value)
              Container(
                color: Colors.black.withOpacity(0.3),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
          ],
        );
      }),
    );
  }

  Widget _buildForm(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Employee Information'),
            const SizedBox(height: 16.0),

            // Profile Image Upload
            _buildProfileImagePicker(),
            const SizedBox(height: 24.0),

            // Name field
            CustomTextField(
              controller: controller.nameController,
              labelText: 'Full Name',
              prefixIcon: SvgPicture.asset(
                AppConstants.userSvg,
                width: 20,
                colorFilter: const ColorFilter.mode(
                  AppColors.primary,
                  BlendMode.srcIn,
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter employee name';
                }
                return null;
              },
            ),
            const SizedBox(height: 16.0),

            // Email field
            CustomTextField(
              controller: controller.emailController,
              labelText: 'Email Address',
              keyboardType: TextInputType.emailAddress,
              prefixIcon: SvgPicture.asset(
                AppConstants.mailSvg,
                width: 20,
                colorFilter: const ColorFilter.mode(
                  AppColors.primary,
                  BlendMode.srcIn,
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter email address';
                }
                if (!GetUtils.isEmail(value)) {
                  return 'Please enter a valid email address';
                }
                return null;
              },
            ),
            const SizedBox(height: 16.0),

            // Phone field
            CustomTextField(
              controller: controller.phoneController,
              labelText: 'Phone Number',
              keyboardType: TextInputType.phone,
              prefixIcon: SvgPicture.asset(
                AppConstants.phoneSvg,
                width: 20,
                colorFilter: const ColorFilter.mode(
                  AppColors.primary,
                  BlendMode.srcIn,
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter phone number';
                }
                if (!GetUtils.isPhoneNumber(value)) {
                  return 'Please enter a valid phone number';
                }
                return null;
              },
            ),
            const SizedBox(height: 24.0),
            // Designation dropdown
            if (controller.shopListController != null &&
                controller.shopListController!.shops.isNotEmpty)
              _buildDropdown(
                    label: 'Select Shop',
                    value: controller.selectedShop.value != null
                        ? controller.selectedShop.value!.shopName!
                        : controller.shopListController!.shops.first.shopName!,
                    items: controller.shopListController?.shops
                            .map((e) => e.shopName ?? '')
                            .where((name) => name.isNotEmpty)
                            .toList() ??
                        [],
                    onChanged: controller.updateShop,
                  ).forAdmin() ??
                  SizedBox.shrink(),
            const SizedBox(height: 24.0),

            _buildSectionTitle('Job Information'),
            const SizedBox(height: 16.0),

            // Designation dropdown
            _buildDropdown(
              label: 'Designation',
              value: controller.selectedDesignation.value,
              items: controller.designationOptions,
              onChanged: controller.updateDesignation,
            ),
            if (controller.selectedDesignation.value != 'hr' &&
                controller.allEmployeesController!.employees.isNotEmpty) ...{
              const SizedBox(height: 16.0),
              _buildDropdown(
                label: 'Assign HR',
                value: controller.selectedHr.value != null
                    ? controller.selectedHr.value!.employeeName
                    : controller.getHrList().first.employeeName,
                items:
                    controller.getHrList().map((e) => e.employeeName).toList(),
                onChanged: controller.updateHr,
              ),
            },

            const SizedBox(height: 16.0),

            // Employment Type dropdown
            _buildDropdown(
              label: 'Employment Type',
              value: controller.selectedEmploymentType.value,
              items: controller.employmentTypeOptions,
              onChanged: controller.updateEmploymentType,
            ),
            const SizedBox(height: 16.0),

            // Shift Type dropdown
            _buildDropdown(
              label: 'Shift Type',
              value: controller.selectedShiftType.value,
              items: controller.shiftTypeOptions,
              onChanged: controller.updateShiftType,
            ),
            const SizedBox(height: 16.0),

            // Salary field
            CustomTextField(
              controller: controller.salaryController,
              labelText: 'Salary',
              keyboardType: TextInputType.number,
              prefixText: '\₹ ',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter salary amount';
                }
                if (!GetUtils.isNum(value.replaceAll(',', ''))) {
                  return 'Please enter a valid salary amount';
                }
                return null;
              },
            ),
            const SizedBox(height: 24.0),

            _buildSectionTitle('Login Credentials'),
            const SizedBox(height: 16.0),

            // Password field
            Obx(() {
              return CustomTextField(
                controller: controller.passwordController,
                labelText: 'Password',
                obscureText: !controller.showPassword.value,
                prefixIcon: SvgPicture.asset(
                  AppConstants.lockSvg,
                  width: 20,
                  colorFilter: const ColorFilter.mode(
                    AppColors.primary,
                    BlendMode.srcIn,
                  ),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    controller.showPassword.value
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                  onPressed: controller.togglePasswordVisibility,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              );
            }),
            const SizedBox(height: 16.0),

            // Confirm Password field
            Obx(() {
              return CustomTextField(
                controller: controller.confirmPasswordController,
                labelText: 'Confirm Password',
                obscureText: !controller.showConfirmPassword.value,
                prefixIcon: SvgPicture.asset(
                  AppConstants.lockSvg,
                  width: 20,
                  colorFilter: const ColorFilter.mode(
                    AppColors.primary,
                    BlendMode.srcIn,
                  ),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    controller.showConfirmPassword.value
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                  onPressed: controller.toggleConfirmPasswordVisibility,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm password';
                  }
                  if (value != controller.passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              );
            }),
            const SizedBox(height: 32.0),

            // Submit button
            SizedBox(
              width: double.infinity,
              child: CustomButton(
                text: 'Create Employee',
                onPressed: controller.submitForm,
              ),
            ),
            const SizedBox(height: 24.0),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileImagePicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Obx(() => Center(
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  shape: BoxShape.circle,
                  image: controller.selectedImage.value != null
                      ? DecorationImage(
                          image: FileImage(controller.selectedImage.value!),
                          fit: BoxFit.cover,
                        )
                      : null,
                  border: Border.all(color: Colors.grey.shade300, width: 2),
                ),
                child: controller.selectedImage.value == null
                    ? Icon(
                        Icons.person,
                        size: 60,
                        color: Colors.grey[400],
                      )
                    : null,
              ),
            )),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 140,
              child: ElevatedButton.icon(
                onPressed: () => controller.pickImageFromGallery(),
                icon: const Icon(
                  Icons.image,
                  color: Colors.white,
                ),
                label: const Text('Gallery'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 16),
            SizedBox(
              width: 140,
              child: ElevatedButton.icon(
                onPressed: () => controller.takePhoto(),
                icon: const Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                ),
                label: const Text('Camera'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.secondary,
                  foregroundColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildDropdown({
    required String label,
    required String value,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          width: double.infinity, // Ensure full width
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: value,
              isExpanded: true, // Use full width
              items: items.map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item.capitalizeFirst ?? item,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                );
              }).toList(),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}
