import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrms_app/app/data/services/user_service.dart';
import 'package:logger/logger.dart';

import '../../../service_locator.dart';
import '../../core/constants/app_constants.dart';
import '../../core/utils/enums.dart';
import '../../data/repositories/__auth.dart';
import '../../routes/app_routes.dart';

class OnboardingController extends GetxController {
  static OnboardingController get to => Get.find();

  final getStatedPages = [
    {
      "hr": {
        "images": [
          AppConstants.onboarding,
          AppConstants.onboardingHR2,
          AppConstants.onboardingHR3,
          AppConstants.onboardingHR4,
        ],
        "titles": [
          "Welcome to Your HRMS App",
          "Disciplinary In Your Hand",
          "HR Simplified, On the Go",
          "Let's Get Started!",
        ],
        "descriptions": [
          "This onboarding will introduce you to the app's core features, including profile management, document retrieval, and request submissions. Follow the prompts to complete your setup.",
          "Welcome aboard! Let's get you set up quickly. This app will streamline your HR tasks, from accessing pay stubs to requesting time off.",
          "Experience the convenience of managing your HR tasks from anywhere. We'll guide you through the initial setup, ensuring you have seamless access to your important information.",
          "We're excited to have you on board! This quick setup will help you personalize your app and access the resources you need. Let's dive in!",
        ],
      },
      "Admin": {
        "images": [
          AppConstants.onboarding,
          AppConstants.onboardingHR2,
          AppConstants.onboardingHR3,
          AppConstants.onboardingHR4,
        ],
        "titles": [
          "Welcome to Your HRMS App",
          "Disciplinary In Your Hand",
          "HR Simplified, On the Go",
          "Let's Get Started!",
        ],
        "descriptions": [
          "This onboarding will introduce you to the app's core features, including profile management, document retrieval, and request submissions. Follow the prompts to complete your setup.",
          "Welcome aboard! Let's get you set up quickly. This app will streamline your HR tasks, from accessing pay stubs to requesting time off.",
          "Experience the convenience of managing your HR tasks from anywhere. We'll guide you through the initial setup, ensuring you have seamless access to your important information.",
          "We're excited to have you on board! This quick setup will help you personalize your app and access the resources you need. Let's dive in!",
        ],
      },
      "Employee": {
        "images": [
          AppConstants.onboarding,
          AppConstants.onboardingEMP2,
          AppConstants.onboardingEMP3,
        ],
        "titles": [
          "Explore Key Features",
          "You're All Set!\" or \"Ready to Go?",
        ],
        "descriptions": [
          "Quickly access your pay information, request time off, view important documents, and stay connected with company news. We'll show you how to navigate these essential tools.",
          "You're now ready to explore all the features of your [Your Company Name] app. If you need assistance, please refer to the help section or contact HR.",
        ],
      }
    }
  ];

  // Observable variables
  final RxInt currentPage = 0.obs;
  final RxString selectedRole = ''.obs;

  // Page controller for PageView
  late PageController pageController;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
    checkAuth();
  }

  void checkAuth() async {
    final authRepository = sl<AuthRepository>();
    final isAuthenticated = await authRepository.checkAuth();
    Logger().f(isAuthenticated);
    if (isAuthenticated) {
      sl<UserService>().getCurrentUser();
      Get.offAllNamed(AppRoutes.dashboard);
    }
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  // Handle page changes
  void onPageChanged(int page) {
    currentPage.value = page;
  }

  // Navigate to next page
  void nextPage() {
    if (currentPage.value < totalPages - 1) {
      currentPage.value++;
    } else {
      Get.toNamed(AppRoutes.login);
    }
  }

  // Navigate to previous page
  void previousPage() {
    if (currentPage.value > 0) {
      currentPage.value--;
    }
  }

  // Select user role
  void selectRole(String role) {
    Logger().f(role);
    sl<UserService>().setRole(
        UserRole.values.firstWhere((e) => e.name == role.toLowerCase()));
    selectedRole.value = role;
  }

  // Navigate to login page
  void goToLogin() {
    Get.offAllNamed('/login');
  }

  // Skip onboarding
  void skipOnboarding() {
    Get.offAllNamed('/login');
  }

  // Helper methods to get current role data
  List<String> get currentImages {
    final role = _getRoleKey();
    return List<String>.from(getStatedPages[0][role]?["images"] ?? []);
  }

  List<String> get currentTitles {
    final role = _getRoleKey();
    return List<String>.from(getStatedPages[0][role]?["titles"] ?? []);
  }

  List<String> get currentDescriptions {
    final role = _getRoleKey();
    return List<String>.from(getStatedPages[0][role]?["descriptions"] ?? []);
  }

  int get totalPages {
    final role = _getRoleKey();
    final pages = getStatedPages[0][role]?["titles"] as List<dynamic>? ?? [];
    return pages.length;
  }

  // Helper method to get the correct role key
  String _getRoleKey() {
    if (selectedRole.value.isEmpty) {
      return "hr"; // Default to hr for initial load
    }
    // Convert "HR" to "hr" and keep "Employee" as is
    return selectedRole.value == "HR" ? "hr" : selectedRole.value;
  }

  // Complete onboarding
  void completeOnboarding() {
    if (selectedRole.value.isNotEmpty) {
      // Save user role preference
      // StorageService.saveUserRole(selectedRole.value);
      Get.offAllNamed('/login');
    } else {
      Get.snackbar(
        'Error',
        'Please select your role to continue',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
