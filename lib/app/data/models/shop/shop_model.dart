import 'package:freezed_annotation/freezed_annotation.dart';

part 'shop_model.freezed.dart';
part 'shop_model.g.dart';

@freezed
sealed class ShopModel with _$ShopModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory ShopModel({
    int? id,
    String? shopName,
    String? shopContactNumber,
    String? shopAddress,
    String? email,
    @Default("") String description,
    @Default(0) int? employeeCount,
    DateTime? createdAt,
  }) = _ShopModel;

  factory ShopModel.fromJson(Map<String, dynamic> json) =>
      _$ShopModelFromJson(json);
}
