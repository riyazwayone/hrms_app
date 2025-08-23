import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hrms_app/app/data/models/employee/employee_model.dart';

import '../attendance/attendance_model.dart';

part 'home_model.freezed.dart';
part 'home_model.g.dart';

@freezed
sealed class HomeModel with _$HomeModel {
  factory HomeModel(
      {AttendanceModel? attendance,
      @Default([]) List<EmployeeModel> employees}) = _HomeModel;

  factory HomeModel.fromJson(Map<String, dynamic> json) =>
      _$HomeModelFromJson(json);
}
