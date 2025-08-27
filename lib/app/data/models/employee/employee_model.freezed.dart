// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'employee_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EmployeeModel _$EmployeeModelFromJson(Map<String, dynamic> json) {
  return _EmployeeModel.fromJson(json);
}

/// @nodoc
mixin _$EmployeeModel {
  int get id => throw _privateConstructorUsedError;
  int get recruiterId => throw _privateConstructorUsedError;
  int get shopId => throw _privateConstructorUsedError;
  String get employeeName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String get profileImage => throw _privateConstructorUsedError;
  String get salary => throw _privateConstructorUsedError;
  String get shiftTiming => throw _privateConstructorUsedError;
  String get shiftType => throw _privateConstructorUsedError;
  String get employmentType => throw _privateConstructorUsedError;
  String get designation => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  @JsonKey(fromJson: AppUtils.anyToDateTime)
  DateTime? get createdAt => throw _privateConstructorUsedError;
  String get shopName => throw _privateConstructorUsedError;
  String get shopContactNumber => throw _privateConstructorUsedError;
  String get shopAddress => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get punchInDays => throw _privateConstructorUsedError;
  String get punchInPercentage => throw _privateConstructorUsedError;
  @JsonKey(fromJson: AppUtils.anyToDuration)
  Duration? get inTime => throw _privateConstructorUsedError;
  @JsonKey(fromJson: AppUtils.anyToDuration)
  Duration? get outTime => throw _privateConstructorUsedError;

  /// Serializes this EmployeeModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EmployeeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EmployeeModelCopyWith<EmployeeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmployeeModelCopyWith<$Res> {
  factory $EmployeeModelCopyWith(
          EmployeeModel value, $Res Function(EmployeeModel) then) =
      _$EmployeeModelCopyWithImpl<$Res, EmployeeModel>;
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
      String description,
      String punchInDays,
      String punchInPercentage,
      @JsonKey(fromJson: AppUtils.anyToDuration) Duration? inTime,
      @JsonKey(fromJson: AppUtils.anyToDuration) Duration? outTime});
}

/// @nodoc
class _$EmployeeModelCopyWithImpl<$Res, $Val extends EmployeeModel>
    implements $EmployeeModelCopyWith<$Res> {
  _$EmployeeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    Object? punchInDays = null,
    Object? punchInPercentage = null,
    Object? inTime = freezed,
    Object? outTime = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      recruiterId: null == recruiterId
          ? _value.recruiterId
          : recruiterId // ignore: cast_nullable_to_non_nullable
              as int,
      shopId: null == shopId
          ? _value.shopId
          : shopId // ignore: cast_nullable_to_non_nullable
              as int,
      employeeName: null == employeeName
          ? _value.employeeName
          : employeeName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      profileImage: null == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String,
      salary: null == salary
          ? _value.salary
          : salary // ignore: cast_nullable_to_non_nullable
              as String,
      shiftTiming: null == shiftTiming
          ? _value.shiftTiming
          : shiftTiming // ignore: cast_nullable_to_non_nullable
              as String,
      shiftType: null == shiftType
          ? _value.shiftType
          : shiftType // ignore: cast_nullable_to_non_nullable
              as String,
      employmentType: null == employmentType
          ? _value.employmentType
          : employmentType // ignore: cast_nullable_to_non_nullable
              as String,
      designation: null == designation
          ? _value.designation
          : designation // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      shopName: null == shopName
          ? _value.shopName
          : shopName // ignore: cast_nullable_to_non_nullable
              as String,
      shopContactNumber: null == shopContactNumber
          ? _value.shopContactNumber
          : shopContactNumber // ignore: cast_nullable_to_non_nullable
              as String,
      shopAddress: null == shopAddress
          ? _value.shopAddress
          : shopAddress // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      punchInDays: null == punchInDays
          ? _value.punchInDays
          : punchInDays // ignore: cast_nullable_to_non_nullable
              as String,
      punchInPercentage: null == punchInPercentage
          ? _value.punchInPercentage
          : punchInPercentage // ignore: cast_nullable_to_non_nullable
              as String,
      inTime: freezed == inTime
          ? _value.inTime
          : inTime // ignore: cast_nullable_to_non_nullable
              as Duration?,
      outTime: freezed == outTime
          ? _value.outTime
          : outTime // ignore: cast_nullable_to_non_nullable
              as Duration?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EmployeeModelImplCopyWith<$Res>
    implements $EmployeeModelCopyWith<$Res> {
  factory _$$EmployeeModelImplCopyWith(
          _$EmployeeModelImpl value, $Res Function(_$EmployeeModelImpl) then) =
      __$$EmployeeModelImplCopyWithImpl<$Res>;
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
      String description,
      String punchInDays,
      String punchInPercentage,
      @JsonKey(fromJson: AppUtils.anyToDuration) Duration? inTime,
      @JsonKey(fromJson: AppUtils.anyToDuration) Duration? outTime});
}

/// @nodoc
class __$$EmployeeModelImplCopyWithImpl<$Res>
    extends _$EmployeeModelCopyWithImpl<$Res, _$EmployeeModelImpl>
    implements _$$EmployeeModelImplCopyWith<$Res> {
  __$$EmployeeModelImplCopyWithImpl(
      _$EmployeeModelImpl _value, $Res Function(_$EmployeeModelImpl) _then)
      : super(_value, _then);

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
    Object? punchInDays = null,
    Object? punchInPercentage = null,
    Object? inTime = freezed,
    Object? outTime = freezed,
  }) {
    return _then(_$EmployeeModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      recruiterId: null == recruiterId
          ? _value.recruiterId
          : recruiterId // ignore: cast_nullable_to_non_nullable
              as int,
      shopId: null == shopId
          ? _value.shopId
          : shopId // ignore: cast_nullable_to_non_nullable
              as int,
      employeeName: null == employeeName
          ? _value.employeeName
          : employeeName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      profileImage: null == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String,
      salary: null == salary
          ? _value.salary
          : salary // ignore: cast_nullable_to_non_nullable
              as String,
      shiftTiming: null == shiftTiming
          ? _value.shiftTiming
          : shiftTiming // ignore: cast_nullable_to_non_nullable
              as String,
      shiftType: null == shiftType
          ? _value.shiftType
          : shiftType // ignore: cast_nullable_to_non_nullable
              as String,
      employmentType: null == employmentType
          ? _value.employmentType
          : employmentType // ignore: cast_nullable_to_non_nullable
              as String,
      designation: null == designation
          ? _value.designation
          : designation // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      shopName: null == shopName
          ? _value.shopName
          : shopName // ignore: cast_nullable_to_non_nullable
              as String,
      shopContactNumber: null == shopContactNumber
          ? _value.shopContactNumber
          : shopContactNumber // ignore: cast_nullable_to_non_nullable
              as String,
      shopAddress: null == shopAddress
          ? _value.shopAddress
          : shopAddress // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      punchInDays: null == punchInDays
          ? _value.punchInDays
          : punchInDays // ignore: cast_nullable_to_non_nullable
              as String,
      punchInPercentage: null == punchInPercentage
          ? _value.punchInPercentage
          : punchInPercentage // ignore: cast_nullable_to_non_nullable
              as String,
      inTime: freezed == inTime
          ? _value.inTime
          : inTime // ignore: cast_nullable_to_non_nullable
              as Duration?,
      outTime: freezed == outTime
          ? _value.outTime
          : outTime // ignore: cast_nullable_to_non_nullable
              as Duration?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$EmployeeModelImpl implements _EmployeeModel {
  const _$EmployeeModelImpl(
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
      this.description = '',
      this.punchInDays = '',
      this.punchInPercentage = '',
      @JsonKey(fromJson: AppUtils.anyToDuration) this.inTime,
      @JsonKey(fromJson: AppUtils.anyToDuration) this.outTime});

  factory _$EmployeeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmployeeModelImplFromJson(json);

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
  @override
  @JsonKey()
  final String punchInDays;
  @override
  @JsonKey()
  final String punchInPercentage;
  @override
  @JsonKey(fromJson: AppUtils.anyToDuration)
  final Duration? inTime;
  @override
  @JsonKey(fromJson: AppUtils.anyToDuration)
  final Duration? outTime;

  @override
  String toString() {
    return 'EmployeeModel(id: $id, recruiterId: $recruiterId, shopId: $shopId, employeeName: $employeeName, email: $email, phoneNumber: $phoneNumber, profileImage: $profileImage, salary: $salary, shiftTiming: $shiftTiming, shiftType: $shiftType, employmentType: $employmentType, designation: $designation, password: $password, createdAt: $createdAt, shopName: $shopName, shopContactNumber: $shopContactNumber, shopAddress: $shopAddress, description: $description, punchInDays: $punchInDays, punchInPercentage: $punchInPercentage, inTime: $inTime, outTime: $outTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmployeeModelImpl &&
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
                other.description == description) &&
            (identical(other.punchInDays, punchInDays) ||
                other.punchInDays == punchInDays) &&
            (identical(other.punchInPercentage, punchInPercentage) ||
                other.punchInPercentage == punchInPercentage) &&
            (identical(other.inTime, inTime) || other.inTime == inTime) &&
            (identical(other.outTime, outTime) || other.outTime == outTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
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
        description,
        punchInDays,
        punchInPercentage,
        inTime,
        outTime
      ]);

  /// Create a copy of EmployeeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmployeeModelImplCopyWith<_$EmployeeModelImpl> get copyWith =>
      __$$EmployeeModelImplCopyWithImpl<_$EmployeeModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EmployeeModelImplToJson(
      this,
    );
  }
}

abstract class _EmployeeModel implements EmployeeModel {
  const factory _EmployeeModel(
          {final int id,
          final int recruiterId,
          final int shopId,
          final String employeeName,
          final String email,
          final String phoneNumber,
          final String profileImage,
          final String salary,
          final String shiftTiming,
          final String shiftType,
          final String employmentType,
          final String designation,
          final String password,
          @JsonKey(fromJson: AppUtils.anyToDateTime) final DateTime? createdAt,
          final String shopName,
          final String shopContactNumber,
          final String shopAddress,
          final String description,
          final String punchInDays,
          final String punchInPercentage,
          @JsonKey(fromJson: AppUtils.anyToDuration) final Duration? inTime,
          @JsonKey(fromJson: AppUtils.anyToDuration) final Duration? outTime}) =
      _$EmployeeModelImpl;

  factory _EmployeeModel.fromJson(Map<String, dynamic> json) =
      _$EmployeeModelImpl.fromJson;

  @override
  int get id;
  @override
  int get recruiterId;
  @override
  int get shopId;
  @override
  String get employeeName;
  @override
  String get email;
  @override
  String get phoneNumber;
  @override
  String get profileImage;
  @override
  String get salary;
  @override
  String get shiftTiming;
  @override
  String get shiftType;
  @override
  String get employmentType;
  @override
  String get designation;
  @override
  String get password;
  @override
  @JsonKey(fromJson: AppUtils.anyToDateTime)
  DateTime? get createdAt;
  @override
  String get shopName;
  @override
  String get shopContactNumber;
  @override
  String get shopAddress;
  @override
  String get description;
  @override
  String get punchInDays;
  @override
  String get punchInPercentage;
  @override
  @JsonKey(fromJson: AppUtils.anyToDuration)
  Duration? get inTime;
  @override
  @JsonKey(fromJson: AppUtils.anyToDuration)
  Duration? get outTime;

  /// Create a copy of EmployeeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmployeeModelImplCopyWith<_$EmployeeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
