import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrms_app/app/core/utils/extensions/widget_rols.dart';
import 'package:hrms_app/app/data/services/user_service.dart';
import 'package:hrms_app/app/modules/profile/profile_controller.dart';
import 'package:hrms_app/service_locator.dart';

class ProfileDetailsView extends GetView<ProfileController> {
  const ProfileDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    // Get data from either provided employee, user, or current logged in user

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'Personal Details',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Image Section
            Container(
              color: Colors.grey[50],
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Column(
                children: [
                  // Profile Image
                  Center(
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage:
                          controller.userModel.value?.profileImage != null
                              ? CachedNetworkImageProvider(
                                  controller.userModel.value!.profileImage!,
                                  errorListener: (p0) {
                                    print("User profile image not found");
                                  },
                                )
                              : const AssetImage(
                                      'assets/images/profile_placeholder.webp')
                                  as ImageProvider,
                      backgroundColor: Colors.grey[200],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Employee ID
                  Text(
                    'Employee Id - ${controller.userModel.value?.id.toString().padLeft(4, '0')}',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Employee Name
                  Text(
                    controller.userModel.value?.name ?? 'No Name',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // Personal Information Section
            Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _buildInfoRow('Position',
                      controller.userModel.value?.role.name ?? 'No Position'),
                  _divider(),
                  _buildInfoRow(
                          'Plan Name',
                          controller.userModel.value?.plan?.planName
                                  .toUpperCase() ??
                              "Unknown")
                      .forAdmin(),
                  Column(
                    children: [
                      _divider(),
                      _buildInfoRow(
                          'Department',
                          controller.userModel.value?.designation
                                  .toUpperCase() ??
                              "Unknown"),
                      _divider(),
                      _buildInfoRow('Salary',
                          '₹ ${controller.userModel.value?.salary ?? 0}'),
                      _divider(),
                      _buildInfoRow(
                          'Shift',
                          controller.userModel.value?.shiftTiming ??
                              'No Shift'),
                      _divider(),
                      _buildInfoRow(
                          'Employment Type',
                          controller.userModel.value?.shiftType ??
                              'No Employment Type')
                    ],
                  ).notForAdmin()
                ].whereType<Widget>().toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 16,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _divider() {
    return Divider(
      height: 1,
      thickness: 0.5,
      color: Colors.grey[200],
    );
  }
}
