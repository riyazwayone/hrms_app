// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String? ?? "Unknown",
      email: json['email'] as String? ?? "",
      profileImage: json['profileImage'] as String? ?? "",
      phoneNumber: json['phoneNumber'] as String? ?? "",
      salary: json['salary'] as String? ?? "",
      shiftType: json['shiftType'] as String? ?? "",
      shiftTiming: json['shiftTiming'] as String? ?? "",
      designation: json['designation'] as String? ?? "",
      shopName: json['shopName'] as String? ?? "",
      shopId: json['shopId'] as String? ?? "",
      shopOwnerId: json['shopOwnerId'] as String? ?? "",
      planId: (json['planId'] as num?)?.toInt(),
      plan: json['plan'] == null
          ? null
          : PlanModel.fromJson(json['plan'] as Map<String, dynamic>),
      role: $enumDecodeNullable(_$UserRoleEnumMap, json['role']) ??
          UserRole.employee,
    );

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'profileImage': instance.profileImage,
      'phoneNumber': instance.phoneNumber,
      'salary': instance.salary,
      'shiftType': instance.shiftType,
      'shiftTiming': instance.shiftTiming,
      'designation': instance.designation,
      'shopName': instance.shopName,
      'shopId': instance.shopId,
      'shopOwnerId': instance.shopOwnerId,
      'planId': instance.planId,
      'plan': instance.plan,
      'role': _$UserRoleEnumMap[instance.role]!,
    };

const _$UserRoleEnumMap = {
  UserRole.employee: 'employee',
  UserRole.hr: 'hr',
  UserRole.admin: 'admin',
};
