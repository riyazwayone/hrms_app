import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrms_app/app/core/theme/app_colors.dart';
import 'package:hrms_app/app/core/theme/app_text_styles.dart';
import 'package:hrms_app/app/modules/employee/all_employees/all_employees_controller.dart';

import '../../../global_widgets/employee_card.dart';

class AllEmployeesView extends GetView<AllEmployeesController> {
  const AllEmployeesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Employee',
          style: AppTextStyles.h4.copyWith(color: AppColors.textPrimary),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Shop filter can be added here

          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              if (controller.employees.isEmpty) {
                return _buildEmptyState();
              }

              return _buildEmployeeList();
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.people_outline,
            size: 80,
            color: Colors.grey,
          ),
          const SizedBox(height: 16),
          Text(
            'No employees found',
            style: AppTextStyles.h4.copyWith(color: Colors.grey),
          ),
          const SizedBox(height: 8),
          Text(
            'There are no employees in your organization',
            style: AppTextStyles.bodyMedium.copyWith(color: Colors.grey),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget _buildEmployeeList() {
    return RefreshIndicator(
      onRefresh: controller.fetchAllEmployees,
      child: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: controller.employees.length,
        itemBuilder: (context, index) {
          final employee = controller.employees[index];
          return EmployeeCard(
            employee: employee,
            onDelete: () => controller.deleteEmployee(employee.id),
          );
        },
      ),
    );
  }
}
