import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrms_app/app/core/utils/extensions/widget_rols.dart';
import 'package:hrms_app/app/modules/attendance/attendance_list_view.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import 'profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: AppColors.surface,
        elevation: 0,
      ),
      body: Obx(() => controller.isLoading.value
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // Action buttons
                  _buildActionButtons(),
                ],
              ),
            )),
    );
  }

  Widget _buildActionButtons() {
    return Column(
      children: [
        // Profile button
        settingsItem(Icons.person, AppColors.primary, 'Personal Details',
            () => controller.viewProfileDetails()),

        // Create new shop button
        settingsItem(Icons.local_print_shop_sharp, AppColors.secondary,
            'Create a New Shop', () {
          controller.createShop();
        }).forAdmin(),

        // Monthly Attendance
        settingsItem(
            Icons.calendar_today, AppColors.warning, 'Monthly Attendance', () {
          Get.to(() => AttendanceListView(
              employeeId: controller.userModel.value!.id,
              employeeName: controller.userModel.value!.name));
        }).notForAdmin(),

        // Settings button
        // settingsItem(Icons.settings, AppColors.primary, 'Settings',
        //     controller.goToSettings),

        // Logout button
        settingsItem(
            Icons.logout, AppColors.error, 'Logout', controller.logout),
      ].whereType<Widget>().toList(),
    );
  }

  Widget settingsItem(
      IconData icon, Color iconColor, String title, VoidCallback onTap) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: ListTile(
        onTap: onTap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        tileColor: AppColors.surface,
        leading: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: iconColor.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: iconColor,
          ),
        ),
        title: Text(
          title,
          style: AppTextStyles.bodyMedium.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: AppColors.textSecondary,
        ),
      ),
    );
  }
}
