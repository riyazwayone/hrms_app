import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hrms_app/app/core/utils/enums.dart';

import '../subscription/plan_model.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
sealed class UserModel with _$UserModel {
  factory UserModel({
    required int id,
    @Default("Unknown") String name,
    @Default("") String email,
    @Default("") String profileImage,
    @Default("") String phoneNumber,
    @Default("") String salary,
    @Default("") String shiftType,
    @Default("") String shiftTiming,
    @Default("") String designation,
    @Default("") String shopName,
    @Default(0) int shopId,
    @Default(0) int shopOwnerId,
    int? planId,
    PlanModel? plan,
    @Default(UserRole.employee) UserRole role,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
