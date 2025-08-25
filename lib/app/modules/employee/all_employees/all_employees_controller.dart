import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hrms_app/app/data/models/employee/employee_model.dart';
import 'package:hrms_app/app/data/repositories/__employee.dart';
import 'package:hrms_app/app/data/services/user_service.dart';
import 'package:hrms_app/service_locator.dart';
import 'package:logger/logger.dart';

import '../../../core/utils/enums.dart';

class AllEmployeesController extends GetxController {
  final EmployeeRepository employeeRepository = sl<EmployeeRepository>();

  // Observable variables
  final RxBool isLoading = false.obs;
  final RxList<EmployeeModel> employees = <EmployeeModel>[].obs;
  final RxList<EmployeeModel> filteredEmployees = <EmployeeModel>[].obs;
  final RxString searchQuery = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchAllEmployees();

    // Listen for changes in the search query
    ever(searchQuery, (_) => filterEmployees());
  }

  // Fetch all employees across all shops
  Future<void> fetchAllEmployees() async {
    try {
      isLoading.value = true;
      final user = sl<UserService>()
          .getCurrentUserSync(); // Get all employees from repository

      final List<EmployeeModel> fetchedEmployees =
          await employeeRepository.getEmployees(
        shopId: (user != null && user.role == UserRole.admin)
            ? null
            : (user?.shopId != null ? (user!.shopId) : null),
      );
      employees.assignAll(fetchedEmployees);
      filteredEmployees.assignAll(fetchedEmployees);
    } catch (e, stack) {
      Logger().d('Error fetching employees: $e');
      Logger().e('Stack trace: $stack');
      Fluttertoast.showToast(msg: 'Error fetching employees');
    } finally {
      isLoading.value = false;
    }
  }

  // Filter employees based on search query
  void filterEmployees() {
    final query = searchQuery.value.toLowerCase();
    if (query.isEmpty) {
      filteredEmployees.assignAll(employees);
    } else {
      filteredEmployees.assignAll(
        employees.where((employee) =>
            employee.employeeName.toLowerCase().contains(query) ||
            employee.email.toLowerCase().contains(query) ||
            employee.phoneNumber.toLowerCase().contains(query) ||
            employee.designation.toLowerCase().contains(query) ||
            employee.shopName.toLowerCase().contains(query)),
      );
    }
  }

  // Filter employees by shop
  void filterByShop(int shopId) async {
    try {
      isLoading.value = true;
      if (shopId == 0) {
        // Show all employees
        await fetchAllEmployees();
      } else {
        // Filter by shop ID
        final user = sl<UserService>().getCurrentUserSync();
        final List<EmployeeModel> allEmployees =
            await employeeRepository.getEmployees(
          shopId: (user != null && user.role == UserRole.admin) ? null : null,
        );
        employees.assignAll(allEmployees.where((e) => e.shopId == shopId));
        filteredEmployees.assignAll(employees);
      }
    } catch (e) {
      Logger().e('Error filtering by shop: $e');
    } finally {
      isLoading.value = false;
    }
  }

  // Delete employee
  Future<void> deleteEmployee(int employeeId) async {
    try {
      isLoading.value = true;

      // Remove employee from local list
      employees.removeWhere((e) => e.id == employeeId);
      filteredEmployees.removeWhere((e) => e.id == employeeId);

      Get.snackbar(
        'Success',
        'Employee deleted successfully',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to delete employee: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  // Navigate to employee profile
  void viewEmployeeProfile(EmployeeModel employee) {
    Get.toNamed('/employee-profile', arguments: employee);
  }
}
