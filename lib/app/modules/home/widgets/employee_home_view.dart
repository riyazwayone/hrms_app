import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:hrms_app/app/core/utils/extensions/widget_rols.dart';
import 'package:hrms_app/app/data/services/user_service.dart';
import 'package:hrms_app/app/modules/home/home_controller.dart';
import 'package:hrms_app/service_locator.dart';
import 'package:logger/logger.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/theme/app_colors.dart';
import '../../../global_widgets/employee_item.dart';
import 'sliver_appbar.dart';

class EmployeeHomeView extends StatelessWidget {
  final HomeController controller;
  final ScrollController scrollController;

  const EmployeeHomeView(
      {super.key, required this.controller, required this.scrollController});
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: controller.refreshData,
      child: CustomScrollView(
        controller: scrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          // Sticky header with profile section
          SliverAppBarWidget(user: sl<UserService>().getCurrentUserSync()!),

          // Main content
          SliverPadding(
            padding:
                const EdgeInsets.fromLTRB(16, 8, 16, 16), // Adjust top padding
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                // Welcome card (without the profile section)
                _buildWelcomeCardContent(),

                const SizedBox(height: 24),
                // Text(sl<UserService>().getCurrentUserSync()!.toString()),
                // Quick actions
                _buildQuickActions().forHr(),

                const SizedBox(height: 24),

                // Recent activities or stats
                _buildRecentActivities(),
              ].whereType<Widget>().toList()),
            ),
          ),
        ],
      ),
    );
  }

  // Welcome card content without the profile section
  Widget _buildWelcomeCardContent() {
    // Get current date for day selector
    final now = DateTime.now();
    final days = List.generate(
      5,
      (index) =>
          now.add(Duration(days: index - 2)), // 2 days before to 2 days after
    );

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 8), // Add a small margin at the top
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Day selector
          Container(
            height: 115,
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: days.length,
              itemBuilder: (context, index) {
                final day = days[index];
                final isToday = day.day == now.day;

                return Container(
                  width: 60,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    color: isToday ? const Color(0xFF9CB70B) : Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        day.day.toString(),
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: isToday ? Colors.white : Colors.black,
                        ),
                      ),
                      Text(
                        controller.dayNames[day.weekday % 7],
                        style: TextStyle(
                          fontSize: 16,
                          color: isToday ? Colors.white : Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // Weather section and time counter
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                // Weather icons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        _weatherIcon('cloud'),
                      ],
                    ),
                    _weatherIcon('sun'),
                    Stack(
                      children: [
                        SizedBox(
                          height: 80,
                        ),
                        _weatherIcon('cloud')
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 30),

                // Time counter
                Obx(() {
                  final elapsedTime =
                      controller.attendanceController.elapsedTime.value;

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _timeDisplay(
                          elapsedTime.inHours.toString().padLeft(2, '0')),
                      _timeDisplay(elapsedTime.inMinutes
                          .remainder(60)
                          .toString()
                          .padLeft(2, '0')),
                      _timeDisplay(elapsedTime.inSeconds
                          .remainder(60)
                          .toString()
                          .padLeft(2, '0')),
                      const Text(
                        "HRS",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  );
                }),
                const SizedBox(height: 30),

                // Divider
                Container(
                  height: 6,
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Obx(() => LinearProgressIndicator(
                        color: controller
                            .attendanceController.progressbarColor.value,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        value:
                            controller.attendanceController.shiftProgress.value,
                      )),
                ),
                const SizedBox(height: 20),

                // Shift timing
                const Text(
                  "Shift Time 09:00 AM to 06:00 PM",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),

                // Punch In button
                Obx(() => ElevatedButton(
                      onPressed: () {
                        // controller.loadEmployeeList();
                        // return;
                        Logger().d('Punch In button pressed');
                        controller.attendanceController.isCheckedIn.value
                            ? controller.attendanceController.checkOut()
                            : controller.attendanceController.checkIn();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            controller.attendanceController.isCheckedIn.value
                                ? AppColors.primary
                                : AppColors.secondary,
                        minimumSize: const Size(170, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Text(
                        controller.attendanceController.currentStatus.value,
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _weatherIcon(String type) {
    if (type == 'sun') {
      return Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(AppConstants.sunSvg),

              Container(
                width: 30,
                height: 30,
                decoration: const BoxDecoration(
                  color: Color(0xFFFFAA33),
                  shape: BoxShape.circle,
                ),
              ),
              // Sun rays
            ],
          ),
        ],
      );
    } else {
      return Column(
        children: [
          SvgPicture.asset(AppConstants.cloudSvg),
        ],
      );
    }
  }

  Widget _timeDisplay(String value) {
    return Container(
      width: 60,
      height: 60,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F7E1),
        borderRadius: BorderRadius.circular(8),
      ),
      alignment: Alignment.center,
      child: Text(
        value,
        style: const TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }

  Widget _buildQuickActions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Employee List header with Create User button
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Employee List',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton.icon(
                iconAlignment: IconAlignment.end,
                onPressed: () => controller.navigateToCreateEmployee(),
                icon: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      AppConstants.addUserSvg,
                      width: 16,
                      colorFilter:
                          ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                    )),
                label: Text(
                  'Create User',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Obx(
          () => Column(
            children: List.generate(
                controller.employeeListController.employees.length, (index) {
              final employee =
                  controller.employeeListController.employees[index];
              Logger().d('Employee: ${employee.profileImage}');
              return EmployeeItem(employee: employee);
            }),
          ),
        )

        // Employee list item
      ],
    );
  }

  // Removed unused _buildActionCard method

  // We don't need the Recent Activities section for this new design
  Widget _buildRecentActivities() {
    // Returning an empty container as this section is removed in the new design
    return Container();
  }

  Widget _buildClockInButton() {
    return InkWell(
      onTap: controller.handleClockAction,
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: AppColors.primary,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: const Icon(
          Icons.fingerprint,
          color: Colors.white,
          size: 28,
        ),
      ),
    );
  }
}
