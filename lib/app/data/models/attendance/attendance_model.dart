// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hrms_app/app/core/utils/app_utils.dart';

part 'attendance_model.freezed.dart';
part 'attendance_model.g.dart';

@freezed
sealed class AttendanceModel with _$AttendanceModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory AttendanceModel({
    @JsonKey(fromJson: AppUtils.anyToDateTime) DateTime? attendanceDate,
    @JsonKey(fromJson: AppUtils.anyToDuration) Duration? inTime,
    @JsonKey(fromJson: AppUtils.anyToDuration) Duration? outTime,
    @JsonKey(fromJson: AppUtils.anyToDuration) Duration? earlyArrival,
    @JsonKey(fromJson: AppUtils.anyToDuration) Duration? lateHour,
    @JsonKey(fromJson: AppUtils.anyToDuration) Duration? earlyLeave,
    @JsonKey(fromJson: AppUtils.anyToDuration) Duration? overtime,
    @JsonKey(fromJson: AppUtils.anyToDateTime) DateTime? createdAt,
    String? status,
    String? coordinates,
    String? location,
  }) = _AttendanceModel;

  factory AttendanceModel.fromJson(Map<String, dynamic> json) =>
      _$AttendanceModelFromJson(json);
}
