// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserModel {
  int get id;
  String get name;
  String get email;
  String get profileImage;
  String get phoneNumber;
  String get salary;
  String get shiftType;
  String get shiftTiming;
  String get designation;
  String get shopName;
  String get shopId;
  String get shopOwnerId;
  int? get planId;
  PlanModel? get plan;
  UserRole get role;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<UserModel> get copyWith =>
      _$UserModelCopyWithImpl<UserModel>(this as UserModel, _$identity);

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.salary, salary) || other.salary == salary) &&
            (identical(other.shiftType, shiftType) ||
                other.shiftType == shiftType) &&
            (identical(other.shiftTiming, shiftTiming) ||
                other.shiftTiming == shiftTiming) &&
            (identical(other.designation, designation) ||
                other.designation == designation) &&
            (identical(other.shopName, shopName) ||
                other.shopName == shopName) &&
            (identical(other.shopId, shopId) || other.shopId == shopId) &&
            (identical(other.shopOwnerId, shopOwnerId) ||
                other.shopOwnerId == shopOwnerId) &&
            (identical(other.planId, planId) || other.planId == planId) &&
            (identical(other.plan, plan) || other.plan == plan) &&
            (identical(other.role, role) || other.role == role));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      email,
      profileImage,
      phoneNumber,
      salary,
      shiftType,
      shiftTiming,
      designation,
      shopName,
      shopId,
      shopOwnerId,
      planId,
      plan,
      role);

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, email: $email, profileImage: $profileImage, phoneNumber: $phoneNumber, salary: $salary, shiftType: $shiftType, shiftTiming: $shiftTiming, designation: $designation, shopName: $shopName, shopId: $shopId, shopOwnerId: $shopOwnerId, planId: $planId, plan: $plan, role: $role)';
  }
}

/// @nodoc
abstract mixin class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) _then) =
      _$UserModelCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String name,
      String email,
      String profileImage,
      String phoneNumber,
      String salary,
      String shiftType,
      String shiftTiming,
      String designation,
      String shopName,
      String shopId,
      String shopOwnerId,
      int? planId,
      PlanModel? plan,
      UserRole role});

  $PlanModelCopyWith<$Res>? get plan;
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res> implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._self, this._then);

  final UserModel _self;
  final $Res Function(UserModel) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? profileImage = null,
    Object? phoneNumber = null,
    Object? salary = null,
    Object? shiftType = null,
    Object? shiftTiming = null,
    Object? designation = null,
    Object? shopName = null,
    Object? shopId = null,
    Object? shopOwnerId = null,
    Object? planId = freezed,
    Object? plan = freezed,
    Object? role = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      profileImage: null == profileImage
          ? _self.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _self.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      salary: null == salary
          ? _self.salary
          : salary // ignore: cast_nullable_to_non_nullable
              as String,
      shiftType: null == shiftType
          ? _self.shiftType
          : shiftType // ignore: cast_nullable_to_non_nullable
              as String,
      shiftTiming: null == shiftTiming
          ? _self.shiftTiming
          : shiftTiming // ignore: cast_nullable_to_non_nullable
              as String,
      designation: null == designation
          ? _self.designation
          : designation // ignore: cast_nullable_to_non_nullable
              as String,
      shopName: null == shopName
          ? _self.shopName
          : shopName // ignore: cast_nullable_to_non_nullable
              as String,
      shopId: null == shopId
          ? _self.shopId
          : shopId // ignore: cast_nullable_to_non_nullable
              as String,
      shopOwnerId: null == shopOwnerId
          ? _self.shopOwnerId
          : shopOwnerId // ignore: cast_nullable_to_non_nullable
              as String,
      planId: freezed == planId
          ? _self.planId
          : planId // ignore: cast_nullable_to_non_nullable
              as int?,
      plan: freezed == plan
          ? _self.plan
          : plan // ignore: cast_nullable_to_non_nullable
              as PlanModel?,
      role: null == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as UserRole,
    ));
  }

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlanModelCopyWith<$Res>? get plan {
    if (_self.plan == null) {
      return null;
    }

    return $PlanModelCopyWith<$Res>(_self.plan!, (value) {
      return _then(_self.copyWith(plan: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _UserModel implements UserModel {
  _UserModel(
      {required this.id,
      this.name = "Unknown",
      this.email = "",
      this.profileImage = "",
      this.phoneNumber = "",
      this.salary = "",
      this.shiftType = "",
      this.shiftTiming = "",
      this.designation = "",
      this.shopName = "",
      this.shopId = "",
      this.shopOwnerId = "",
      this.planId,
      this.plan,
      this.role = UserRole.employee});
  factory _UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  @override
  final int id;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String profileImage;
  @override
  @JsonKey()
  final String phoneNumber;
  @override
  @JsonKey()
  final String salary;
  @override
  @JsonKey()
  final String shiftType;
  @override
  @JsonKey()
  final String shiftTiming;
  @override
  @JsonKey()
  final String designation;
  @override
  @JsonKey()
  final String shopName;
  @override
  @JsonKey()
  final String shopId;
  @override
  @JsonKey()
  final String shopOwnerId;
  @override
  final int? planId;
  @override
  final PlanModel? plan;
  @override
  @JsonKey()
  final UserRole role;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserModelCopyWith<_UserModel> get copyWith =>
      __$UserModelCopyWithImpl<_UserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.salary, salary) || other.salary == salary) &&
            (identical(other.shiftType, shiftType) ||
                other.shiftType == shiftType) &&
            (identical(other.shiftTiming, shiftTiming) ||
                other.shiftTiming == shiftTiming) &&
            (identical(other.designation, designation) ||
                other.designation == designation) &&
            (identical(other.shopName, shopName) ||
                other.shopName == shopName) &&
            (identical(other.shopId, shopId) || other.shopId == shopId) &&
            (identical(other.shopOwnerId, shopOwnerId) ||
                other.shopOwnerId == shopOwnerId) &&
            (identical(other.planId, planId) || other.planId == planId) &&
            (identical(other.plan, plan) || other.plan == plan) &&
            (identical(other.role, role) || other.role == role));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      email,
      profileImage,
      phoneNumber,
      salary,
      shiftType,
      shiftTiming,
      designation,
      shopName,
      shopId,
      shopOwnerId,
      planId,
      plan,
      role);

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, email: $email, profileImage: $profileImage, phoneNumber: $phoneNumber, salary: $salary, shiftType: $shiftType, shiftTiming: $shiftTiming, designation: $designation, shopName: $shopName, shopId: $shopId, shopOwnerId: $shopOwnerId, planId: $planId, plan: $plan, role: $role)';
  }
}

/// @nodoc
abstract mixin class _$UserModelCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$UserModelCopyWith(
          _UserModel value, $Res Function(_UserModel) _then) =
      __$UserModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String email,
      String profileImage,
      String phoneNumber,
      String salary,
      String shiftType,
      String shiftTiming,
      String designation,
      String shopName,
      String shopId,
      String shopOwnerId,
      int? planId,
      PlanModel? plan,
      UserRole role});

  @override
  $PlanModelCopyWith<$Res>? get plan;
}

/// @nodoc
class __$UserModelCopyWithImpl<$Res> implements _$UserModelCopyWith<$Res> {
  __$UserModelCopyWithImpl(this._self, this._then);

  final _UserModel _self;
  final $Res Function(_UserModel) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? profileImage = null,
    Object? phoneNumber = null,
    Object? salary = null,
    Object? shiftType = null,
    Object? shiftTiming = null,
    Object? designation = null,
    Object? shopName = null,
    Object? shopId = null,
    Object? shopOwnerId = null,
    Object? planId = freezed,
    Object? plan = freezed,
    Object? role = null,
  }) {
    return _then(_UserModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      profileImage: null == profileImage
          ? _self.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _self.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      salary: null == salary
          ? _self.salary
          : salary // ignore: cast_nullable_to_non_nullable
              as String,
      shiftType: null == shiftType
          ? _self.shiftType
          : shiftType // ignore: cast_nullable_to_non_nullable
              as String,
      shiftTiming: null == shiftTiming
          ? _self.shiftTiming
          : shiftTiming // ignore: cast_nullable_to_non_nullable
              as String,
      designation: null == designation
          ? _self.designation
          : designation // ignore: cast_nullable_to_non_nullable
              as String,
      shopName: null == shopName
          ? _self.shopName
          : shopName // ignore: cast_nullable_to_non_nullable
              as String,
      shopId: null == shopId
          ? _self.shopId
          : shopId // ignore: cast_nullable_to_non_nullable
              as String,
      shopOwnerId: null == shopOwnerId
          ? _self.shopOwnerId
          : shopOwnerId // ignore: cast_nullable_to_non_nullable
              as String,
      planId: freezed == planId
          ? _self.planId
          : planId // ignore: cast_nullable_to_non_nullable
              as int?,
      plan: freezed == plan
          ? _self.plan
          : plan // ignore: cast_nullable_to_non_nullable
              as PlanModel?,
      role: null == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as UserRole,
    ));
  }

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlanModelCopyWith<$Res>? get plan {
    if (_self.plan == null) {
      return null;
    }

    return $PlanModelCopyWith<$Res>(_self.plan!, (value) {
      return _then(_self.copyWith(plan: value));
    });
  }
}

// dart format on
