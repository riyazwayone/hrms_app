class AppConstants {
  // App information
  static const String appName = 'HRMS App';
  static const String appVersion = '1.0.0';

  // API endpoints
  static const String baseUrl = 'https://api.hrms.com';
  static const String loginEndpoint = '/auth/login';
  static const String registerEndpoint = '/auth/register';
  static const String profileEndpoint = '/user/profile';
  static const String attendanceEndpoint = '/attendance';
  static const String leaveEndpoint = '/leave';
  static const String payrollEndpoint = '/payroll';

  // Storage keys
  static const String userTokenKey = 'user_token';
  static const String userRoleKey = 'user_role';
  static const String userDataKey = 'user_data';
  static const String rememberMeKey = 'remember_me';
  static const String themeKey = 'theme_mode';

  // User roles
  static const String hrRole = 'HR';
  static const String employeeRole = 'Employee';
  static const String managerRole = 'Manager';
  static const String adminRole = 'Admin';

  // Leave types
  static const String sickLeave = 'Sick Leave';
  static const String casualLeave = 'Casual Leave';
  static const String annualLeave = 'Annual Leave';
  static const String maternityLeave = 'Maternity Leave';
  static const String paternityLeave = 'Paternity Leave';

  // Leave status
  static const String pending = 'Pending';
  static const String approved = 'Approved';
  static const String rejected = 'Rejected';
  static const String cancelled = 'Cancelled';

  // Attendance status
  static const String present = 'Present';
  static const String absent = 'Absent';
  static const String late = 'Late';
  static const String halfDay = 'Half Day';

  // Date formats
  static const String dateFormat = 'dd/MM/yyyy';
  static const String timeFormat = 'HH:mm';
  static const String dateTimeFormat = 'dd/MM/yyyy HH:mm';

  // Validation
  static const int minPasswordLength = 8;
  static const int maxPasswordLength = 50;
  static const int minNameLength = 2;
  static const int maxNameLength = 50;

  // UI Constants
  static const double defaultPadding = 16.0;
  static const double defaultMargin = 8.0;
  static const double defaultBorderRadius = 12.0;
  static const double defaultElevation = 2.0;

  // Animation durations
  static const Duration defaultAnimationDuration = Duration(milliseconds: 300);
  static const Duration fastAnimationDuration = Duration(milliseconds: 150);
  static const Duration slowAnimationDuration = Duration(milliseconds: 500);

  // Error messages
  static const String genericError = 'Something went wrong. Please try again.';
  static const String networkError =
      'Network error. Please check your connection.';
  static const String serverError = 'Server error. Please try again later.';
  static const String loginError = 'Invalid email or password.';
  static const String registrationError =
      'Registration failed. Please try again.';

  // Success messages
  static const String loginSuccess = 'Login successful!';
  static const String registrationSuccess = 'Account created successfully!';
  static const String profileUpdateSuccess = 'Profile updated successfully!';
  static const String passwordChangeSuccess = 'Password changed successfully!';

  // Assets images
  static const String logo = 'assets/images/logo.png';
  static const String googleLogo = 'assets/images/google_icon.png';
  // static const String splash = 'assets/images/splash.png';
  static const String onboarding = 'assets/images/intro_start.png';
  static const String onboardingHR2 = 'assets/images/intro_step_two_hr.png';
  static const String onboardingHR3 = 'assets/images/intro_step_three_hr.png';
  static const String onboardingHR4 = 'assets/images/intro_step_four_hr.png';

  static const String onboardingEMP2 = 'assets/images/intro_step_two_emp.png';
  static const String onboardingEMP3 = 'assets/images/intro_step_three_emp.png';

  // SVG Assets
  static const String mailSvg = 'assets/vectors/mail.svg';
  static const String lockSvg = 'assets/vectors/lock.svg';
  static const String userSvg = 'assets/vectors/user.svg';
  static const String usersSvg = 'assets/vectors/users.svg';
  static const String cloudSvg = 'assets/vectors/cloud.svg';
  static const String sunSvg = 'assets/vectors/sun.svg';
  static const String bellSvg = 'assets/vectors/bell.svg';
  static const String addUserSvg = 'assets/vectors/addUser.svg';
  static const String pointerRingSvg = 'assets/vectors/pointer_ring.svg';
  static const String phoneSvg = 'assets/vectors/phone.svg';
  static const String shopSvg = 'assets/vectors/shop.svg';
  static const String taskSvg = 'assets/vectors/task.svg';
  static const String homeSvg = 'assets/vectors/home.svg';

  // PNG
  static const String ringRedPng = 'assets/images/ring_red.png';
  static const String ringGreenPng = 'assets/images/ring_green.png';
}
