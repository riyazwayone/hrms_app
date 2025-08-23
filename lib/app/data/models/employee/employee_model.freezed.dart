// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'employee_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EmployeeModel {
  int get id;
  int get recruiterId;
  int get shopId;
  String get employeeName;
  String get email;
  String get phoneNumber;
  String get profileImage;
  String get salary;
  String get shiftTiming;
  String get shiftType;
  String get employmentType;
  String get designation;
  String get password;
  @JsonKey(fromJson: AppUtils.anyToDateTime)
  DateTime? get createdAt;
  String get shopName;
  String get shopContactNumber;
  String get shopAddress;
  String get description;

  /// Create a copy of EmployeeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EmployeeModelCopyWith<EmployeeModel> get copyWith =>
      _$EmployeeModelCopyWithImpl<EmployeeModel>(
          this as EmployeeModel, _$identity);

  /// Serializes this EmployeeModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EmployeeModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.recruiterId, recruiterId) ||
                other.recruiterId == recruiterId) &&
            (identical(other.shopId, shopId) || other.shopId == shopId) &&
            (identical(other.employeeName, employeeName) ||
                other.employeeName == employeeName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage) &&
            (identical(other.salary, salary) || other.salary == salary) &&
            (identical(other.shiftTiming, shiftTiming) ||
                other.shiftTiming == shiftTiming) &&
            (identical(other.shiftType, shiftType) ||
                other.shiftType == shiftType) &&
            (identical(other.employmentType, employmentType) ||
                other.employmentType == employmentType) &&
            (identical(other.designation, designation) ||
                other.designation == designation) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.shopName, shopName) ||
                other.shopName == shopName) &&
            (identical(other.shopContactNumber, shopContactNumber) ||
                other.shopContactNumber == shopContactNumber) &&
            (identical(other.shopAddress, shopAddress) ||
                other.shopAddress == shopAddress) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      recruiterId,
      shopId,
      employeeName,
      email,
      phoneNumber,
      profileImage,
      salary,
      shiftTiming,
      shiftType,
      employmentType,
      designation,
      password,
      createdAt,
      shopName,
      shopContactNumber,
      shopAddress,
      description);

  @override
  String toString() {
    return 'EmployeeModel(id: $id, recruiterId: $recruiterId, shopId: $shopId, employeeName: $employeeName, email: $email, phoneNumber: $phoneNumber, profileImage: $profileImage, salary: $salary, shiftTiming: $shiftTiming, shiftType: $shiftType, employmentType: $employmentType, designation: $designation, password: $password, createdAt: $createdAt, shopName: $shopName, shopContactNumber: $shopContactNumber, shopAddress: $shopAddress, description: $description)';
  }
}

/// @nodoc
abstract mixin class $EmployeeModelCopyWith<$Res> {
  factory $EmployeeModelCopyWith(
          EmployeeModel value, $Res Function(EmployeeModel) _then) =
      _$EmployeeModelCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      int recruiterId,
      int shopId,
      String employeeName,
      String email,
      String phoneNumber,
      String profileImage,
      String salary,
      String shiftTiming,
      String shiftType,
      String employmentType,
      String designation,
      String password,
      @JsonKey(fromJson: AppUtils.anyToDateTime) DateTime? createdAt,
      String shopName,
      String shopContactNumber,
      String shopAddress,
      String description});
}

/// @nodoc
class _$EmployeeModelCopyWithImpl<$Res>
    implements $EmployeeModelCopyWith<$Res> {
  _$EmployeeModelCopyWithImpl(this._self, this._then);

  final EmployeeModel _self;
  final $Res Function(EmployeeModel) _then;

  /// Create a copy of EmployeeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? recruiterId = null,
    Object? shopId = null,
    Object? employeeName = null,
    Object? email = null,
    Object? phoneNumber = null,
    Object? profileImage = null,
    Object? salary = null,
    Object? shiftTiming = null,
    Object? shiftType = null,
    Object? employmentType = null,
    Object? designation = null,
    Object? password = null,
    Object? createdAt = freezed,
    Object? shopName = null,
    Object? shopContactNumber = null,
    Object? shopAddress = null,
    Object? description = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      recruiterId: null == recruiterId
          ? _self.recruiterId
          : recruiterId // ignore: cast_nullable_to_non_nullable
              as int,
      shopId: null == shopId
          ? _self.shopId
          : shopId // ignore: cast_nullable_to_non_nullable
              as int,
      employeeName: null == employeeName
          ? _self.employeeName
          : employeeName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _self.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      profileImage: null == profileImage
          ? _self.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String,
      salary: null == salary
          ? _self.salary
          : salary // ignore: cast_nullable_to_non_nullable
              as String,
      shiftTiming: null == shiftTiming
          ? _self.shiftTiming
          : shiftTiming // ignore: cast_nullable_to_non_nullable
              as String,
      shiftType: null == shiftType
          ? _self.shiftType
          : shiftType // ignore: cast_nullable_to_non_nullable
              as String,
      employmentType: null == employmentType
          ? _self.employmentType
          : employmentType // ignore: cast_nullable_to_non_nullable
              as String,
      designation: null == designation
          ? _self.designation
          : designation // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      shopName: null == shopName
          ? _self.shopName
          : shopName // ignore: cast_nullable_to_non_nullable
              as String,
      shopContactNumber: null == shopContactNumber
          ? _self.shopContactNumber
          : shopContactNumber // ignore: cast_nullable_to_non_nullable
              as String,
      shopAddress: null == shopAddress
          ? _self.shopAddress
          : shopAddress // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _EmployeeModel implements EmployeeModel {
  const _EmployeeModel(
      {this.id = 0,
      this.recruiterId = 0,
      this.shopId = 0,
      this.employeeName = '',
      this.email = '',
      this.phoneNumber = '',
      this.profileImage = '',
      this.salary = '0.00',
      this.shiftTiming = '',
      this.shiftType = '',
      this.employmentType = '',
      this.designation = '',
      this.password = '',
      @JsonKey(fromJson: AppUtils.anyToDateTime) this.createdAt,
      this.shopName = '',
      this.shopContactNumber = '',
      this.shopAddress = '',
      this.description = ''});
  factory _EmployeeModel.fromJson(Map<String, dynamic> json) =>
      _$EmployeeModelFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final int recruiterId;
  @override
  @JsonKey()
  final int shopId;
  @override
  @JsonKey()
  final String employeeName;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String phoneNumber;
  @override
  @JsonKey()
  final String profileImage;
  @override
  @JsonKey()
  final String salary;
  @override
  @JsonKey()
  final String shiftTiming;
  @override
  @JsonKey()
  final String shiftType;
  @override
  @JsonKey()
  final String employmentType;
  @override
  @JsonKey()
  final String designation;
  @override
  @JsonKey()
  final String password;
  @override
  @JsonKey(fromJson: AppUtils.anyToDateTime)
  final DateTime? createdAt;
  @override
  @JsonKey()
  final String shopName;
  @override
  @JsonKey()
  final String shopContactNumber;
  @override
  @JsonKey()
  final String shopAddress;
  @override
  @JsonKey()
  final String description;

  /// Create a copy of EmployeeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EmployeeModelCopyWith<_EmployeeModel> get copyWith =>
      __$EmployeeModelCopyWithImpl<_EmployeeModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$EmployeeModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EmployeeModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.recruiterId, recruiterId) ||
                other.recruiterId == recruiterId) &&
            (identical(other.shopId, shopId) || other.shopId == shopId) &&
            (identical(other.employeeName, employeeName) ||
                other.employeeName == employeeName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage) &&
            (identical(other.salary, salary) || other.salary == salary) &&
            (identical(other.shiftTiming, shiftTiming) ||
                other.shiftTiming == shiftTiming) &&
            (identical(other.shiftType, shiftType) ||
                other.shiftType == shiftType) &&
            (identical(other.employmentType, employmentType) ||
                other.employmentType == employmentType) &&
            (identical(other.designation, designation) ||
                other.designation == designation) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.shopName, shopName) ||
                other.shopName == shopName) &&
            (identical(other.shopContactNumber, shopContactNumber) ||
                other.shopContactNumber == shopContactNumber) &&
            (identical(other.shopAddress, shopAddress) ||
                other.shopAddress == shopAddress) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      recruiterId,
      shopId,
      employeeName,
      email,
      phoneNumber,
      profileImage,
      salary,
      shiftTiming,
      shiftType,
      employmentType,
      designation,
      password,
      createdAt,
      shopName,
      shopContactNumber,
      shopAddress,
      description);

  @override
  String toString() {
    return 'EmployeeModel(id: $id, recruiterId: $recruiterId, shopId: $shopId, employeeName: $employeeName, email: $email, phoneNumber: $phoneNumber, profileImage: $profileImage, salary: $salary, shiftTiming: $shiftTiming, shiftType: $shiftType, employmentType: $employmentType, designation: $designation, password: $password, createdAt: $createdAt, shopName: $shopName, shopContactNumber: $shopContactNumber, shopAddress: $shopAddress, description: $description)';
  }
}

/// @nodoc
abstract mixin class _$EmployeeModelCopyWith<$Res>
    implements $EmployeeModelCopyWith<$Res> {
  factory _$EmployeeModelCopyWith(
          _EmployeeModel value, $Res Function(_EmployeeModel) _then) =
      __$EmployeeModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      int recruiterId,
      int shopId,
      String employeeName,
      String email,
      String phoneNumber,
      String profileImage,
      String salary,
      String shiftTiming,
      String shiftType,
      String employmentType,
      String designation,
      String password,
      @JsonKey(fromJson: AppUtils.anyToDateTime) DateTime? createdAt,
      String shopName,
      String shopContactNumber,
      String shopAddress,
      String description});
}

/// @nodoc
class __$EmployeeModelCopyWithImpl<$Res>
    implements _$EmployeeModelCopyWith<$Res> {
  __$EmployeeModelCopyWithImpl(this._self, this._then);

  final _EmployeeModel _self;
  final $Res Function(_EmployeeModel) _then;

  /// Create a copy of EmployeeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? recruiterId = null,
    Object? shopId = null,
    Object? employeeName = null,
    Object? email = null,
    Object? phoneNumber = null,
    Object? profileImage = null,
    Object? salary = null,
    Object? shiftTiming = null,
    Object? shiftType = null,
    Object? employmentType = null,
    Object? designation = null,
    Object? password = null,
    Object? createdAt = freezed,
    Object? shopName = null,
    Object? shopContactNumber = null,
    Object? shopAddress = null,
    Object? description = null,
  }) {
    return _then(_EmployeeModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      recruiterId: null == recruiterId
          ? _self.recruiterId
          : recruiterId // ignore: cast_nullable_to_non_nullable
              as int,
      shopId: null == shopId
          ? _self.shopId
          : shopId // ignore: cast_nullable_to_non_nullable
              as int,
      employeeName: null == employeeName
          ? _self.employeeName
          : employeeName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _self.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      profileImage: null == profileImage
          ? _self.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String,
      salary: null == salary
          ? _self.salary
          : salary // ignore: cast_nullable_to_non_nullable
              as String,
      shiftTiming: null == shiftTiming
          ? _self.shiftTiming
          : shiftTiming // ignore: cast_nullable_to_non_nullable
              as String,
      shiftType: null == shiftType
          ? _self.shiftType
          : shiftType // ignore: cast_nullable_to_non_nullable
              as String,
      employmentType: null == employmentType
          ? _self.employmentType
          : employmentType // ignore: cast_nullable_to_non_nullable
              as String,
      designation: null == designation
          ? _self.designation
          : designation // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      shopName: null == shopName
          ? _self.shopName
          : shopName // ignore: cast_nullable_to_non_nullable
              as String,
      shopContactNumber: null == shopContactNumber
          ? _self.shopContactNumber
          : shopContactNumber // ignore: cast_nullable_to_non_nullable
              as String,
      shopAddress: null == shopAddress
          ? _self.shopAddress
          : shopAddress // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
