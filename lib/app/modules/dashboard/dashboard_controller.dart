import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrms_app/app/core/utils/extensions/widget_rols.dart';

import '../../core/constants/app_constants.dart';

class DashboardController extends GetxController {
  static DashboardController get to => Get.find();

  final PageController pageController = PageController();
  final RxInt selectedIndex = 0.obs;
  // Observable variables
  final RxString employeeName = 'John Doe'.obs;
  final RxString employeeId = 'EMP001'.obs;
  final RxString department = 'Software Development'.obs;
  final RxString designation = 'Senior Developer'.obs;
  final RxBool isCheckedIn = false.obs;
  final RxString checkInTime = ''.obs;
  final RxString checkOutTime = ''.obs;
  final RxInt pendingLeaves = 2.obs;
  final RxInt totalLeaves = 25.obs;
  final RxInt usedLeaves = 8.obs;
  final RxDouble monthlyHours = 160.0.obs;
  final RxDouble workedHours = 120.5.obs;

  final navbarLabels = ['Home', 'Shops'.forAdmin(), 'Tasks', 'Team', 'Profile']
      .whereType<String>()
      .toList();

  final navbarIcons = [
    AppConstants.homeSvg,
    AppConstants.shopSvg.forAdmin(),
    AppConstants.taskSvg,
    AppConstants.usersSvg,
    AppConstants.userSvg
  ].whereType<String>().toList();

  void changeTabIndex(int index) {
    selectedIndex.value = index;
    pageController.jumpToPage(index);
  }

  // Quick actions
  final RxList<Map<String, dynamic>> quickActions = <Map<String, dynamic>>[
    {
      'title': 'Apply Leave',
      'icon': 'calendar',
      'color': '0xFF4CAF50',
      'route': '/leave'
    },
    {
      'title': 'View Payslip',
      'icon': 'receipt',
      'color': '0xFF2196F3',
      'route': '/payroll'
    },
    {
      'title': 'Attendance',
      'icon': 'access_time',
      'color': '0xFFFF9800',
      'route': '/attendance'
    },
    {
      'title': 'Directory',
      'icon': 'people',
      'color': '0xFF9C27B0',
      'route': '/directory'
    },
  ].obs;

  // Recent announcements
  final RxList<Map<String, dynamic>> recentAnnouncements =
      <Map<String, dynamic>>[
    {
      'title': 'Company Annual Meeting',
      'description': 'Join us for the annual company meeting this Friday.',
      'date': '2025-08-16',
      'priority': 'high'
    },
    {
      'title': 'New Health Insurance Policy',
      'description': 'Updated health insurance benefits are now available.',
      'date': '2025-08-14',
      'priority': 'medium'
    },
    {
      'title': 'Office Renovation Notice',
      'description': 'Office renovation will begin next week.',
      'date': '2025-08-12',
      'priority': 'low'
    },
  ].obs;

  @override
  void onInit() {
    super.onInit();
    loadDashboardData();
  }

  void loadDashboardData() {
    // Simulate loading data from API
    // In real app, this would fetch from your backend
  }

  void checkIn() {
    isCheckedIn.value = true;
    checkInTime.value = DateTime.now().toString().substring(11, 16);
    Get.snackbar(
      'Success',
      'Checked in successfully at ${checkInTime.value}',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void checkOut() {
    isCheckedIn.value = false;
    checkOutTime.value = DateTime.now().toString().substring(11, 16);
    Get.snackbar(
      'Success',
      'Checked out successfully at ${checkOutTime.value}',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void navigateToQuickAction(String route) {
    Get.toNamed(route);
  }

  void viewAllAnnouncements() {
    Get.toNamed('/announcements');
  }
}
