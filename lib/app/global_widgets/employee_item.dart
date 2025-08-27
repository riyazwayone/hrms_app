import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hrms_app/app/data/models/employee/employee_model.dart';

import '../core/constants/app_constants.dart';

class EmployeeItem extends StatelessWidget {
  final EmployeeModel employee;
  const EmployeeItem({super.key, required this.employee});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: CachedNetworkImage(
          imageUrl: employee.profileImage,
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => const CircleAvatar(
            radius: 40,
            backgroundImage:
                AssetImage('assets/images/profile_placeholder.webp'),
            child: Icon(Icons.person, size: 40, color: Colors.grey),
          ),
          errorListener: (value) {
            print("Employee image failed to load: $value");
          },
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  employee.employeeName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                SvgPicture.asset(
                  AppConstants.pointerRingSvg,
                  colorFilter: ColorFilter.mode(Colors.red, BlendMode.srcIn),
                )
              ],
            ),
            const SizedBox(height: 4),
            Text(
              'Employee Id - ${employee.id}',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Profile - ${employee.designation}',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Salary - ${employee.salary}',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Shift Timing - ${employee.shiftTiming}',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
