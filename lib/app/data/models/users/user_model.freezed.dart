// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get profileImage => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String get salary => throw _privateConstructorUsedError;
  String get shiftType => throw _privateConstructorUsedError;
  String get shiftTiming => throw _privateConstructorUsedError;
  String get designation => throw _privateConstructorUsedError;
  String get shopName => throw _privateConstructorUsedError;
  int get shopId => throw _privateConstructorUsedError;
  int get shopOwnerId => throw _privateConstructorUsedError;
  int? get planId => throw _privateConstructorUsedError;
  PlanModel? get plan => throw _privateConstructorUsedError;
  UserRole get role => throw _privateConstructorUsedError;

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {int id,
      String name,
      String email,
      String? profileImage,
      String phoneNumber,
      String salary,
      String shiftType,
      String shiftTiming,
      String designation,
      String shopName,
      int shopId,
      int shopOwnerId,
      int? planId,
      PlanModel? plan,
      UserRole role});

  $PlanModelCopyWith<$Res>? get plan;
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? profileImage = freezed,
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
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      salary: null == salary
          ? _value.salary
          : salary // ignore: cast_nullable_to_non_nullable
              as String,
      shiftType: null == shiftType
          ? _value.shiftType
          : shiftType // ignore: cast_nullable_to_non_nullable
              as String,
      shiftTiming: null == shiftTiming
          ? _value.shiftTiming
          : shiftTiming // ignore: cast_nullable_to_non_nullable
              as String,
      designation: null == designation
          ? _value.designation
          : designation // ignore: cast_nullable_to_non_nullable
              as String,
      shopName: null == shopName
          ? _value.shopName
          : shopName // ignore: cast_nullable_to_non_nullable
              as String,
      shopId: null == shopId
          ? _value.shopId
          : shopId // ignore: cast_nullable_to_non_nullable
              as int,
      shopOwnerId: null == shopOwnerId
          ? _value.shopOwnerId
          : shopOwnerId // ignore: cast_nullable_to_non_nullable
              as int,
      planId: freezed == planId
          ? _value.planId
          : planId // ignore: cast_nullable_to_non_nullable
              as int?,
      plan: freezed == plan
          ? _value.plan
          : plan // ignore: cast_nullable_to_non_nullable
              as PlanModel?,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as UserRole,
    ) as $Val);
  }

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlanModelCopyWith<$Res>? get plan {
    if (_value.plan == null) {
      return null;
    }

    return $PlanModelCopyWith<$Res>(_value.plan!, (value) {
      return _then(_value.copyWith(plan: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String email,
      String? profileImage,
      String phoneNumber,
      String salary,
      String shiftType,
      String shiftTiming,
      String designation,
      String shopName,
      int shopId,
      int shopOwnerId,
      int? planId,
      PlanModel? plan,
      UserRole role});

  @override
  $PlanModelCopyWith<$Res>? get plan;
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? profileImage = freezed,
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
    return _then(_$UserModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      salary: null == salary
          ? _value.salary
          : salary // ignore: cast_nullable_to_non_nullable
              as String,
      shiftType: null == shiftType
          ? _value.shiftType
          : shiftType // ignore: cast_nullable_to_non_nullable
              as String,
      shiftTiming: null == shiftTiming
          ? _value.shiftTiming
          : shiftTiming // ignore: cast_nullable_to_non_nullable
              as String,
      designation: null == designation
          ? _value.designation
          : designation // ignore: cast_nullable_to_non_nullable
              as String,
      shopName: null == shopName
          ? _value.shopName
          : shopName // ignore: cast_nullable_to_non_nullable
              as String,
      shopId: null == shopId
          ? _value.shopId
          : shopId // ignore: cast_nullable_to_non_nullable
              as int,
      shopOwnerId: null == shopOwnerId
          ? _value.shopOwnerId
          : shopOwnerId // ignore: cast_nullable_to_non_nullable
              as int,
      planId: freezed == planId
          ? _value.planId
          : planId // ignore: cast_nullable_to_non_nullable
              as int?,
      plan: freezed == plan
          ? _value.plan
          : plan // ignore: cast_nullable_to_non_nullable
              as PlanModel?,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as UserRole,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelImpl implements _UserModel {
  _$UserModelImpl(
      {required this.id,
      this.name = "Unknown",
      this.email = "",
      this.profileImage,
      this.phoneNumber = "",
      this.salary = "",
      this.shiftType = "",
      this.shiftTiming = "",
      this.designation = "",
      this.shopName = "",
      this.shopId = 0,
      this.shopOwnerId = 0,
      this.planId,
      this.plan,
      this.role = UserRole.employee});

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String email;
  @override
  final String? profileImage;
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
  final int shopId;
  @override
  @JsonKey()
  final int shopOwnerId;
  @override
  final int? planId;
  @override
  final PlanModel? plan;
  @override
  @JsonKey()
  final UserRole role;

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, email: $email, profileImage: $profileImage, phoneNumber: $phoneNumber, salary: $salary, shiftType: $shiftType, shiftTiming: $shiftTiming, designation: $designation, shopName: $shopName, shopId: $shopId, shopOwnerId: $shopOwnerId, planId: $planId, plan: $plan, role: $role)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
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

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  factory _UserModel(
      {required final int id,
      final String name,
      final String email,
      final String? profileImage,
      final String phoneNumber,
      final String salary,
      final String shiftType,
      final String shiftTiming,
      final String designation,
      final String shopName,
      final int shopId,
      final int shopOwnerId,
      final int? planId,
      final PlanModel? plan,
      final UserRole role}) = _$UserModelImpl;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get email;
  @override
  String? get profileImage;
  @override
  String get phoneNumber;
  @override
  String get salary;
  @override
  String get shiftType;
  @override
  String get shiftTiming;
  @override
  String get designation;
  @override
  String get shopName;
  @override
  int get shopId;
  @override
  int get shopOwnerId;
  @override
  int? get planId;
  @override
  PlanModel? get plan;
  @override
  UserRole get role;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
