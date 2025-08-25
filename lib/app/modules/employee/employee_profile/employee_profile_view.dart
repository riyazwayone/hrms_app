import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrms_app/app/core/theme/app_colors.dart';
import 'package:hrms_app/app/core/theme/app_text_styles.dart';
import 'package:hrms_app/app/data/models/employee/employee_model.dart';

class EmployeeProfileView extends StatelessWidget {
  final EmployeeModel employee;

  const EmployeeProfileView({
    Key? key,
    required this.employee,
  }) : super(key: key);

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
            _buildAttendanceInfo(),
            _buildPerformanceInfo(),
            if (employee.designation.toLowerCase() == 'employee')
              _buildReportingManager(),
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
              _buildIconButton(Icons.phone, Colors.black),
              const SizedBox(width: 12),
              _buildIconButton(Icons.message, Colors.black),
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
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Row(
        children: [
          Expanded(
            child: _buildAttendanceCard(
              '09:00 AM',
              'Punch In',
              Icons.login,
            ),
          ),
          Expanded(
            child: _buildAttendanceCard(
              'Not Yet',
              '09:00 PM',
              Icons.logout,
              isActive: false,
            ),
          ),
        ],
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
              '96%',
              'On Time',
              Icons.check_circle_outline,
              Colors.green,
            ),
          ),
          Expanded(
            child: _buildPerformanceCard(
              '28 Days',
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
              _buildIconButton(Icons.phone, Colors.green),
              const SizedBox(width: 12),
              _buildIconButton(Icons.message, Colors.amber),
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

  Widget _buildIconButton(IconData icon, Color color) {
    return Container(
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
    );
  }
}
