import 'package:get/get.dart';
import 'package:hrms_app/app/data/models/shop/shop_model.dart';
import 'package:hrms_app/app/data/repositories/__shop.dart';
import 'package:hrms_app/service_locator.dart';

import '../../../routes/app_routes.dart';

class ShopListController extends GetxController
    with StateMixin<List<ShopModel>> {
  final shopRepository = sl<ShopRepository>();

  // Observable variables
  final RxBool isLoading = false.obs;
  final RxList<ShopModel> shops = <ShopModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchShops();
  }

  // Fetch all shops owned by the user
  Future<void> fetchShops() async {
    try {
      isLoading.value = true;

      // Get current user ID from user service (you'll need to adapt this)
      final userId = 1; // Replace with actual user ID

      // Fetch shops from repository
      final fetchedShops = await shopRepository.getUserShops(userId);
      if (fetchedShops.isEmpty) {
        change([], status: RxStatus.empty());
      }
      shops.value = fetchedShops;
      change(fetchedShops, status: RxStatus.success());
      // For development purposes, always add mock data
      // Remove this in production or when API is ready
      // Add mock shops for preview
      shops.addAll([]);
    } catch (e) {
      change(null, status: RxStatus.error());
    } finally {
      isLoading.value = false;
    }
  }

  // Navigate to shop details
  void navigateToShopDetails(ShopModel shop) {
    // Get.toNamed(AppRoutes.shopDetails, arguments: shop);
  }

  // Navigate to employee list for a shop
  void navigateToEmployeeList(ShopModel shop) {
    Get.toNamed(AppRoutes.shopEmployees, arguments: {'shopId': shop.id});
  }
}
