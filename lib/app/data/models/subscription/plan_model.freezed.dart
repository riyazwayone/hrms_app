// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plan_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PlanModel _$PlanModelFromJson(Map<String, dynamic> json) {
  return _PlanModel.fromJson(json);
}

/// @nodoc
mixin _$PlanModel {
  int? get id => throw _privateConstructorUsedError;
  String get planName => throw _privateConstructorUsedError;
  @JsonKey(fromJson: AppUtils.anyToDouble)
  double get price => throw _privateConstructorUsedError;
  int get shopNumber => throw _privateConstructorUsedError;
  int get employeeLimit => throw _privateConstructorUsedError;
  @JsonKey(fromJson: AppUtils.anyToBool)
  bool? get isRecommended => throw _privateConstructorUsedError;
  @JsonKey(fromJson: AppUtils.anyToDateTime)
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this PlanModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlanModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlanModelCopyWith<PlanModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlanModelCopyWith<$Res> {
  factory $PlanModelCopyWith(PlanModel value, $Res Function(PlanModel) then) =
      _$PlanModelCopyWithImpl<$Res, PlanModel>;
  @useResult
  $Res call(
      {int? id,
      String planName,
      @JsonKey(fromJson: AppUtils.anyToDouble) double price,
      int shopNumber,
      int employeeLimit,
      @JsonKey(fromJson: AppUtils.anyToBool) bool? isRecommended,
      @JsonKey(fromJson: AppUtils.anyToDateTime) DateTime? createdAt});
}

/// @nodoc
class _$PlanModelCopyWithImpl<$Res, $Val extends PlanModel>
    implements $PlanModelCopyWith<$Res> {
  _$PlanModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlanModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? planName = null,
    Object? price = null,
    Object? shopNumber = null,
    Object? employeeLimit = null,
    Object? isRecommended = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      planName: null == planName
          ? _value.planName
          : planName // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      shopNumber: null == shopNumber
          ? _value.shopNumber
          : shopNumber // ignore: cast_nullable_to_non_nullable
              as int,
      employeeLimit: null == employeeLimit
          ? _value.employeeLimit
          : employeeLimit // ignore: cast_nullable_to_non_nullable
              as int,
      isRecommended: freezed == isRecommended
          ? _value.isRecommended
          : isRecommended // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlanModelImplCopyWith<$Res>
    implements $PlanModelCopyWith<$Res> {
  factory _$$PlanModelImplCopyWith(
          _$PlanModelImpl value, $Res Function(_$PlanModelImpl) then) =
      __$$PlanModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String planName,
      @JsonKey(fromJson: AppUtils.anyToDouble) double price,
      int shopNumber,
      int employeeLimit,
      @JsonKey(fromJson: AppUtils.anyToBool) bool? isRecommended,
      @JsonKey(fromJson: AppUtils.anyToDateTime) DateTime? createdAt});
}

/// @nodoc
class __$$PlanModelImplCopyWithImpl<$Res>
    extends _$PlanModelCopyWithImpl<$Res, _$PlanModelImpl>
    implements _$$PlanModelImplCopyWith<$Res> {
  __$$PlanModelImplCopyWithImpl(
      _$PlanModelImpl _value, $Res Function(_$PlanModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlanModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? planName = null,
    Object? price = null,
    Object? shopNumber = null,
    Object? employeeLimit = null,
    Object? isRecommended = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$PlanModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      planName: null == planName
          ? _value.planName
          : planName // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      shopNumber: null == shopNumber
          ? _value.shopNumber
          : shopNumber // ignore: cast_nullable_to_non_nullable
              as int,
      employeeLimit: null == employeeLimit
          ? _value.employeeLimit
          : employeeLimit // ignore: cast_nullable_to_non_nullable
              as int,
      isRecommended: freezed == isRecommended
          ? _value.isRecommended
          : isRecommended // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlanModelImpl implements _PlanModel {
  _$PlanModelImpl(
      {this.id,
      required this.planName,
      @JsonKey(fromJson: AppUtils.anyToDouble) this.price = 0.0,
      required this.shopNumber,
      required this.employeeLimit,
      @JsonKey(fromJson: AppUtils.anyToBool) this.isRecommended = false,
      @JsonKey(fromJson: AppUtils.anyToDateTime) this.createdAt});

  factory _$PlanModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlanModelImplFromJson(json);

  @override
  final int? id;
  @override
  final String planName;
  @override
  @JsonKey(fromJson: AppUtils.anyToDouble)
  final double price;
  @override
  final int shopNumber;
  @override
  final int employeeLimit;
  @override
  @JsonKey(fromJson: AppUtils.anyToBool)
  final bool? isRecommended;
  @override
  @JsonKey(fromJson: AppUtils.anyToDateTime)
  final DateTime? createdAt;

  @override
  String toString() {
    return 'PlanModel(id: $id, planName: $planName, price: $price, shopNumber: $shopNumber, employeeLimit: $employeeLimit, isRecommended: $isRecommended, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlanModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.planName, planName) ||
                other.planName == planName) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.shopNumber, shopNumber) ||
                other.shopNumber == shopNumber) &&
            (identical(other.employeeLimit, employeeLimit) ||
                other.employeeLimit == employeeLimit) &&
            (identical(other.isRecommended, isRecommended) ||
                other.isRecommended == isRecommended) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, planName, price, shopNumber,
      employeeLimit, isRecommended, createdAt);

  /// Create a copy of PlanModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlanModelImplCopyWith<_$PlanModelImpl> get copyWith =>
      __$$PlanModelImplCopyWithImpl<_$PlanModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlanModelImplToJson(
      this,
    );
  }
}

abstract class _PlanModel implements PlanModel {
  factory _PlanModel(
      {final int? id,
      required final String planName,
      @JsonKey(fromJson: AppUtils.anyToDouble) final double price,
      required final int shopNumber,
      required final int employeeLimit,
      @JsonKey(fromJson: AppUtils.anyToBool) final bool? isRecommended,
      @JsonKey(fromJson: AppUtils.anyToDateTime)
      final DateTime? createdAt}) = _$PlanModelImpl;

  factory _PlanModel.fromJson(Map<String, dynamic> json) =
      _$PlanModelImpl.fromJson;

  @override
  int? get id;
  @override
  String get planName;
  @override
  @JsonKey(fromJson: AppUtils.anyToDouble)
  double get price;
  @override
  int get shopNumber;
  @override
  int get employeeLimit;
  @override
  @JsonKey(fromJson: AppUtils.anyToBool)
  bool? get isRecommended;
  @override
  @JsonKey(fromJson: AppUtils.anyToDateTime)
  DateTime? get createdAt;

  /// Create a copy of PlanModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlanModelImplCopyWith<_$PlanModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
