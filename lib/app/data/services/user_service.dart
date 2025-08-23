import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hrms_app/app/core/utils/enums.dart';

import '../../../service_locator.dart';
import '../models/users/user_model.dart';

/// Service to manage user-related data and authentication
class UserService {
  final GetStorage _box;

  // Cache of the current user for synchronous access
  UserModel? _cachedUser;

  UserService(this._box) {
    // Initialize cache with pre-loaded data if available
    _loadUserAsync();
  }

  // Initialize the cached user - we can't do this synchronously with RxSharedPreferences
  Future<void> _loadUserAsync() async {
    try {
      final userJson = _box.read<String>('user');
      if (userJson != null && userJson.isNotEmpty) {
        final userData = jsonDecode(userJson);
        _cachedUser = UserModel.fromJson(userData);
        debugPrint('User loaded from preferences successfully');
      }
    } catch (e) {
      debugPrint('Error loading user from preferences: $e');
    }
  }

  // Get the current user (synchronous, returns cached user)
  UserModel? getCurrentUserSync() {
    return _cachedUser;
  }

  // Get the current user (asynchronous, refreshes from preferences)
  Future<UserModel?> getCurrentUser() async {
    try {
      final userJson = _box.read<String>('user');
      if (userJson != null && userJson.isNotEmpty) {
        final userData = jsonDecode(userJson);
        _cachedUser = UserModel.fromJson(userData);
        return _cachedUser;
      }
      return null;
    } catch (e) {
      debugPrint('Error getting user: $e');
      return null;
    }
  }

  // Save the current user
  Future<bool> saveUser(UserModel user) async {
    try {
      _cachedUser = user;
      final encoded = jsonEncode(user.toJson());
      await _box.write('user', encoded);
      return true;
    } catch (e) {
      debugPrint('Error saving user: $e');
      return false;
    }
  }

  // Clear user data (for logout)
  Future<void> clearUser() async {
    _cachedUser = null;
    await _box.remove('user');
    await _box.remove('token');
    clearRememberMe();
  }

  // Get the auth token
  Future<String?> getToken() async {
    return _box.read<String>('token');
  }

  // Save the auth token
  Future<void> saveToken(String token) async {
    await _box.write('token', token);
  }

  Future<void> rememberMe(bool value) async {
    await _box.write('remember_me', value);
  }

  Future<void> clearRememberMe() async {
    await _box.remove('remember_me');
  }

  Future<bool> isRememberMe() async {
    return _box.read<bool>('remember_me') ?? false;
  }

  Future<void> setRole(UserRole role) async {
    await _box.write('user_role', role.name);
  }

  UserRole? getRole() {
    final roleName = _box.read<String>('user_role');
    return roleName != null
        ? UserRole.values.firstWhere((e) => e.name == roleName,
            orElse: () => UserRole.employee)
        : null;
  }

  Future<Map<String, String>> getHeaders() async {
    final token = await getToken();

    if (token == null || token.isEmpty) {
      throw Exception('Authorization token is missing');
    }

    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }
}
