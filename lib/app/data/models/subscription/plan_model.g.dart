// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlanModel _$PlanModelFromJson(Map<String, dynamic> json) => _PlanModel(
      id: (json['id'] as num?)?.toInt(),
      planName: json['planName'] as String,
      price: json['price'] == null ? 0.0 : AppUtils.anyToDouble(json['price']),
      shopNumber: (json['shopNumber'] as num).toInt(),
      employeeLimit: (json['employeeLimit'] as num).toInt(),
      isRecommended: json['isRecommended'] == null
          ? false
          : AppUtils.anyToBool(json['isRecommended']),
      createdAt: AppUtils.anyToDateTime(json['createdAt']),
    );

Map<String, dynamic> _$PlanModelToJson(_PlanModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'planName': instance.planName,
      'price': instance.price,
      'shopNumber': instance.shopNumber,
      'employeeLimit': instance.employeeLimit,
      'isRecommended': instance.isRecommended,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
