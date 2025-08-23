import 'package:get/get.dart';
import 'package:hrms_app/app/core/utils/enums.dart';
import 'package:hrms_app/app/data/repositories/__task.dart';
import 'package:hrms_app/app/data/services/user_service.dart';
import 'package:hrms_app/service_locator.dart';
import 'package:logger/logger.dart';

import '../../data/models/task/task_model.dart';

class TaskListController extends GetxController {
  final TaskRepository _taskRepository = sl<TaskRepository>();
  final UserService _userService = sl<UserService>();
  final Logger _logger = Logger();

  // Observable variables
  final RxList<TaskModel> tasks = <TaskModel>[].obs;
  final RxBool isLoading = false.obs;
  final RxBool hasError = false.obs;
  final RxString errorMessage = ''.obs;

  // Filter variables
  final RxString selectedFilter = 'All'.obs;
  final RxList<String> filterOptions = ['All', 'Completed'].obs;

  // Sorting variables
  final RxBool sortByDate = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchTasks();
  }

  // Fetch tasks based on user role
  Future<void> fetchTasks() async {
    try {
      isLoading.value = true;
      hasError.value = false;
      errorMessage.value = '';

      final tasks = await _taskRepository.fetchTasks();
      this.tasks.value = tasks;
    } catch (e) {
      _logger.e('Error fetching tasks: $e');
      hasError.value = true;
      errorMessage.value = 'Failed to load tasks. Please try again.';
    } finally {
      isLoading.value = false;
    }
  }

  // Apply filters to the tasks list
  List<TaskModel> getFilteredTasks() {
    if (selectedFilter.value == 'All') {
      return tasks;
    } else {
      final status = selectedFilter.value.toLowerCase();
      return tasks
          .where((task) => task.status.toLowerCase() == status)
          .toList();
    }
  }

  // Change the selected filter
  void changeFilter(String filter) {
    selectedFilter.value = filter;
    update();
  }

  // Toggle sort by date
  void toggleSortByDate() {
    sortByDate.value = !sortByDate.value;
    if (sortByDate.value) {
      tasks.sort((a, b) {
        if (a.createdAt == null || b.createdAt == null) return 0;
        return b.createdAt!.compareTo(a.createdAt!); // Newest first
      });
    } else {
      tasks.sort((a, b) {
        if (a.createdAt == null || b.createdAt == null) return 0;
        return a.createdAt!.compareTo(b.createdAt!); // Oldest first
      });
    }
    update();
  }

  // Update task status
  Future<void> updateTaskStatus(int? taskId, String newStatus) async {
    if (taskId == null) return;

    try {
      isLoading.value = true;

      final success = await _taskRepository.updateTaskStatus(taskId, newStatus);

      if (success) {
        // Update local task list
        final index = tasks.indexWhere((task) => task.id == taskId);
        if (index != -1) {
          // Create a new task with updated status
          final currentTask = tasks[index];
          final updatedTask = TaskModel(
            id: currentTask.id,
            taskTitle: currentTask.taskTitle,
            taskDescription: currentTask.taskDescription,
            deadline: currentTask.deadline,
            priority: currentTask.priority,
            employeeId: currentTask.employeeId,
            employeeName: currentTask.employeeName,
            status: newStatus, // Update status
            userId: currentTask.userId,
            shopId: currentTask.shopId,

            createdAt: currentTask.createdAt,
            department: currentTask.department,
          );
          tasks[index] = updatedTask;
          update();
        }
      } else {
        throw Exception('Failed to update task status');
      }
    } catch (e) {
      _logger.e('Error updating task status: $e');
      hasError.value = true;
      errorMessage.value = 'Failed to update task status. Please try again.';
    } finally {
      isLoading.value = false;
    }
  }

  // Get user role for UI decisions (like showing FAB)
  Future<String> getUserRole() async {
    final user = await _userService.getCurrentUser();
    if (user == null) return 'employee';

    if (user.role == UserRole.admin) {
      return 'admin';
    } else if (user.role == UserRole.hr) {
      return 'hr';
    } else {
      return 'employee';
    }
  }
}
