import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hrms_app/app/data/services/user_service.dart';
import 'package:hrms_app/service_locator.dart';
import 'package:logger/logger.dart';

import '../../core/constants/api.dart';
import '../../core/utils/enums.dart';
import '../models/users/user_model.dart';

abstract class AuthRepository {
  Future<bool> checkAuth();
  Future<UserModel> employeeLogin(
      String email, String password, bool rememberMe);
  Future<UserModel> login(String email, String password, bool rememberMe);
  Future<UserModel> register(
      String fullName, String phone, String email, String password);
}

class AuthRepositoryImpl extends GetConnect implements AuthRepository {
  final _logger = Logger();

  @override
  Future<UserModel> register(
      String fullName, String phone, String email, String password) async {
    final response = await post(Api.registerApi, {
      'full_name': fullName,
      'mobile': phone,
      'email': email,
      'password': password,
    });
    _logger.f(response.body);
    if (response.status.hasError) {
      Fluttertoast.showToast(
          msg: response.body['message'] ?? 'Failed to login');
      throw Exception('Failed to login');
    }

    final body = jsonDecode(response.bodyString ?? '{}');

    final token = body['token'];
    _logger.d('Token: $token');

    sl<UserService>().saveToken(token);

    sl<UserService>().rememberMe(true);

    return UserModel.fromJson(body["user"]);
  }

  @override
  Future<UserModel> login(
      String email, String password, bool rememberMe) async {
    final response = await post(Api.loginApi, {
      'email': email,
      'password': password,
    });
    if (response.status.hasError) {
      throw Exception('Failed to login');
    }

    final body = jsonDecode(response.bodyString ?? '{}');

    _logger.d(body);

    final token = body['token'];
    _logger.d('Token: $token');

    sl<UserService>().saveToken(token);

    if (rememberMe) {
      sl<UserService>().rememberMe(true);
    }

    return UserModel.fromJson(body["user"]);
  }

  @override
  Future<UserModel> employeeLogin(
      String email, String password, bool rememberMe) async {
    final response = await post(Api.employeeLoginApi, {
      'email': email,
      'password': password,
    });

    _logger.f(response.body);

    if (response.status.hasError) {
      throw Exception('Failed to login');
    }

    final body = jsonDecode(response.bodyString ?? '{}');

    final token = body['token'];
    _logger.d('Token: $token');

    sl<UserService>().saveToken(token);

    if (rememberMe) {
      sl<UserService>().rememberMe(true);
    }

    return UserModel.fromJson(body["employee"]);
  }

  @override
  Future<bool> checkAuth() async {
    final userService = sl<UserService>();
    final isRemembered = await userService.isRememberMe();
    if (isRemembered) {
      final headers = await userService.getHeaders();
      final response = await get(Api.checkAuthApi, headers: headers);
      _logger.f(response.body);
      if (response.statusCode == 200) {
        final json = response.body['user'];
        if (json.containsKey('plan_id')) {
          if (json['plan_id'] != null) {
            sl<UserService>().saveUser(UserModel.fromJson(json));
            sl<UserService>().setRole(UserRole.admin);
            return true;
          }
          return false;
        } else {
          sl<UserService>().saveUser(UserModel.fromJson(json));
          sl<UserService>().setRole(
              UserRole.values.firstWhere((e) => e.name == json['role']));

          return true;
        }
      }
    }
    return false;
  }
}
