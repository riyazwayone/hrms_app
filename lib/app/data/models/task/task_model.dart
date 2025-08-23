import 'dart:ffi';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hrms_app/app/core/utils/app_utils.dart';

part 'task_model.freezed.dart';
part 'task_model.g.dart';

@freezed
sealed class TaskModel with _$TaskModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory TaskModel({
    int? id,
    @Default("") String taskTitle,
    @Default("") String department,
    @Default("") String taskDescription,
    @JsonKey(fromJson: AppUtils.anyToDateTime) DateTime? deadline,
    @Default("") String priority,
    @Default(0) int employeeId,
    @Default("") String employeeName,
    @Default("incomplete") String status,
    @Default(0) int userId,
    @Default(0) int shopId,
    @Default("") String assignedBy,
    @JsonKey(fromJson: AppUtils.anyToDateTime) DateTime? createdAt,
  }) = _TaskModel;

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);
}
