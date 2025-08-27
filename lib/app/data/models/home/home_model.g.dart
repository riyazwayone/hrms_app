// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HomeModelImpl _$$HomeModelImplFromJson(Map<String, dynamic> json) =>
    _$HomeModelImpl(
      attendance: json['attendance'] == null
          ? null
          : AttendanceModel.fromJson(
              json['attendance'] as Map<String, dynamic>),
      employees: (json['employees'] as List<dynamic>?)
              ?.map((e) => EmployeeModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$HomeModelImplToJson(_$HomeModelImpl instance) =>
    <String, dynamic>{
      'attendance': instance.attendance,
      'employees': instance.employees,
    };
