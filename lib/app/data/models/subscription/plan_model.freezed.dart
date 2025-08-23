// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plan_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlanModel {
  int? get id;
  String get planName;
  @JsonKey(fromJson: AppUtils.anyToDouble)
  double get price;
  int get shopNumber;
  int get employeeLimit;
  @JsonKey(fromJson: AppUtils.anyToBool)
  bool? get isRecommended;

  /// Create a copy of PlanModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PlanModelCopyWith<PlanModel> get copyWith =>
      _$PlanModelCopyWithImpl<PlanModel>(this as PlanModel, _$identity);

  /// Serializes this PlanModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PlanModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.planName, planName) ||
                other.planName == planName) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.shopNumber, shopNumber) ||
                other.shopNumber == shopNumber) &&
            (identical(other.employeeLimit, employeeLimit) ||
                other.employeeLimit == employeeLimit) &&
            (identical(other.isRecommended, isRecommended) ||
                other.isRecommended == isRecommended));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, planName, price, shopNumber,
      employeeLimit, isRecommended);

  @override
  String toString() {
    return 'PlanModel(id: $id, planName: $planName, price: $price, shopNumber: $shopNumber, employeeLimit: $employeeLimit, isRecommended: $isRecommended)';
  }
}

/// @nodoc
abstract mixin class $PlanModelCopyWith<$Res> {
  factory $PlanModelCopyWith(PlanModel value, $Res Function(PlanModel) _then) =
      _$PlanModelCopyWithImpl;
  @useResult
  $Res call(
      {int? id,
      String planName,
      @JsonKey(fromJson: AppUtils.anyToDouble) double price,
      int shopNumber,
      int employeeLimit,
      @JsonKey(fromJson: AppUtils.anyToBool) bool? isRecommended});
}

/// @nodoc
class _$PlanModelCopyWithImpl<$Res> implements $PlanModelCopyWith<$Res> {
  _$PlanModelCopyWithImpl(this._self, this._then);

  final PlanModel _self;
  final $Res Function(PlanModel) _then;

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
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      planName: null == planName
          ? _self.planName
          : planName // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      shopNumber: null == shopNumber
          ? _self.shopNumber
          : shopNumber // ignore: cast_nullable_to_non_nullable
              as int,
      employeeLimit: null == employeeLimit
          ? _self.employeeLimit
          : employeeLimit // ignore: cast_nullable_to_non_nullable
              as int,
      isRecommended: freezed == isRecommended
          ? _self.isRecommended
          : isRecommended // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _PlanModel implements PlanModel {
  _PlanModel(
      {this.id = 0,
      required this.planName,
      @JsonKey(fromJson: AppUtils.anyToDouble) this.price = 0.0,
      required this.shopNumber,
      required this.employeeLimit,
      @JsonKey(fromJson: AppUtils.anyToBool) this.isRecommended = false});
  factory _PlanModel.fromJson(Map<String, dynamic> json) =>
      _$PlanModelFromJson(json);

  @override
  @JsonKey()
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

  /// Create a copy of PlanModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PlanModelCopyWith<_PlanModel> get copyWith =>
      __$PlanModelCopyWithImpl<_PlanModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PlanModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PlanModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.planName, planName) ||
                other.planName == planName) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.shopNumber, shopNumber) ||
                other.shopNumber == shopNumber) &&
            (identical(other.employeeLimit, employeeLimit) ||
                other.employeeLimit == employeeLimit) &&
            (identical(other.isRecommended, isRecommended) ||
                other.isRecommended == isRecommended));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, planName, price, shopNumber,
      employeeLimit, isRecommended);

  @override
  String toString() {
    return 'PlanModel(id: $id, planName: $planName, price: $price, shopNumber: $shopNumber, employeeLimit: $employeeLimit, isRecommended: $isRecommended)';
  }
}

/// @nodoc
abstract mixin class _$PlanModelCopyWith<$Res>
    implements $PlanModelCopyWith<$Res> {
  factory _$PlanModelCopyWith(
          _PlanModel value, $Res Function(_PlanModel) _then) =
      __$PlanModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? id,
      String planName,
      @JsonKey(fromJson: AppUtils.anyToDouble) double price,
      int shopNumber,
      int employeeLimit,
      @JsonKey(fromJson: AppUtils.anyToBool) bool? isRecommended});
}

/// @nodoc
class __$PlanModelCopyWithImpl<$Res> implements _$PlanModelCopyWith<$Res> {
  __$PlanModelCopyWithImpl(this._self, this._then);

  final _PlanModel _self;
  final $Res Function(_PlanModel) _then;

  /// Create a copy of PlanModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? planName = null,
    Object? price = null,
    Object? shopNumber = null,
    Object? employeeLimit = null,
    Object? isRecommended = freezed,
  }) {
    return _then(_PlanModel(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      planName: null == planName
          ? _self.planName
          : planName // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      shopNumber: null == shopNumber
          ? _self.shopNumber
          : shopNumber // ignore: cast_nullable_to_non_nullable
              as int,
      employeeLimit: null == employeeLimit
          ? _self.employeeLimit
          : employeeLimit // ignore: cast_nullable_to_non_nullable
              as int,
      isRecommended: freezed == isRecommended
          ? _self.isRecommended
          : isRecommended // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

// dart format on
