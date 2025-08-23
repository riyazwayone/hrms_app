// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shop_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ShopModel {
  int? get id;
  String? get shopName;
  String? get shopContactNumber;
  String? get shopAddress;
  String? get email;
  String get description;
  int? get employeeCount;
  DateTime? get createdAt;

  /// Create a copy of ShopModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ShopModelCopyWith<ShopModel> get copyWith =>
      _$ShopModelCopyWithImpl<ShopModel>(this as ShopModel, _$identity);

  /// Serializes this ShopModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ShopModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.shopName, shopName) ||
                other.shopName == shopName) &&
            (identical(other.shopContactNumber, shopContactNumber) ||
                other.shopContactNumber == shopContactNumber) &&
            (identical(other.shopAddress, shopAddress) ||
                other.shopAddress == shopAddress) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.employeeCount, employeeCount) ||
                other.employeeCount == employeeCount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, shopName, shopContactNumber,
      shopAddress, email, description, employeeCount, createdAt);

  @override
  String toString() {
    return 'ShopModel(id: $id, shopName: $shopName, shopContactNumber: $shopContactNumber, shopAddress: $shopAddress, email: $email, description: $description, employeeCount: $employeeCount, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $ShopModelCopyWith<$Res> {
  factory $ShopModelCopyWith(ShopModel value, $Res Function(ShopModel) _then) =
      _$ShopModelCopyWithImpl;
  @useResult
  $Res call(
      {int? id,
      String? shopName,
      String? shopContactNumber,
      String? shopAddress,
      String? email,
      String description,
      int? employeeCount,
      DateTime? createdAt});
}

/// @nodoc
class _$ShopModelCopyWithImpl<$Res> implements $ShopModelCopyWith<$Res> {
  _$ShopModelCopyWithImpl(this._self, this._then);

  final ShopModel _self;
  final $Res Function(ShopModel) _then;

  /// Create a copy of ShopModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? shopName = freezed,
    Object? shopContactNumber = freezed,
    Object? shopAddress = freezed,
    Object? email = freezed,
    Object? description = null,
    Object? employeeCount = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      shopName: freezed == shopName
          ? _self.shopName
          : shopName // ignore: cast_nullable_to_non_nullable
              as String?,
      shopContactNumber: freezed == shopContactNumber
          ? _self.shopContactNumber
          : shopContactNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      shopAddress: freezed == shopAddress
          ? _self.shopAddress
          : shopAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      employeeCount: freezed == employeeCount
          ? _self.employeeCount
          : employeeCount // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _ShopModel implements ShopModel {
  const _ShopModel(
      {this.id,
      this.shopName,
      this.shopContactNumber,
      this.shopAddress,
      this.email,
      this.description = "",
      this.employeeCount = 0,
      this.createdAt});
  factory _ShopModel.fromJson(Map<String, dynamic> json) =>
      _$ShopModelFromJson(json);

  @override
  final int? id;
  @override
  final String? shopName;
  @override
  final String? shopContactNumber;
  @override
  final String? shopAddress;
  @override
  final String? email;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final int? employeeCount;
  @override
  final DateTime? createdAt;

  /// Create a copy of ShopModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ShopModelCopyWith<_ShopModel> get copyWith =>
      __$ShopModelCopyWithImpl<_ShopModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ShopModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ShopModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.shopName, shopName) ||
                other.shopName == shopName) &&
            (identical(other.shopContactNumber, shopContactNumber) ||
                other.shopContactNumber == shopContactNumber) &&
            (identical(other.shopAddress, shopAddress) ||
                other.shopAddress == shopAddress) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.employeeCount, employeeCount) ||
                other.employeeCount == employeeCount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, shopName, shopContactNumber,
      shopAddress, email, description, employeeCount, createdAt);

  @override
  String toString() {
    return 'ShopModel(id: $id, shopName: $shopName, shopContactNumber: $shopContactNumber, shopAddress: $shopAddress, email: $email, description: $description, employeeCount: $employeeCount, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$ShopModelCopyWith<$Res>
    implements $ShopModelCopyWith<$Res> {
  factory _$ShopModelCopyWith(
          _ShopModel value, $Res Function(_ShopModel) _then) =
      __$ShopModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? id,
      String? shopName,
      String? shopContactNumber,
      String? shopAddress,
      String? email,
      String description,
      int? employeeCount,
      DateTime? createdAt});
}

/// @nodoc
class __$ShopModelCopyWithImpl<$Res> implements _$ShopModelCopyWith<$Res> {
  __$ShopModelCopyWithImpl(this._self, this._then);

  final _ShopModel _self;
  final $Res Function(_ShopModel) _then;

  /// Create a copy of ShopModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? shopName = freezed,
    Object? shopContactNumber = freezed,
    Object? shopAddress = freezed,
    Object? email = freezed,
    Object? description = null,
    Object? employeeCount = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_ShopModel(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      shopName: freezed == shopName
          ? _self.shopName
          : shopName // ignore: cast_nullable_to_non_nullable
              as String?,
      shopContactNumber: freezed == shopContactNumber
          ? _self.shopContactNumber
          : shopContactNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      shopAddress: freezed == shopAddress
          ? _self.shopAddress
          : shopAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      employeeCount: freezed == employeeCount
          ? _self.employeeCount
          : employeeCount // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

// dart format on
