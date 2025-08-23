import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hrms_app/app/core/utils/app_utils.dart';

part 'plan_model.freezed.dart';
part 'plan_model.g.dart';

@freezed
sealed class PlanModel with _$PlanModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory PlanModel({
    @Default(0) int? id,
    required String planName,
    @JsonKey(fromJson: AppUtils.anyToDouble) @Default(0.0) double price,
    required int shopNumber,
    required int employeeLimit,
    @JsonKey(fromJson: AppUtils.anyToBool) @Default(false) bool? isRecommended,
  }) = _PlanModel;

  factory PlanModel.fromJson(Map<String, dynamic> json) =>
      _$PlanModelFromJson(json);
}
