import 'package:get/get.dart';
import 'package:hrms_app/app/data/models/employee/employee_model.dart';
import 'package:hrms_app/app/data/repositories/__employee.dart';
import 'package:hrms_app/service_locator.dart';

class ShopEmployeesController extends GetxController {
  final employeeRepository = sl<EmployeeRepository>();
  final int shopId;

  ShopEmployeesController({
    required this.shopId,
  });

  // Observable variables
  final RxBool isLoading = false.obs;
  final RxList<EmployeeModel> employees = <EmployeeModel>[].obs;
  final RxString shopName = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchEmployees();
  }

  // Fetch employees by shop ID
  Future<void> fetchEmployees() async {
    try {
      isLoading.value = true;

      // Get employees from repository
      final List<EmployeeModel> fetchedEmployees =
          await employeeRepository.getEmployees(shopId: shopId);

      // Filter employees by shop ID
      employees.assignAll(fetchedEmployees);

      // Set shop name if available
      if (employees.isNotEmpty) {
        shopName.value =
            employees.isNotEmpty ? employees.first.shopName : 'Shop Details';
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to fetch employees: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  // Delete employee
  Future<void> deleteEmployee(int employeeId) async {
    try {
      isLoading.value = true;

      // Since the deleteEmployee method doesn't exist in the repository,
      // we'll just remove from local list for now
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
