import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hrms_app/app/core/utils/enums.dart';
import 'package:hrms_app/app/core/utils/extensions/widget_rols.dart';
import 'package:hrms_app/app/data/models/users/user_model.dart';
import 'package:hrms_app/app/data/repositories/__employee.dart';
import 'package:hrms_app/app/data/repositories/__home.dart';
import 'package:hrms_app/app/data/services/user_service.dart';
import 'package:hrms_app/app/modules/employee/all_employees/all_employees_controller.dart';
import 'package:hrms_app/app/routes/app_routes.dart';
import 'package:hrms_app/service_locator.dart';
import 'package:logger/logger.dart';

import '../../data/models/home/home_model.dart';
import '../attendance/attendance_controller.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();
  final _logger = Logger();

  // Observable variables
  final RxInt selectedIndex = 0.obs;
  final Rx<UserModel?> user = Rx<UserModel?>(null);
  final RxBool isLoading = false.obs;
  final RxDouble scrollOffset = 0.0.obs; // For tracking scroll position
  final dayNames = ["Sun", "Mon", "Tues", "Wed", "Thurs", "Fri", "Sat"];
  final homeModel = (HomeModel()).obs;

  final RxInt totalHr = 0.obs;
  final RxInt totalEmployees = 0.obs;

  final attendanceController = Get.isRegistered<AttendanceController>()
      ? Get.find<AttendanceController>()
      : Get.put(AttendanceController());

  final employeeListController = Get.isRegistered<AllEmployeesController>()
      ? Get.find<AllEmployeesController>()
      : Get.put(AllEmployeesController());

  // Navigation items for different roles
  final List<Map<String, dynamic>> hrNavItems = [
    {
      'icon': 'dashboard',
      'label': 'Dashboard',
      'route': '/dashboard',
    },
    {
      'icon': 'people',
      'label': 'Employees',
      'route': '/employee-list',
    },
    {
      'icon': 'access_time',
      'label': 'Attendance',
      'route': '/attendance',
    },
    {
      'icon': 'assignment',
      'label': 'Leave',
      'route': '/leave-management',
    },
    {
      'icon': 'account_balance_wallet',
      'label': 'Payroll',
      'route': '/payroll',
    },
  ];

  final List<Map<String, dynamic>> employeeNavItems = [
    {
      'icon': 'home',
      'label': 'Home',
      'route': '/home',
    },
    {
      'icon': 'access_time',
      'label': 'Attendance',
      'route': '/my-attendance',
    },
    {
      'icon': 'assignment',
      'label': 'Leave',
      'route': '/my-leaves',
    },
    {
      'icon': 'receipt',
      'label': 'Payslip',
      'route': '/my-payslip',
    },
    {
      'icon': 'person',
      'label': 'Profile',
      'route': '/profile',
    },
  ];

  @override
  void onInit() {
    super.onInit();
    _loadUserData();
  }

  // Get navigation items based on user role
  List<Map<String, dynamic>> get navigationItems {
    return user.value?.designation == 'hr' ? hrNavItems : employeeNavItems;
  }

  // Handle clock in/out action
  void handleClockAction() {
    Get.defaultDialog(
      title: 'Punch In/Out',
      middleText: 'Do you want to punch in now?',
      onConfirm: () {
        // Handle the punch in logic
        Get.back();
        Get.snackbar(
          'Success',
          'You have successfully punched in at ${DateTime.now().hour}:${DateTime.now().minute.toString().padLeft(2, '0')}',
          snackPosition: SnackPosition.BOTTOM,
        );
      },
      onCancel: () {},
      textConfirm: 'Punch In',
      textCancel: 'Cancel',
    );
  }

  // Navigate to specific route
  void navigateToRoute(String route) {
    Get.toNamed(route);
  }

  // Logout
  void logout() {
    Get.defaultDialog(
      title: 'Logout',
      middleText: 'Are you sure you want to logout?',
      onConfirm: () {
        Get.back();
        Get.offAllNamed('/login');
      },
      onCancel: () {},
      textConfirm: 'Yes',
      textCancel: 'No',
    );
  }

  Future<void> loadEmployeeList() async {
    try {
      final userService = sl<UserService>();
      final user = userService.getCurrentUserSync();
      // Get the current user using UserService
      if (user == null || user.role == UserRole.admin) {
        return;
      }

      _logger.d('User loaded: ${user.toJson()}');

      homeModel.value = await sl<HomeRepository>().homeEmployeeList();

      attendanceController.loadTodayAttendance(
        homeModel.value.attendance,
      );
      // Call repository method with user ID
    } catch (e, stack) {
      _logger.e('Error loading employee list: $e');
      _logger.e('Stack trace: $stack');
    } finally {
      isLoading.value = false;
    }
  }

  // Load user data
  Future<void> _loadUserData() async {
    try {
      isLoading.value = true;
      await loadAllEmployees();

      await loadEmployeeList();
      user.value = await sl<UserService>().getCurrentUser();
    } catch (e) {
      Logger().e('Error loading user data: $e');
    } finally {
      isLoading.value = false;
    }
  }

  // Refresh data
  Future<void> refreshData() async {
    final token = await sl<UserService>().getHeaders();
    log(token.toString());
    await _loadUserData();
    await loadAllEmployees();
    await employeeListController.fetchAllEmployees();
  }

  // load ALL employees
  Future<void> loadAllEmployees() async {
    try {
      isLoading.value = true;

      final allEmployees = await sl<EmployeeRepository>().getEmployees();

      final hrCount =
          allEmployees.where((e) => e.designation.toLowerCase() == "hr").length;

      final employeeCount =
          allEmployees.where((e) => e.designation.toLowerCase() != "hr").length;
      _logger.f('HR Count: $hrCount, Employee Count: $employeeCount');
      totalHr.value = hrCount;
      totalEmployees.value = employeeCount;
    } catch (e, stack) {
      Logger().e('Error loading all employees: $e');
      Logger().e('Stack trace: $stack');
    } finally {
      isLoading.value = false;
    }
  }

  // Update scroll position
  void updateScrollPosition(double position) {
    scrollOffset.value = position;
  }

  // Navigate to create employee screen
  void navigateToCreateEmployee() {
    Get.toNamed(AppRoutes.addEmployee)?.then((value) {
      if (value == true) {
        // If an employee was created, refresh the employee list
        loadAllEmployees();
        loadEmployeeList();
      }
    });
  }
}
