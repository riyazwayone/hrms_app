// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AttendanceModel _$AttendanceModelFromJson(Map<String, dynamic> json) =>
    _AttendanceModel(
      attendanceDate: AppUtils.anyToDateTime(json['attendance_date']),
      inTime: AppUtils.anyToDuration(json['in_time']),
      outTime: AppUtils.anyToDuration(json['out_time']),
      earlyArrival: AppUtils.anyToDuration(json['early_arrival']),
      lateHour: AppUtils.anyToDuration(json['late_hour']),
      earlyLeave: AppUtils.anyToDuration(json['early_leave']),
      overtime: AppUtils.anyToDuration(json['overtime']),
      createdAt: AppUtils.anyToDateTime(json['created_at']),
      status: json['status'] as String?,
      coordinates: json['coordinates'] as String?,
      location: json['location'] as String?,
    );

Map<String, dynamic> _$AttendanceModelToJson(_AttendanceModel instance) =>
    <String, dynamic>{
      'attendance_date': instance.attendanceDate?.toIso8601String(),
      'in_time': instance.inTime?.inMicroseconds,
      'out_time': instance.outTime?.inMicroseconds,
      'early_arrival': instance.earlyArrival?.inMicroseconds,
      'late_hour': instance.lateHour?.inMicroseconds,
      'early_leave': instance.earlyLeave?.inMicroseconds,
      'overtime': instance.overtime?.inMicroseconds,
      'created_at': instance.createdAt?.toIso8601String(),
      'status': instance.status,
      'coordinates': instance.coordinates,
      'location': instance.location,
    };
