import 'dart:convert';
import 'package:get/get.dart';
import 'package:hrms_app/app/data/models/home/home_model.dart';
import 'package:hrms_app/service_locator.dart';
import 'package:logger/logger.dart';

import '../../core/constants/api.dart';
import '../models/users/user_model.dart';
import '../services/user_service.dart';

abstract class HomeRepository {
  Future<HomeModel> homeEmployeeList();
}

class HomeRepositoryImpl extends GetConnect implements HomeRepository {
  final _logger = Logger();

  @override
  Future<HomeModel> homeEmployeeList() async {
    final user = sl<UserService>().getCurrentUserSync();
    if (user == null) {
      _logger.e('No user found, redirecting to login');
      return HomeModel();
    }

    final response = await get(Api.employeeHomeApi,
        query: {"recruiter_id": user.id.toString()});
    if (response.status.hasError) {
      throw Exception('Failed to login');
    }

    final body = jsonDecode(response.bodyString ?? '{}');

    return HomeModel.fromJson(body['data']);
  }
}
