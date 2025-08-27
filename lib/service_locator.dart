import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hrms_app/app/data/models/users/user_model.dart';
import 'package:hrms_app/app/data/repositories/__task.dart';
import 'package:hrms_app/app/data/services/chat_socket_service.dart';
import 'package:hrms_app/app/data/services/user_service.dart';

import 'app/data/repositories/__attendance.dart';
import 'app/data/repositories/__employee.dart';
import 'app/data/repositories/__home.dart';
import 'app/data/repositories/__auth.dart';
import 'app/data/repositories/__subscription.dart';
import 'app/data/repositories/__shop.dart';

final sl = GetIt.instance;

Future<void> initServices() async {
  /// Singleton instance for app
  final box = GetStorage();

  sl.registerSingleton<GetStorage>(box);

  // Register UserService as a singleton
  sl.registerLazySingleton(() => UserService(box));

  // Register Repositories
  sl.registerFactory<AuthRepository>(() => AuthRepositoryImpl());
  sl.registerFactory<HomeRepository>(() => HomeRepositoryImpl());
  sl.registerFactory<AttendanceRepository>(() => AttendanceRepositoryImpl());
  sl.registerLazySingleton<SubscriptionRepository>(
      () => SubscriptionRepositoryImpl());
  sl.registerLazySingleton<ShopRepository>(() => ShopRepository());
  sl.registerLazySingleton<EmployeeRepository>(() => EmployeeRepository());
  sl.registerLazySingleton<TaskRepository>(() => TaskRepository());

  // Register ChatSocketService as a lazily initialized singleton
  final chatSocketService = ChatSocketService();
  sl.registerLazySingleton<ChatSocketService>(() => chatSocketService);

  // Initialize the chat socket service
  await chatSocketService.init();
}
