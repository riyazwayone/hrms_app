import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrms_app/app/core/theme/app_colors.dart';
import 'package:hrms_app/app/modules/chat/chat_user_list_screen.dart';
import 'package:hrms_app/app/global_widgets/custom_app_bar.dart';
import 'package:hrms_app/app/data/services/chat_socket_service.dart';
import 'package:hrms_app/app/routes/app_routes.dart';

class ChatHomeScreen extends StatelessWidget {
  const ChatHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Chat',
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome message
              Text(
                'Welcome to Chat',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Connect with your team members',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 24),

              // Chat options
              _buildChatOption(
                context,
                title: 'Direct Messages',
                subtitle: 'Chat one-on-one with team members',
                icon: Icons.message,
                onTap: () => Get.to(() => const ChatUserListScreen()),
              ),
              const SizedBox(height: 16),

              // More features that could be implemented later
              _buildChatOption(
                context,
                title: 'Group Chats',
                subtitle: 'Coming soon',
                icon: Icons.group,
                onTap: () => Get.snackbar(
                  'Coming Soon',
                  'Group chat functionality will be available soon',
                  snackPosition: SnackPosition.BOTTOM,
                ),
                enabled: false,
              ),
              const SizedBox(height: 16),

              _buildChatOption(
                context,
                title: 'Announcements',
                subtitle: 'Coming soon',
                icon: Icons.campaign,
                onTap: () => Get.snackbar(
                  'Coming Soon',
                  'Announcements feature will be available soon',
                  snackPosition: SnackPosition.BOTTOM,
                ),
                enabled: false,
              ),

              const SizedBox(height: 16),

              // Debug option - only visible in debug mode
              _buildChatOption(
                context,
                title: 'Socket Debug',
                subtitle: 'Check socket connection status',
                icon: Icons.bug_report,
                onTap: () => Get.toNamed(AppRoutes.socketDebug),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChatOption(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required VoidCallback onTap,
    bool enabled = true,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: enabled ? onTap : null,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: enabled
                        ? AppColors.primary.withOpacity(0.1)
                        : Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    icon,
                    color: enabled ? AppColors.primary : Colors.grey,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: enabled ? AppColors.textPrimary : Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 14,
                          color: enabled
                              ? AppColors.textSecondary
                              : Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),
                if (enabled)
                  const Icon(Icons.chevron_right, color: AppColors.primary)
                else
                  Icon(Icons.lock_outline, color: Colors.grey[400], size: 18),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
