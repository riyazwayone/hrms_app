import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hrms_app/app/core/theme/app_colors.dart';
import 'package:hrms_app/app/core/theme/app_gaps.dart';
import 'package:hrms_app/service_locator.dart';

import '../../../core/constants/app_constants.dart';
import '../../../routes/app_routes.dart';
import '../home_controller.dart';

class AdminHomeView extends StatelessWidget {
  final HomeController controller;
  final ScrollController scrollController;

  const AdminHomeView(
      {super.key, required this.controller, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: controller.refreshData,
          child: ListView(
            controller: scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            children: [
              _buildHeader(),
              const SizedBox(height: 10),
              _buildShopBanner(),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Overview",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              _buildOverviewCards(),
              const SizedBox(height: 20),
              _buildCreateEmployeeCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: const Color(0xFF9CB70B),
                child: Text(
                  'A',
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.user.value?.name ?? "",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    controller.user.value?.role.name.toUpperCase() ?? "",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Stack(
                children: [
                  Icon(
                    Icons.notifications_outlined,
                    size: 30,
                    color: Colors.black54,
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
              // Gap(AppGaps.small),
              // IconButton(
              //   onPressed: () {
              //     Get.toNamed(AppRoutes.chatHome);
              //   },
              //   icon: Icon(
              //     Icons.message_outlined,
              //     size: 30,
              //   ),
              //   color: Colors.black54,
              // ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildShopBanner() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      color: Color(0xFFF8C146),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.diamond_outlined,
            color: Colors.white,
            size: 24,
          ),
          const SizedBox(width: 10),
          Text(
            'You create a 1 shop',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOverviewCards() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Obx(() => Column(
            children: [
              _buildStatCard(
                number: controller.totalHr.toString(),
                title: 'HR Created:',
                subtitle: 'HR managers onboarded',
                color: Color(0xFF9CB70B),
                textColor: Color(0xFF9CB70B),
                imagePath: AppConstants.ringGreenPng,
              ),
              const SizedBox(height: 16),
              _buildStatCard(
                number: controller.totalEmployees.toString(),
                title: 'Employees:',
                subtitle: 'Active workforce in system',
                color: Colors.red.shade300,
                textColor: Colors.red.shade300,
                imagePath: AppConstants.ringRedPng,
              ),
            ],
          )),
    );
  }

  Widget _buildStatCard({
    required String number,
    required String title,
    required String subtitle,
    required Color color,
    required Color textColor,
    required String imagePath,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                number,
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          Positioned(
            right: -10,
            top: -10,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: AppColors.primaryLight,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                  topRight: Radius.circular(15),
                ),
              ),
              child: Icon(
                Icons.chevron_right,
                color: Colors.white,
                size: 25,
                shadows: [
                  Shadow(
                    color: color,
                    blurRadius: 0,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: -20,
            bottom: -20,
            child: Image.asset(
              imagePath,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCreateEmployeeCard() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Get.toNamed(AppRoutes.addEmployee);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF9CB70B),
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Create Employee',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Add new employees to your organization.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
