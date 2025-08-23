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

  @override
  void onInit() {
    super.onInit();
    fetchAllEmployees();
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
            : (user?.shopId != null ? int.tryParse(user!.shopId) : null),
      );
      employees.assignAll(fetchedEmployees);
    } catch (e, stack) {
      Logger().d('Error fetching employees: $e');
      Logger().e('Stack trace: $stack');
      Fluttertoast.showToast(msg: 'Error fetching employees');
    } finally {
      isLoading.value = false;
    }
  }

  // Filter employees by shop
  void filterByShop(int shopId) {
    if (shopId == 0) {
      // Show all employees
      fetchAllEmployees();
    } else {
      // Filter by shop ID
      final allEmployees = employeeRepository.getEmployees();
      allEmployees.then((list) {
        employees.assignAll(list.where((e) => e.shopId == shopId));
      });
    }
  }

  // Delete employee
  Future<void> deleteEmployee(int employeeId) async {
    try {
      isLoading.value = true;

      // Remove employee from local list
      employees.removeWhere((e) => e.id == employeeId);

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
}
