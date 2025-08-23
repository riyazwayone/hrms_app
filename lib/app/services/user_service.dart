import 'package:get/get.dart';
import 'package:logger/logger.dart';

// User model to store the current logged-in user information
class User {
  final int id;
  final String name;
  final String email;
  final String role; // 'admin', 'hr', 'employee'
  final int? shopId; // Shop ID for HR role
  final String? profileImage;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    this.shopId,
    this.profileImage,
  });

  // Factory method to create a User from JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      role: json['role'] as String,
      shopId: json['shop_id'] as int?,
      profileImage: json['profile_image'] as String?,
    );
  }

  // Convert this User to a JSON object
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'role': role,
      'shop_id': shopId,
      'profile_image': profileImage,
    };
  }
}

// Service to manage user authentication and information
class UserService extends GetxService {
  final Logger _logger = Logger();

  // Observable user object
  final Rx<User?> currentUser = Rx<User?>(null);

  // Mock user data for development
  final Map<String, User> _mockUsers = {
    'admin@demo.com': User(
      id: 1,
      name: 'Admin User',
      email: 'admin@demo.com',
      role: 'admin',
      profileImage: 'https://randomuser.me/api/portraits/men/43.jpg',
    ),
    'hr@demo.com': User(
      id: 2,
      name: 'HR Manager',
      email: 'hr@demo.com',
      role: 'hr',
      shopId: 1,
      profileImage: 'https://randomuser.me/api/portraits/women/68.jpg',
    ),
    'employee@demo.com': User(
      id: 3,
      name: 'John Employee',
      email: 'employee@demo.com',
      role: 'employee',
      shopId: 1,
      profileImage: 'https://randomuser.me/api/portraits/men/32.jpg',
    ),
  };

  // Initialize the service
  Future<UserService> init() async {
    _logger.d('UserService initialized');
    return this;
  }

  // Login with email and password
  Future<bool> login(String email, String password) async {
    try {
      // In a real app, this would make an API call
      await Future.delayed(const Duration(seconds: 1)); // Simulate API call

      // Check if the user exists in mock data
      if (_mockUsers.containsKey(email)) {
        currentUser.value = _mockUsers[email];
        _logger.d('User logged in: ${currentUser.value?.name}');
        return true;
      }

      _logger.d('Login failed: User not found');
      return false;
    } catch (e) {
      _logger.e('Login error: $e');
      return false;
    }
  }

  // Logout the current user
  Future<void> logout() async {
    try {
      // In a real app, this would make an API call
      await Future.delayed(
          const Duration(milliseconds: 500)); // Simulate API call

      currentUser.value = null;
      _logger.d('User logged out');
    } catch (e) {
      _logger.e('Logout error: $e');
    }
  }

  // Check if the user is logged in
  bool isLoggedIn() {
    return currentUser.value != null;
  }

  // Check if the user has a specific role
  bool hasRole(String role) {
    return currentUser.value?.role == role;
  }
}
