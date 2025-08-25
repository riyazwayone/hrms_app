import 'dart:convert';

import 'package:get/get_connect/connect.dart';
import 'package:logger/logger.dart';

import '../../../service_locator.dart';
import '../../core/constants/api.dart';
import '../models/subscription/plan_model.dart';
import '../services/user_service.dart';

abstract class SubscriptionRepository {
  Future<List<PlanModel>> getSubscriptionPlans();
  Future<bool> subscribeToPlan(int planId, Map<String, dynamic> paymentDetails);
}

class SubscriptionRepositoryImpl extends GetConnect
    implements SubscriptionRepository {
  final _logger = Logger();

  // Get all subscription plans
  @override
  Future<List<PlanModel>> getSubscriptionPlans() async {
    try {
      _logger.d('Getting subscription plans');
      final headers = await sl<UserService>().getHeaders();
      final response = await get(Api.getPlansApi, headers: headers);

      _logger.f(response.body);

      if (response.statusCode == 200) {
        final List<dynamic> data = response.body['plans'];
        return data.map((json) => PlanModel.fromJson(json)).toList();
      }

      throw Exception('Failed to load subscription plans');
    } catch (e, stack) {
      _logger.e('Error getting subscription plans: $e');
      _logger.e('Stack trace: $stack');
      rethrow;
    }
  }

  // Subscribe to a plan
  @override
  Future<bool> subscribeToPlan(
      int planId, Map<String, dynamic> paymentDetails) async {
    _logger.d('Subscribing to plan: $planId with details');

    final headers = await sl<UserService>().getHeaders();

    final response = await post(
      Api.subscriptionPlansApi,
      {
        'plan_id': "$planId",
      },
      headers: headers,
    );

    _logger.f(response.bodyString.toString());
    if (response.statusCode == 200) {
      final json = jsonDecode(response.bodyString ?? "");
      final plan = PlanModel.fromJson(json['plan']);
      final user = sl<UserService>().getCurrentUserSync();
      _logger.f(user?.toJson());
      final updatedUser = user!.copyWith(plan: plan);
      await sl<UserService>().saveUser(updatedUser);
      return true;
    }

    throw Exception('Failed to subscribe to plan');
  }
}
