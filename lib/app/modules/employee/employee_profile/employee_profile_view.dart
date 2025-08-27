import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrms_app/app/core/theme/app_colors.dart';
import 'package:hrms_app/app/core/theme/app_text_styles.dart';
import 'package:hrms_app/app/core/utils/extensions/duration_to_ago.dart';
import 'package:hrms_app/app/data/models/employee/employee_model.dart';
import 'package:hrms_app/app/modules/employee/employee_profile/employee_profile_controller.dart';
import 'package:hrms_app/app/data/services/chat_socket_service.dart';
import 'package:hrms_app/service_locator.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../attendance/attendance_list_view.dart';
import '../../chat/chat_conversation_screen.dart';

class EmployeeProfileView extends GetView<EmployeeProfileController> {
  final EmployeeModel employee;

  const EmployeeProfileView({
    super.key,
    required this.employee,
  });

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
          'Professional Details',
          style: AppTextStyles.h4.copyWith(color: AppColors.textPrimary),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildProfileHeader(),
            _buildInfoCard(),
            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: OutlinedButton(
                onPressed: () {
                  Get.to(() => AttendanceListView(
                        employeeId: employee.id,
                        employeeName: employee.employeeName,
                      ));
                },
                child: Text('View Attendance'),
              ),
            ),
            _buildAttendanceInfo(),
            _buildPerformanceInfo(),
            // if (employee.designation.toLowerCase() == 'employee')
            //   _buildReportingManager(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Delete Employee'),
                      content: const Text(
                          'Are you sure you want to delete this employee?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            controller.deleteEmployee(employee.id);
                          },
                          child: const Text('Delete',
                              style: TextStyle(color: Colors.red)),
                        ),
                      ],
                    ),
                  );
                },
                label: const Text('Delete Employee'),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          // Profile image
          CircleAvatar(
            radius: 32,
            backgroundImage: employee.profileImage.isNotEmpty
                ? CachedNetworkImageProvider(
                    employee.profileImage,
                    errorListener: (p0) {
                      print("Error loading image");
                    },
                  )
                : null,
            backgroundColor: Colors.grey[300],
            child: employee.profileImage.isEmpty
                ? Icon(Icons.person, size: 40, color: Colors.grey[600])
                : null,
          ),
          const SizedBox(width: 16),
          // Employee name and contact
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  employee.employeeName,
                  style: AppTextStyles.h4.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  '+${employee.phoneNumber}',
                  style: AppTextStyles.bodyMedium
                      .copyWith(color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          // Contact buttons
          Row(
            children: [
              _buildIconButton(Icons.phone, Colors.green, () {
                launchUrlString('tel:${employee.phoneNumber}');
              }),
              const SizedBox(width: 12),
              _buildIconButton(Icons.message, Colors.blue, () {
                final chatService = sl<ChatSocketService>();
                // Check if the current user can message this employee
                if (!chatService
                    .canMessageUser(employee.designation.toString())) {
                  Get.snackbar(
                    'Permission Denied',
                    'You do not have permission to message this user',
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.red.withOpacity(0.8),
                    colorText: Colors.white,
                  );
                  return;
                }

                // Ensure chat service is connected before navigating
                if (!chatService.isConnected.value) {
                  chatService.reconnect().then((_) {
                    // Navigate after reconnection attempt
                    Get.to(() => ChatConversationScreen(
                          receiverId: employee.id.toString(),
                          receiverName: employee.employeeName,
                          receiverAvatar: employee.profileImage,
                        ));
                  });
                } else {
                  // Navigate directly if already connected
                  Get.to(() => ChatConversationScreen(
                        receiverId: employee.id.toString(),
                        receiverName: employee.employeeName,
                        receiverAvatar: employee.profileImage,
                      ));
                }
              }),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard() {
    return Container(
      margin: const EdgeInsets.only(top: 1),
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Column(
        children: [
          _buildInfoRow('Employe id', employee.id.toString().padLeft(4, '0')),
          _divider(),
          _buildInfoRow('Department', 'Development'),
          _divider(),
          _buildInfoRow('Designation', employee.designation),
          _divider(),
          _buildInfoRow('Salary', '₹ ${employee.salary}'),
          _divider(),
          _buildInfoRow('Shift', employee.shiftType),
          _divider(),
          _buildInfoRow(
              'Employment Type',
              employee.employmentType.isEmpty
                  ? 'Regular'
                  : employee.employmentType),
          _divider(),
          _buildInfoRow('Shop Name', employee.shopName),
        ],
      ),
    );
  }

  Widget _buildAttendanceInfo() {
    // Mock data for attendance stats
    return GestureDetector(
      onTap: () {
        Get.toNamed(
          '/employee-attendance-details',
          arguments: {
            'employeeId': employee.id,
            'employeeName': employee.employeeName,
          },
        );
      },
      child: Container(
        margin: const EdgeInsets.only(top: 16),
        child: Row(
          children: [
            Expanded(
              child: _buildAttendanceCard(
                employee.inTime?.toAmPmString() ?? "Not Yet",
                'Punch In',
                Icons.login,
              ),
            ),
            Expanded(
              child: _buildAttendanceCard(
                employee.outTime?.toAmPmString() ?? "Not Yet",
                'Punch Out',
                Icons.logout,
                isActive: false,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPerformanceInfo() {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Row(
        children: [
          Expanded(
            child: _buildPerformanceCard(
              '${employee.punchInPercentage}%',
              'On Time',
              Icons.check_circle_outline,
              Colors.green,
            ),
          ),
          Expanded(
            child: _buildPerformanceCard(
              '${employee.punchInDays} Days',
              'Total Attendance',
              Icons.calendar_today,
              AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReportingManager() {
    return Container(
      margin: const EdgeInsets.only(top: 16, bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          // Manager profile image
          CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(
              'https://randomuser.me/api/portraits/men/32.jpg',
            ),
          ),
          const SizedBox(width: 16),
          // Manager details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Mike Luies',
                  style: AppTextStyles.h5.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Reporting Manager',
                  style:
                      AppTextStyles.bodySmall.copyWith(color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          // Contact buttons
          Row(
            children: [
              _buildIconButton(Icons.phone, Colors.green, () {
                launchUrlString('tel:${employee.phoneNumber}');
              }),
              const SizedBox(width: 12),
              _buildIconButton(Icons.message, Colors.amber, () {}),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAttendanceCard(String title, String subtitle, IconData icon,
      {bool isActive = true}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyles.h5.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                subtitle,
                style: AppTextStyles.bodySmall.copyWith(
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey[300]!, width: 1),
            ),
            child: Icon(
              icon,
              color: isActive ? Colors.black : Colors.grey[400],
              size: 18,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPerformanceCard(
      String title, String subtitle, IconData icon, Color iconColor) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyles.h5.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                subtitle,
                style: AppTextStyles.bodySmall.copyWith(
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey[300]!, width: 1),
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 18,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: AppTextStyles.bodyMedium,
          ),
          Text(
            value,
            style: AppTextStyles.bodyMedium.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _divider() {
    return const Divider(height: 1, thickness: 0.5);
  }

  Widget _buildIconButton(IconData icon, Color color, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color.withOpacity(0.1),
        ),
        child: Icon(
          icon,
          color: color,
          size: 20,
        ),
      ),
    );
  }
}
