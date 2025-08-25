import 'package:get/get.dart';
import 'package:hrms_app/app/data/services/user_service.dart';
import 'package:hrms_app/app/routes/app_routes.dart';
import 'package:hrms_app/service_locator.dart';
import 'package:logger/logger.dart';

class ProfileController extends GetxController {
  static ProfileController get to => Get.find();

  // Observable variables
  final RxBool isLoading = false.obs;
  final RxString userName = 'John Doe'.obs;
  final RxString userEmail = 'john.doe@company.com'.obs;
  final RxString userRole = 'Employee'.obs;
  final RxString userDepartment = 'IT Department'.obs;
  final RxString userPhone = '+1 234 567 8900'.obs;

  @override
  void onInit() {
    super.onInit();
    loadUserProfile();
  }

  // Load user profile
  Future<void> loadUserProfile() async {
    try {
      isLoading.value = true;

      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));

      // Load user data from storage or API
      // Implementation here
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to load profile data',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  // Navigate to edit profile
  void editProfile() {
    Get.toNamed('/edit-profile');
  }

  // Navigate to profile details
  void viewProfileDetails() {
    Get.toNamed('/profile-details');
  }

  // Navigate to settings
  void goToSettings() {
    Get.toNamed('/settings');
  }

  // Logout
  void logout() {
    Get.defaultDialog(
      title: 'Logout',
      middleText: 'Are you sure you want to logout?',
      onConfirm: () {
        Get.back();
        Logger().f(sl<UserService>().getRole());
        sl<UserService>().clearUser();
        Get.offAllNamed(AppRoutes.login);
      },
      onCancel: () {},
      textConfirm: 'Yes',
      textCancel: 'No',
    );
  }
}
