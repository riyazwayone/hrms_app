import 'package:get/get_connect/connect.dart';
import 'package:hrms_app/app/core/constants/api.dart';
import 'package:hrms_app/app/data/models/shop/shop_model.dart';
import 'package:hrms_app/app/data/services/user_service.dart';
import 'package:hrms_app/service_locator.dart';
import 'package:logger/logger.dart';

class ShopRepository extends GetConnect {
  final _logger = Logger();

  // Create a shop
  Future<ShopModel> createShop(ShopModel shop) async {
    try {
      // In a real app, this would be an API call
      _logger.d('Creating shop: ${shop.toJson()}');
      final headers = await sl<UserService>().getHeaders();
      final response =
          await post(Api.createShopApi, shop.toJson(), headers: headers);
      _logger.d(response.body);

      if (response.status.hasError) {
        throw Exception('Failed to create shop');
      }

      _logger.d(response.body);

      if (response.statusCode == 200) {
        final json = response.body;
        return ShopModel(
          id: json['shop']['shop_id'], // Simulate server-generated ID
          shopName: shop.shopName,
          shopContactNumber: shop.shopContactNumber,
          shopAddress: shop.shopAddress,
          email: shop.email,
          description: shop.description,
          createdAt: DateTime.now(), // Simulate createdAt
        );
      }

      throw Exception('Failed to create shop');
    } catch (e, stack) {
      _logger.e('Error creating shop: $e');
      _logger.e('Stack trace: $stack');
      rethrow;
    }
  }

  // Get user's shops
  Future<List<ShopModel>> getUserShops(int userId) async {
    try {
      _logger.d('Getting shops for user: $userId');

      final headers = await sl<UserService>().getHeaders();
      final response = await get(Api.getUserShopsApi, headers: headers);
      _logger.d(response.body);

      if (response.status.hasError) {
        throw Exception('Failed to get user shops');
      }

      if (response.statusCode != 200) {
        throw Exception('Failed to get user shops');
      }

      final json = response.body;
      final shops = json['data'] as List<dynamic>;
      return shops.map((shop) => ShopModel.fromJson(shop)).toList();
    } catch (e, stack) {
      _logger.e('Error getting user shops: $e');
      _logger.e('Stack trace: $stack');
      rethrow;
    }
  }
}
