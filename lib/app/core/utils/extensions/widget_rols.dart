import 'package:flutter/material.dart';
import 'package:hrms_app/app/data/models/users/user_model.dart';
import 'package:hrms_app/app/data/services/user_service.dart';

import '../../../../service_locator.dart';
import '../../constants/api.dart';
import '../enums.dart';

// For widgets: returns SizedBox.shrink() when not allowed
extension WidgetRols<T extends Widget> on T {
  T? forAdmin({UserRole? role}) =>
      (role ?? sl<UserService>().getCurrentUserSync()!.role) == UserRole.admin
          ? this
          : null;
  T? forHr({UserRole? role}) =>
      (role ?? sl<UserService>().getCurrentUserSync()!.role) == UserRole.hr
          ? this
          : null;
  T? forEmployee({UserRole? role}) =>
      (role ?? sl<UserService>().getCurrentUserSync()!.role) ==
              UserRole.employee
          ? this
          : null;
  T? notForAdmin({UserRole? role}) =>
      ((role ?? sl<UserService>().getCurrentUserSync()!.role) == UserRole.hr ||
              (role ?? sl<UserService>().getCurrentUserSync()!.role) ==
                  UserRole.employee)
          ? this
          : null;
  T? notForEmployee({UserRole? role}) =>
      ((role ?? sl<UserService>().getCurrentUserSync()!.role) == UserRole.hr ||
              (role ?? sl<UserService>().getCurrentUserSync()!.role) ==
                  UserRole.admin)
          ? this
          : null;
  T? notForHr({UserRole? role}) =>
      ((role ?? sl<UserService>().getCurrentUserSync()!.role) ==
                  UserRole.employee ||
              (role ?? sl<UserService>().getCurrentUserSync()!.role) ==
                  UserRole.admin)
          ? this
          : null;
}

// For any type: returns null when not allowed
extension RoleFilter<T> on T {
  T? forAdmin({UserRole? role}) =>
      (role ?? sl<UserService>().getCurrentUserSync()!.role) == UserRole.admin
          ? this
          : null;
  T? forHr({UserRole? role}) =>
      (role ?? sl<UserService>().getCurrentUserSync()!.role) == UserRole.hr
          ? this
          : null;
  T? forEmployee({UserRole? role}) =>
      (role ?? sl<UserService>().getCurrentUserSync()!.role) ==
              UserRole.employee
          ? this
          : null;
  T? notForAdmin({UserRole? role}) => ((role ??
                  sl<UserService>().getCurrentUserSync()!.role) ==
              UserRole.employee ||
          (role ?? sl<UserService>().getCurrentUserSync()!.role) == UserRole.hr)
      ? this
      : null;
  T? notForHr({UserRole? role}) =>
      ((role ?? sl<UserService>().getCurrentUserSync()!.role) ==
                  UserRole.admin ||
              (role ?? sl<UserService>().getCurrentUserSync()!.role) ==
                  UserRole.employee)
          ? this
          : null;
  T? notForEmployee({UserRole? role}) =>
      ((role ?? sl<UserService>().getCurrentUserSync()!.role) == UserRole.hr ||
              (role ?? sl<UserService>().getCurrentUserSync()!.role) ==
                  UserRole.admin)
          ? this
          : null;
}

extension RolesPath on UserRole {
  String get loginPath {
    switch (this) {
      case UserRole.admin:
        return Api.loginApi;
      case UserRole.employee:
        return Api.employeeLoginApi;
      case UserRole.hr:
        return Api.employeeLoginApi;
    }
  }

  String get signupPath {
    switch (this) {
      case UserRole.admin:
        return Api.registerApi;
      case UserRole.employee:
        return Api.createEmployeeApi;
      case UserRole.hr:
        return Api.createEmployeeApi;
    }
  }

  // String get verifyPath {
  //   switch (this) {
  //     case UserRole.user:
  //       return "${Api.userPath}${Api.verifyOtp}";
  //     case UserRole.builder:
  //       return "${Api.builderPath}${Api.verifyOtp}";
  //     case UserRole.dealer:
  //       return "${Api.dealerPath}${Api.verifyOtp}";
  //   }
  // }

  // String get changePasswordPath {
  //   switch (this) {
  //     case UserRole.user:
  //       return Api.userChangePassword;
  //     case UserRole.builder:
  //       return Api.builderChangePassword;
  //     case UserRole.dealer:
  //       return Api.dealerChangePassword;
  //   }
  // }

//   String get enquiryPath {
//     switch (this) {
//       case UserRole.user:
//         return "${Api.userPath}${Api.propertyEnquiry}";
//       case UserRole.builder:
//         return "${Api.builderPath}${Api.propertyEnquiry}";
//       case UserRole.dealer:
//         return "${Api.dealerPath}${Api.propertyEnquiry}";
//     }
//   }
}
