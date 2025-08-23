import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hrms_app/app/data/models/employee/employee_model.dart';

import '../core/theme/app_colors.dart';
import '../core/theme/app_text_styles.dart';

class EmployeeCard extends StatelessWidget {
  final EmployeeModel employee;
  final VoidCallback? onDelete;
  const EmployeeCard({super.key, required this.employee, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: employee.profileImage.isNotEmpty
                      ? NetworkImage(employee.profileImage)
                      : null,
                  backgroundColor: Colors.grey[300],
                  child: employee.profileImage.isEmpty
                      ? Icon(Icons.person, size: 40, color: Colors.grey[600])
                      : null,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        employee.employeeName,
                        style: AppTextStyles.h4,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Shop Name - ${employee.shopName}',
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                      Text(
                        'Employee ID - ${employee.id}',
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Profile - ${employee.designation.toUpperCase()}',
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Salary - ₹ ${employee.salary}',
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Shift Timing - ${employee.shiftTiming}',
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(height: 24),
            InkWell(
              onTap: () => _showDeleteConfirmation(context, employee.id),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.delete_outline,
                    size: 18,
                    color: Colors.red,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Delete Employee',
                    style: AppTextStyles.labelLarge.copyWith(
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDeleteConfirmation(BuildContext context, int employeeId) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Employee'),
        content: const Text('Are you sure you want to delete this employee?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              onDelete?.call();
            },
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
