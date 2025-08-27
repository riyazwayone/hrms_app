import 'package:get/get.dart';
import '../modules/attendance/attendance_list_view.dart';
import '../modules/attendance/attendance_list_binding.dart';
import '../modules/chat/chat_binding.dart';
import '../modules/debug/socket_debug_binding.dart';
import '../modules/debug/socket_debug_view.dart';
import 'app_routes.dart';
import '../modules/onboarding/onboarding_binding.dart';
import '../modules/onboarding/onboarding_view.dart';
import '../modules/auth/login_binding.dart';
import '../modules/auth/login_view.dart';
import '../modules/auth/register_binding.dart';
import '../modules/auth/register_view.dart';
import '../modules/home/home_binding.dart';
import '../modules/home/home_view.dart';
import '../modules/profile/profile_binding.dart';
import '../modules/profile/profile_view.dart';
import '../modules/profile/profile details/profile_details_binding.dart';
import '../modules/profile/profile details/profile_details_view.dart';
import '../modules/dashboard/dashboard_binding.dart';
import '../modules/dashboard/dashboard_view.dart';
import '../modules/leave/leave_binding.dart';
import '../modules/leave/leave_view.dart';

import '../modules/employee/create_employee_binding.dart';
import '../modules/employee/create_employee_view.dart';
import '../modules/task/create_task_binding.dart';
import '../modules/task/create_task_view.dart';
import '../modules/employee/shop_employees/shop_employees_binding.dart';
import '../modules/employee/shop_employees/shop_employees_view.dart';
import '../modules/employee/all_employees/all_employees_binding.dart';
import '../modules/employee/all_employees/all_employees_view.dart';
import '../modules/subscription/subscription_plan_binding.dart';
import '../modules/subscription/subscription_plan_view.dart';
import '../modules/subscription/subscription_details_binding.dart';
import '../modules/subscription/subscription_details_view.dart';
import '../modules/shop/create_shop_binding.dart';
import '../modules/shop/create_shop_view.dart';
import '../modules/shop/shop_list/shop_list_binding.dart';
import '../modules/shop/shop_list/shop_list_view.dart';
import '../modules/employee/employee_profile/employee_profile_binding.dart';
import '../modules/employee/employee_profile/employee_profile_view.dart';
import '../modules/attendance/ateendance_list_controller.dart';
import '../modules/chat/chat_home_screen.dart';
import '../modules/chat/chat_user_list_screen.dart';
import '../modules/chat/chat_conversation_screen.dart';

class AppPages {
  static const initial = AppRoutes.onboarding;

  static final routes = [
    // Chat Routes
    GetPage(
      name: AppRoutes.chatHome,
      page: () => const ChatHomeScreen(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: AppRoutes.chatUserList,
      page: () => const ChatUserListScreen(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: AppRoutes.chatConversation,
      page: () => ChatConversationScreen(
        receiverId: Get.arguments['receiverId'],
        receiverName: Get.arguments['receiverName'],
        receiverAvatar: Get.arguments['receiverAvatar'],
      ),
      binding: ChatBinding(),
    ),

    // Onboarding
    GetPage(
      name: AppRoutes.onboarding,
      page: () => OnboardingView(),
      binding: OnboardingBinding(),
    ),

    // Authentication
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),

    // Main App
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),

    // Profile
    GetPage(
      name: AppRoutes.profile,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.profileDetails,
      page: () => const ProfileDetailsView(),
      binding: ProfileDetailsBinding(),
    ),

    // Dashboard
    GetPage(
      name: AppRoutes.dashboard,
      page: () => const DashboardNavScreen(),
      binding: DashboardBinding(),
    ),

    // Leave Management
    GetPage(
      name: AppRoutes.leave,
      page: () => const LeaveView(),
      binding: LeaveBinding(),
    ),

    GetPage(
      name: AppRoutes.employeeAttendanceDetails,
      page: () => AttendanceListView(
        employeeId: Get.arguments['employeeId'],
        employeeName: Get.arguments['employeeName'],
      ),
      binding: AttendanceListBinding(),
    ),

    // Create Employee
    GetPage(
      name: AppRoutes.addEmployee,
      page: () => const CreateEmployeeView(),
      binding: CreateEmployeeBinding(),
    ),

    // Subscription
    GetPage(
      name: AppRoutes.subscriptionPlans,
      page: () => const SubscriptionPlanView(),
      binding: SubscriptionPlanBinding(),
    ),
    GetPage(
      name: AppRoutes.subscriptionDetails,
      page: () => const SubscriptionDetailsView(),
      binding: SubscriptionDetailsBinding(),
    ),

    // Shop
    GetPage(
      name: AppRoutes.createShop,
      page: () => const CreateShopView(),
      binding: CreateShopBinding(),
    ),
    GetPage(
      name: AppRoutes.shopList,
      page: () => const ShopListView(),
      binding: ShopListBinding(),
    ),

    // Employee
    GetPage(
      name: AppRoutes.shopEmployees,
      page: () => const ShopEmployeesView(),
      binding: ShopEmployeesBinding(),
    ),
    GetPage(
      name: AppRoutes.allEmployees,
      page: () => const AllEmployeesView(),
      binding: AllEmployeesBinding(),
    ),
    GetPage(
      name: AppRoutes.employeeProfile,
      page: () => EmployeeProfileView(employee: Get.arguments),
      binding: EmployeeProfileBinding(),
    ),

    // Debug
    GetPage(
      name: AppRoutes.socketDebug,
      page: () => SocketDebugView(),
      binding: SocketDebugBinding(),
    ),

    // Task
    GetPage(
      name: AppRoutes.createTask,
      page: () => const CreateTaskView(),
      binding: CreateTaskBinding(),
    ),
  ];
}
