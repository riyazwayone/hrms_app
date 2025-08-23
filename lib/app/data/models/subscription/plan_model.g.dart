// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlanModel _$PlanModelFromJson(Map<String, dynamic> json) => _PlanModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      planName: json['plan_name'] as String,
      price: json['price'] == null ? 0.0 : AppUtils.anyToDouble(json['price']),
      shopNumber: (json['shop_number'] as num).toInt(),
      employeeLimit: (json['employee_limit'] as num).toInt(),
      isRecommended: json['is_recommended'] == null
          ? false
          : AppUtils.anyToBool(json['is_recommended']),
    );

Map<String, dynamic> _$PlanModelToJson(_PlanModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'plan_name': instance.planName,
      'price': instance.price,
      'shop_number': instance.shopNumber,
      'employee_limit': instance.employeeLimit,
      'is_recommended': instance.isRecommended,
    };
