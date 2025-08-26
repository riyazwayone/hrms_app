import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hrms_app/app/core/constants/api.dart';
import 'package:hrms_app/app/data/models/employee/employee_model.dart';
import 'package:hrms_app/service_locator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

import '../services/user_service.dart';

class EmployeeRepository extends GetConnect {
  final _logger = Logger();

  // Create employee
  Future<bool> createEmployee(EmployeeModel employee, XFile? imageFile) async {
    try {
      // In a real app, this would be an API call
      // For demo purposes, we'll just return true
      _logger.d('Creating employee: ${employee.toJson()}');

      final headers = await sl<UserService>().getHeaders();
      final updatedHeader = headers..remove('Content-Type');
      final formData = FormData({
        ...employee.toJson(),
        if (imageFile != null)
          'profile_image':
              MultipartFile(imageFile.path, filename: imageFile.name),
      });
      _logger.f("Updated headers: $updatedHeader");
      final response = await post(Api.createEmployeeApi, formData,
          headers: headers, contentType: 'multipart/form-data');
      _logger.f(response.body);

      if (response.body['status'] != "success") {
        _logger.e('Error creating employee: ${response.body['message']}');
        throw response.body['message'] ?? 'Error creating employee';
      }

      return response.statusCode == 200;
    } catch (e, stack) {
      _logger.e('Error creating employee: $e');
      _logger.e('Stack trace: $stack');
      rethrow;
    }
  }

  // Get employee by ID
  Future<EmployeeModel> getEmployeeById(int id) async {
    try {
      // In a real app, this would be an API call
      // For demo purposes, we'll just return a mock employee
      _logger.d('Getting employee by ID: $id');

      // Simulate API call delay
      await Future.delayed(const Duration(seconds: 1));

      return const EmployeeModel(
        id: 1,
        employeeName: 'John Doe',
        email: 'john.doe@example.com',
        phoneNumber: '1234567890',
        designation: 'employee',
        employmentType: 'full-time',
        shiftType: 'day',
        shiftTiming: '9:00 AM - 6:00 PM',
      );
    } catch (e, stack) {
      _logger.e('Error getting employee by ID: $e');
      _logger.e('Stack trace: $stack');
      rethrow;
    }
  }

  // Get all employees
  Future<List<EmployeeModel>> getEmployees({int? shopId}) async {
    try {
      _logger.d('Getting all employees by shopId: $shopId');
      final headers = await sl<UserService>().getHeaders();
      final request = shopId == null
          ? get(Api.fetchAllEmployeesApi, headers: headers)
          : get(Api.fetchEmployeesApi,
              query: {'shop_id': shopId.toString()}, headers: headers);
      final response = await request;
      _logger.f(response.body);
      if (response.status.hasError) {
        _logger.e('Error fetching employees: ${response.statusText}');
        return [];
      }

      final data = response.body['data'] as List<dynamic>;

      _logger.f(data);
      // return [];
      return data.map((item) => EmployeeModel.fromJson(item)).toList();
    } catch (e, stack) {
      _logger.e('Error getting all employees: $e');
      _logger.e('Stack trace: $stack');
      rethrow;
    }
  }

  // Delete employee
  Future<bool> deleteEmployee(int id) async {
    try {
      _logger.d('Deleting employee by ID: $id');
      final headers = await sl<UserService>().getHeaders();
      final response = await delete(Api.deleteEmployeeApi,
          query: {'id': id.toString()}, headers: headers);
      _logger.f(response.body);
      if (response.status.hasError) {
        _logger.e('Error deleting employee: ${response.statusText}');
        return false;
      }
      return true;
    } catch (e, stack) {
      _logger.e('Error deleting employee: $e');
      _logger.e('Stack trace: $stack');
      rethrow;
    }
  }
}
