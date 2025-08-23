import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hrms_app/app/core/utils/app_utils.dart';
import 'package:json_annotation/json_annotation.dart';

part 'employee_model.freezed.dart';
part 'employee_model.g.dart';

@freezed
sealed class EmployeeModel with _$EmployeeModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory EmployeeModel({
    @Default(0) int id,
    @Default(0) int recruiterId,
    @Default(0) int shopId,
    @Default('') String employeeName,
    @Default('') String email,
    @Default('') String phoneNumber,
    @Default('') String profileImage,
    @Default('0.00') String salary,
    @Default('') String shiftTiming,
    @Default('') String shiftType,
    @Default('') String employmentType,
    @Default('') String designation,
    @Default('') String password,
    @JsonKey(fromJson: AppUtils.anyToDateTime) DateTime? createdAt,
    @Default('') String shopName,
    @Default('') String shopContactNumber,
    @Default('') String shopAddress,
    @Default('') String description,
  }) = _EmployeeModel;

  factory EmployeeModel.fromJson(Map<String, dynamic> json) =>
      _$EmployeeModelFromJson(json);
}
