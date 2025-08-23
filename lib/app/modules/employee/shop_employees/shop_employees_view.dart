import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrms_app/app/core/theme/app_colors.dart';
import 'package:hrms_app/app/core/theme/app_text_styles.dart';
import 'package:hrms_app/app/global_widgets/employee_card.dart';
import 'package:hrms_app/app/modules/employee/shop_employees/shop_employees_controller.dart';

class ShopEmployeesView extends GetView<ShopEmployeesController> {
  const ShopEmployeesView({super.key});

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
        title: Obx(() => Text(
              'Employees - ${controller.shopName.value}',
              style: AppTextStyles.h4.copyWith(color: AppColors.textPrimary),
            )),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.employees.isEmpty) {
          return _buildEmptyState();
        }

        return RefreshIndicator(
            onRefresh: controller.fetchEmployees, child: _buildEmployeeList());
      }),
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
            'There are no employees in this shop',
            style: AppTextStyles.bodyMedium.copyWith(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildEmployeeList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: controller.employees.length,
      itemBuilder: (context, index) {
        final employee = controller.employees[index];
        return EmployeeCard(
          employee: employee,
          onDelete: () => controller.deleteEmployee(employee.id),
        );
      },
    );
  }
}
