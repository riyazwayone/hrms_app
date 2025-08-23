class Api {
  static const baseUrl = 'http://192.168.1.41/hrms';

  // Employee || HR Auth
  static const employeeLoginApi = '$baseUrl/employee_login.php';
  static const createEmployeeApi = '$baseUrl/create_employee.php';

  // Admin Auth
  static const registerApi = '$baseUrl/register.php';
  static const loginApi = '$baseUrl/login.php';

  // Subscription
  static const getPlansApi = '$baseUrl/get_plan.php';
  static const subscriptionPlansApi = '$baseUrl/select_plan.php';

  static const checkInApi = '$baseUrl/attendance.php';
  static const checkOutApi =
      '$baseUrl/attendance.php'; // Same endpoint with different payload
  static const attendanceHistoryApi = '$baseUrl/attendance_history.php';
  static const attendanceDetailsApi = '$baseUrl/attendance_details.php';
  static const employeeHomeApi = '$baseUrl/home_screen.php';
  static const checkAuthApi = '$baseUrl/check_auth.php';

  // Shop Management
  static const createShopApi = '$baseUrl/create_shop.php';
  static const getUserShopsApi = '$baseUrl/fetch_shops.php';
  static const fetchAllEmployeesApi = '$baseUrl/fetch_all_employees.php';
  static const fetchEmployeesApi = '$baseUrl/fetch_employees.php';
  static const fetchTasksApi = '$baseUrl/fetch_task.php';
  static const createTaskApi = '$baseUrl/create_task.php';
}
