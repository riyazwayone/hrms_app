// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HomeModel _$HomeModelFromJson(Map<String, dynamic> json) => _HomeModel(
      attendance: json['attendance'] == null
          ? null
          : AttendanceModel.fromJson(
              json['attendance'] as Map<String, dynamic>),
      employees: (json['employees'] as List<dynamic>?)
              ?.map((e) => EmployeeModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$HomeModelToJson(_HomeModel instance) =>
    <String, dynamic>{
      'attendance': instance.attendance,
      'employees': instance.employees,
    };
