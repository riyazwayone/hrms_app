import 'package:get/get.dart';
import 'package:hrms_app/app/core/utils/enums.dart';
import 'package:logger/logger.dart';
import 'package:hrms_app/app/data/services/user_service.dart';
import '../../core/constants/api.dart';
import '../models/task/task_model.dart';
import '../../../service_locator.dart';

class TaskRepository extends GetConnect {
  final _logger = Logger();

  final UserService _userService = sl<UserService>();

  // Create a new task
  Future<bool> createTask(TaskModel task) async {
    try {
      // Mock for now - in real app would use API
      _logger.d('Creating task: ${task.taskTitle}');
      final headers = await sl<UserService>().getHeaders();
      final response =
          await post(Api.createTaskApi, task.toJson(), headers: headers);

      _logger.f(response.body);

      return true;
    } catch (e) {
      _logger.e('Error creating task: $e');
      return false;
    }
  }

  // Fetch tasks based on user role
  Future<List<TaskModel>> fetchTasks({String? shopId}) async {
    try {
      final user = await _userService.getCurrentUser();

      if (user == null) {
        throw Exception('User not found');
      }

      String endpoint;

      if (user.role == UserRole.admin) {
        endpoint = '?user_id=${user.id}';
      } else if (user.role == UserRole.employee) {
        endpoint = '?employee_id=${user.id}';
      } else {
        endpoint = '?shop_id=$shopId';
      }

      _logger.d('Fetching tasks with endpoint: $endpoint');

      // For demo purposes, return mock data instead of making an API call
      // return getMockTasksData();
      final response = await get(Api.fetchTasksApi + endpoint);

      if (response.status.hasError) {
        throw Exception('Failed to load tasks');
      }

      final List<dynamic> taskData = response.body['tasks'];
      return taskData.map((json) => TaskModel.fromJson(json)).toList();
    } catch (e) {
      _logger.e('Error fetching tasks: $e');
      return [];
    }
  }

  // Update task status
  Future<bool> updateTaskStatus(int taskId, String newStatus) async {
    try {
      // In a real app, this would update the status in an API or database
      _logger.d('Updating task $taskId status to: $newStatus');
      final response = await put(Api.updateTaskStatusApi, {
        'task_id': taskId,
        'status': newStatus,
      });

      return response.statusCode == 200;
    } catch (e) {
      _logger.e('Error updating task status: $e');
      return false;
    }
  }
}
