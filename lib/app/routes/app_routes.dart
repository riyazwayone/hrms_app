abstract class AppRoutes {
  // Initial route
  static const String initial = '/';

  // Onboarding routes
  static const String onboarding = '/onboarding';
  static const String roleSelection = '/role-selection';

  // Authentication routes
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgot-password';
  static const String resetPassword = '/reset-password';
  static const String emailVerification = '/email-verification';

  // Subscription routes
  static const String subscriptionPlans = '/subscription-plans';
  static const String subscriptionDetails = '/subscription-details';

  // Shop routes
  static const String createShop = '/create-shop';
  static const String shopList = '/shop-list';

  // Employee routes
  static const String shopEmployees = '/shop-employees';
  static const String allEmployees = '/all-employees';
  static const String employeeProfile = '/employee-profile';

  // Debug routes
  static const String socketDebug = '/socket-debug'; // Main app routes
  static const String home = '/home';
  static const String dashboard = '/dashboard';

  // Profile routes
  static const String profile = '/profile';
  static const String profileDetails = '/profile-details';
  static const String editProfile = '/edit-profile';
  static const String settings = '/settings';

  // HR specific routes
  static const String employeeList = '/employee-list';
  static const String employeeDetails = '/employee-details';
  static const String addEmployee = '/add-employee';
  static const String attendance = '/attendance';
  static const String employeeAttendanceDetails =
      '/employee-attendance-details';
  static const String leave = '/leave';
  static const String leaveManagement = '/leave-management';
  static const String payroll = '/payroll';
  static const String performance = '/performance';

  // Employee specific routes
  static const String myAttendance = '/my-attendance';
  static const String applyLeave = '/apply-leave';
  static const String myLeaves = '/my-leaves';
  static const String myPayslip = '/my-payslip';
  static const String documents = '/documents';
  static const String helpSupport = '/help-support';

  // Task routes
  static const String createTask = '/create-task';
  static const String taskList = '/task-list';
  static const String taskDetails = '/task-details';

  // Chat routes
  static const String chatHome = '/chat-home';
  static const String chatUserList = '/chat-user-list';
  static const String chatConversation = '/chat-conversation';

  // Common routes
  static const String notifications = '/notifications';
  static const String search = '/search';
  static const String calendar = '/calendar';
  static const String reports = '/reports';
}
