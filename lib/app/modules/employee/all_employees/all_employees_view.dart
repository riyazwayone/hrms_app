import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrms_app/app/core/theme/app_colors.dart';
import 'package:hrms_app/app/core/theme/app_text_styles.dart';
import 'package:hrms_app/app/modules/employee/all_employees/all_employees_controller.dart';

import '../../../global_widgets/employee_card.dart';
import '../../../global_widgets/employee_item.dart';

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
          // Search bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (value) => controller.searchQuery.value = value,
              decoration: InputDecoration(
                hintText: 'Search employees...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
              ),
            ),
          ),

          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              if (controller.filteredEmployees.isEmpty) {
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
          Container(
            width: 200,
            child: ElevatedButton(
                onPressed: () {
                  controller.fetchAllEmployees();
                },
                child: const Text('Refresh')),
          )
        ],
      ),
    );
  }

  Widget _buildEmployeeList() {
    return RefreshIndicator(
      onRefresh: controller.fetchAllEmployees,
      child: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: controller.filteredEmployees.length,
        itemBuilder: (context, index) {
          final employee = controller.filteredEmployees[index];
          return GestureDetector(
            onTap: () => controller.viewEmployeeProfile(employee),
            child: EmployeeItem(
              employee: employee,
            ),
          );
        },
      ),
    );
  }
}
