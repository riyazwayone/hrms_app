// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EmployeeModel _$EmployeeModelFromJson(Map<String, dynamic> json) =>
    _EmployeeModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      recruiterId: (json['recruiter_id'] as num?)?.toInt() ?? 0,
      shopId: (json['shop_id'] as num?)?.toInt() ?? 0,
      employeeName: json['employee_name'] as String? ?? '',
      email: json['email'] as String? ?? '',
      phoneNumber: json['phone_number'] as String? ?? '',
      profileImage: json['profile_image'] as String? ?? '',
      salary: json['salary'] as String? ?? '0.00',
      shiftTiming: json['shift_timing'] as String? ?? '',
      shiftType: json['shift_type'] as String? ?? '',
      employmentType: json['employment_type'] as String? ?? '',
      designation: json['designation'] as String? ?? '',
      password: json['password'] as String? ?? '',
      createdAt: AppUtils.anyToDateTime(json['created_at']),
      shopName: json['shop_name'] as String? ?? '',
      shopContactNumber: json['shop_contact_number'] as String? ?? '',
      shopAddress: json['shop_address'] as String? ?? '',
      description: json['description'] as String? ?? '',
    );

Map<String, dynamic> _$EmployeeModelToJson(_EmployeeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'recruiter_id': instance.recruiterId,
      'shop_id': instance.shopId,
      'employee_name': instance.employeeName,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'profile_image': instance.profileImage,
      'salary': instance.salary,
      'shift_timing': instance.shiftTiming,
      'shift_type': instance.shiftType,
      'employment_type': instance.employmentType,
      'designation': instance.designation,
      'password': instance.password,
      'created_at': instance.createdAt?.toIso8601String(),
      'shop_name': instance.shopName,
      'shop_contact_number': instance.shopContactNumber,
      'shop_address': instance.shopAddress,
      'description': instance.description,
    };
