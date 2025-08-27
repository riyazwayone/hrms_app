import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hrms_app/app/data/models/shop/shop_model.dart';
import 'package:hrms_app/app/data/repositories/__shop.dart';
import 'package:hrms_app/app/routes/app_routes.dart';
import 'package:hrms_app/service_locator.dart';
import 'package:logger/logger.dart';

class CreateShopController extends GetxController {
  static CreateShopController get to => Get.find();
  final _logger = Logger();

  // Form controllers
  final nameController = TextEditingController();
  final contactNumberController = TextEditingController();
  final addressController = TextEditingController();
  final emailController = TextEditingController();
  final descriptionController = TextEditingController();

  // Observable variables
  final RxBool isLoading = false.obs;

  // Form key
  final formKey = GlobalKey<FormState>();

  @override
  void onClose() {
    nameController.dispose();
    contactNumberController.dispose();
    addressController.dispose();
    emailController.dispose();
    descriptionController.dispose();
    super.onClose();
  }

  // Validate email
  bool isValidEmail(String email) {
    return GetUtils.isEmail(email);
  }

  // Validate phone
  bool isValidPhone(String phone) {
    return GetUtils.isPhoneNumber(phone);
  }

  // Create shop
  Future<void> createShop() async {
    if (formKey.currentState?.validate() ?? false) {
      try {
        isLoading.value = true;

        final shop = ShopModel(
          shopName: nameController.text.trim(),
          shopContactNumber: contactNumberController.text.trim(),
          shopAddress: addressController.text.trim(),
          email: emailController.text.trim(),
          description: descriptionController.text.trim(),
        );

        _logger.d('Creating shop: ${shop.toJson()}');

        final createdShop = await sl<ShopRepository>().createShop(shop);

        _logger.d('Shop created successfully: ${createdShop.toJson()}');

        Fluttertoast.showToast(
            msg: 'Shop created successfully',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);

        // Navigate to dashboard after shop is created
        Get.offAllNamed(AppRoutes.dashboard);
      } catch (e, stack) {
        _logger.e('Error creating shop: $e');
        _logger.e('Stack trace: $stack');
        Get.snackbar(
          'Error',
          'Failed to create shop: ${e.toString()}',
          snackPosition: SnackPosition.BOTTOM,
        );
      } finally {
        isLoading.value = false;
      }
    }
  }
}
