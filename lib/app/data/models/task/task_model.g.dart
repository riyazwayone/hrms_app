// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskModelImpl _$$TaskModelImplFromJson(Map<String, dynamic> json) =>
    _$TaskModelImpl(
      id: (json['id'] as num?)?.toInt(),
      taskTitle: json['task_title'] as String? ?? "",
      department: json['department'] as String? ?? "",
      taskDescription: json['task_description'] as String? ?? "",
      deadline: AppUtils.anyToDateTime(json['deadline']),
      priority: json['priority'] as String? ?? "",
      employeeId: (json['employee_id'] as num?)?.toInt() ?? 0,
      employeeName: json['employee_name'] as String? ?? "",
      status: json['status'] as String? ?? "incomplete",
      userId: (json['user_id'] as num?)?.toInt() ?? 0,
      shopId: (json['shop_id'] as num?)?.toInt() ?? 0,
      assignedBy: json['assigned_by'] as String? ?? "",
      createdAt: AppUtils.anyToDateTime(json['created_at']),
    );

Map<String, dynamic> _$$TaskModelImplToJson(_$TaskModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'task_title': instance.taskTitle,
      'department': instance.department,
      'task_description': instance.taskDescription,
      'deadline': instance.deadline?.toIso8601String(),
      'priority': instance.priority,
      'employee_id': instance.employeeId,
      'employee_name': instance.employeeName,
      'status': instance.status,
      'user_id': instance.userId,
      'shop_id': instance.shopId,
      'assigned_by': instance.assignedBy,
      'created_at': instance.createdAt?.toIso8601String(),
    };
