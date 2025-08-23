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

  // Get mock data for demonstration
  List<TaskModel> getMockTasksData() {
    return [
      // Today's tasks
      TaskModel(
        id: 1,
        taskTitle: 'Full Stack Developer Interview',
        taskDescription:
            'It is a long established fact that a reader will be distracted by the readable content.',
        deadline: DateTime.now().add(const Duration(hours: 3)),
        priority: 'High',
        employeeId: 1,
        employeeName: 'John Doe',
        status: 'pending',
        assignedBy: 'Tech Head',
        createdAt: DateTime.now(),
      ),

      // Yesterday's tasks
      TaskModel(
        id: 2,
        taskTitle: 'New Candidate Document Verification',
        taskDescription:
            'It is a long established fact that a reader will be distracted by the readable content.',
        deadline: DateTime.now().subtract(const Duration(days: 1)),
        priority: 'Medium',
        employeeId: 2,
        employeeName: 'Jane Smith',
        status: 'completed',
        assignedBy: 'HR Manager',
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
      ),

      // Tasks from earlier
      TaskModel(
        id: 3,
        taskTitle: 'Update Employee Database',
        taskDescription:
            'Review and update all employee records in the system.',
        deadline: DateTime.now().subtract(const Duration(days: 3)),
        priority: 'Low',
        employeeId: 1,
        employeeName: 'John Doe',
        status: 'completed',
        assignedBy: 'System Admin',
        createdAt: DateTime.now().subtract(const Duration(days: 3)),
      ),

      TaskModel(
        id: 4,
        taskTitle: 'Prepare Monthly Report',
        taskDescription: 'Create performance report for all departments.',
        deadline: DateTime.now().add(const Duration(days: 2)),
        priority: 'High',
        employeeId: 3,
        employeeName: 'Robert Johnson',
        status: 'pending',
        assignedBy: 'Tech Head',
        createdAt: DateTime.now().subtract(const Duration(days: 2)),
      ),
    ];
  }

  // Update task status
  Future<bool> updateTaskStatus(int taskId, String newStatus) async {
    try {
      // In a real app, this would update the status in an API or database
      _logger.d('Updating task $taskId status to: $newStatus');
      // Mock success response
      return true;
    } catch (e) {
      _logger.e('Error updating task status: $e');
      return false;
    }
  }
}
