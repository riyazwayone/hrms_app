import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hrms_app/app/data/models/employee/employee_model.dart';
import 'package:hrms_app/app/data/repositories/__task.dart';
import 'package:hrms_app/app/data/models/task/task_model.dart';
import 'package:hrms_app/app/modules/employee/all_employees/all_employees_controller.dart';
import 'package:hrms_app/app/modules/home/home_controller.dart';
import 'package:hrms_app/app/modules/shop/shop_list/shop_list_controller.dart';
import 'package:logger/logger.dart';

import '../../../service_locator.dart';
import '../../data/services/user_service.dart';

class CreateTaskController extends GetxController {
  static CreateTaskController get to => Get.find();
  final _logger = Logger();

  // Form controllers
  final employeeController = TextEditingController();
  final shopController = TextEditingController();
  final selectedShopId = TextEditingController();
  final selectedShopAddress = TextEditingController();
  final departmentController = TextEditingController();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final deadlineController = TextEditingController();
  final userService = sl<UserService>();
  final descriptionFocusNode = FocusNode();

  // Observable variables
  final isShopSelected = false.obs;
  final Rx<DateTime?> selectedDate = Rx<DateTime?>(null);
  final RxString selectedPriority = 'Medium'.obs;
  final RxBool isLoading = false.obs;
  final shopEmployees = <EmployeeModel>[].obs;
  final allEmployeeController = Get.isRegistered<AllEmployeesController>()
      ? Get.find<AllEmployeesController>()
      : Get.put(AllEmployeesController());
  final shopListController = Get.isRegistered<ShopListController>()
      ? Get.find<ShopListController>()
      : Get.put(ShopListController());

  final RxInt selectedEmployeeId = 0.obs;

  // Form key for validation
  final formKey = GlobalKey<FormState>();

  // Options for priority dropdown
  final List<String> priorityOptions = ['Low', 'Medium', 'High', 'Urgent'];

  @override
  void onInit() {
    super.onInit();
    fetchEmployees();
  }

  @override
  void onClose() {
    employeeController.dispose();
    departmentController.dispose();
    titleController.dispose();
    descriptionController.dispose();
    deadlineController.dispose();
    super.onClose();
  }

  // Fetch employees list
  Future<void> fetchEmployees() async {
    try {
      isLoading.value = true;

      // Mock employee data for now
      // In a real app, you would call repository to get actual data
      // employees.value = [
      //   {'id': 1, 'name': 'John Doe', 'department': 'Development'},
      //   {'id': 2, 'name': 'Jane Smith', 'department': 'Design'},
      //   {'id': 3, 'name': 'Robert Johnson', 'department': 'Marketing'},
      //   {'id': 4, 'name': 'Emily Williams', 'department': 'HR'},
      // ];
    } catch (e) {
      _logger.e('Error fetching employees: $e');
    } finally {
      isLoading.value = false;
    }
  }

  // Select date
  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );

    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;
      deadlineController.text =
          '${picked.month}/${picked.day}/${picked.year.toString().substring(2)}';
    }
  }

  // Select employee
  void selectEmployee(int id, String name, String department) {
    selectedEmployeeId.value = id;
    employeeController.text = name;
    departmentController.text = department;
  }

  // Select shop
  void selectShop(int id, String name, String address) {
    selectedShopId.text = id.toString();
    shopController.text = name;
    selectedShopAddress.text = address;

    _logger.d('Shop selected: ${id.toString()}');

    final employees = allEmployeeController.employees
        .where((emp) => emp.shopId == id)
        .toList();
    if (employees.isEmpty) {
      Fluttertoast.showToast(msg: 'No employees found for this shop');
      shopEmployees.clear();
      isShopSelected.value = false;
      return;
    }
    _logger.d('Shop selected: ${employees.first.toJson()}');

    shopEmployees.assignAll(employees);
    isShopSelected.value = true;
  }

  // Validate form
  bool validateForm() {
    if (formKey.currentState!.validate()) {
      if (selectedDate.value == null) {
        Get.snackbar('Error', 'Please select a deadline date');
        return false;
      }
      return true;
    }
    return false;
  }

  // Create task
  Future<void> createTask() async {
    if (!validateForm()) return;

    try {
      isLoading.value = true;
      final user = userService.getCurrentUserSync();
      final task = TaskModel(
          taskTitle: titleController.text.trim(),
          department: departmentController.text.trim(),
          taskDescription: descriptionController.text.trim(),
          deadline: DateTime(
            selectedDate.value!.year,
            selectedDate.value!.month,
            selectedDate.value!.day,
          ),
          priority: selectedPriority.value,
          employeeId: selectedEmployeeId.value,
          shopId: int.tryParse(selectedShopId.text) ?? 0,
          employeeName: employeeController.text.trim(),
          assignedBy: user?.role.name ?? 'hr');

      // In a real app, send the task to a repository
      await sl<TaskRepository>().createTask(task);

      _logger.d('Task created: ${task.toJson()}');

      Get.back(result: true);
      Get.snackbar('Success', 'Task assigned successfully');
    } catch (e) {
      _logger.e('Error creating task: $e');
      Get.snackbar('Error', 'Failed to assign task');
    } finally {
      isLoading.value = false;
    }
  }
}
