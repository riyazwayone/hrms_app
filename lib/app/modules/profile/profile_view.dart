import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_outlined),
            onPressed: controller.editProfile,
          ),
        ],
      ),
      body: Obx(() => controller.isLoading.value
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // Profile header
                  _buildProfileHeader(),

                  const SizedBox(height: 32),

                  // Profile details
                  _buildProfileDetails(),

                  const SizedBox(height: 32),

                  // Action buttons
                  _buildActionButtons(),
                ],
              ),
            )),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // Profile picture
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.3),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const Icon(
              Icons.person,
              size: 50,
              color: AppColors.textOnPrimary,
            ),
          ),

          const SizedBox(height: 16),

          // Name
          Text(
            controller.userName.value,
            style: AppTextStyles.h4.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 4),

          // Role
          Text(
            controller.userRole.value,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.w500,
            ),
          ),

          const SizedBox(height: 4),

          // Department
          Text(
            controller.userDepartment.value,
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileDetails() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Contact Information',
            style: AppTextStyles.h6.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          _buildDetailItem(
            'Email',
            controller.userEmail.value,
            Icons.email_outlined,
          ),
          const SizedBox(height: 16),
          _buildDetailItem(
            'Phone',
            controller.userPhone.value,
            Icons.phone_outlined,
          ),
          const SizedBox(height: 16),
          _buildDetailItem(
            'Department',
            controller.userDepartment.value,
            Icons.business_outlined,
          ),
        ],
      ),
    );
  }

  Widget _buildDetailItem(String label, String value, IconData icon) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            size: 20,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: AppTextStyles.labelSmall.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: AppTextStyles.bodyMedium.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Column(
      children: [
        // Settings button
        ListTile(
          onTap: controller.goToSettings,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          tileColor: AppColors.surface,
          leading: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.info.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.settings_outlined,
              color: AppColors.info,
            ),
          ),
          title: Text(
            'Settings',
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

        const SizedBox(height: 16),

        // Logout button
        ListTile(
          onTap: controller.logout,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          tileColor: AppColors.surface,
          leading: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.error.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.logout,
              color: AppColors.error,
            ),
          ),
          title: Text(
            'Logout',
            style: AppTextStyles.bodyMedium.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.error,
            ),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}
