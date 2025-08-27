// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShopModelImpl _$$ShopModelImplFromJson(Map<String, dynamic> json) =>
    _$ShopModelImpl(
      id: (json['id'] as num?)?.toInt(),
      shopName: json['shop_name'] as String?,
      shopContactNumber: json['shop_contact_number'] as String?,
      shopAddress: json['shop_address'] as String?,
      email: json['email'] as String?,
      description: json['description'] as String? ?? "",
      employeeCount: (json['employee_count'] as num?)?.toInt() ?? 0,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$ShopModelImplToJson(_$ShopModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'shop_name': instance.shopName,
      'shop_contact_number': instance.shopContactNumber,
      'shop_address': instance.shopAddress,
      'email': instance.email,
      'description': instance.description,
      'employee_count': instance.employeeCount,
      'created_at': instance.createdAt?.toIso8601String(),
    };
