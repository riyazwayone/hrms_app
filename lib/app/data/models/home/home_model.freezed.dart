// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HomeModel {
  AttendanceModel? get attendance;
  List<EmployeeModel> get employees;

  /// Create a copy of HomeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HomeModelCopyWith<HomeModel> get copyWith =>
      _$HomeModelCopyWithImpl<HomeModel>(this as HomeModel, _$identity);

  /// Serializes this HomeModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HomeModel &&
            (identical(other.attendance, attendance) ||
                other.attendance == attendance) &&
            const DeepCollectionEquality().equals(other.employees, employees));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, attendance, const DeepCollectionEquality().hash(employees));

  @override
  String toString() {
    return 'HomeModel(attendance: $attendance, employees: $employees)';
  }
}

/// @nodoc
abstract mixin class $HomeModelCopyWith<$Res> {
  factory $HomeModelCopyWith(HomeModel value, $Res Function(HomeModel) _then) =
      _$HomeModelCopyWithImpl;
  @useResult
  $Res call({AttendanceModel? attendance, List<EmployeeModel> employees});

  $AttendanceModelCopyWith<$Res>? get attendance;
}

/// @nodoc
class _$HomeModelCopyWithImpl<$Res> implements $HomeModelCopyWith<$Res> {
  _$HomeModelCopyWithImpl(this._self, this._then);

  final HomeModel _self;
  final $Res Function(HomeModel) _then;

  /// Create a copy of HomeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attendance = freezed,
    Object? employees = null,
  }) {
    return _then(_self.copyWith(
      attendance: freezed == attendance
          ? _self.attendance
          : attendance // ignore: cast_nullable_to_non_nullable
              as AttendanceModel?,
      employees: null == employees
          ? _self.employees
          : employees // ignore: cast_nullable_to_non_nullable
              as List<EmployeeModel>,
    ));
  }

  /// Create a copy of HomeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AttendanceModelCopyWith<$Res>? get attendance {
    if (_self.attendance == null) {
      return null;
    }

    return $AttendanceModelCopyWith<$Res>(_self.attendance!, (value) {
      return _then(_self.copyWith(attendance: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _HomeModel implements HomeModel {
  _HomeModel({this.attendance, final List<EmployeeModel> employees = const []})
      : _employees = employees;
  factory _HomeModel.fromJson(Map<String, dynamic> json) =>
      _$HomeModelFromJson(json);

  @override
  final AttendanceModel? attendance;
  final List<EmployeeModel> _employees;
  @override
  @JsonKey()
  List<EmployeeModel> get employees {
    if (_employees is EqualUnmodifiableListView) return _employees;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_employees);
  }

  /// Create a copy of HomeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$HomeModelCopyWith<_HomeModel> get copyWith =>
      __$HomeModelCopyWithImpl<_HomeModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$HomeModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HomeModel &&
            (identical(other.attendance, attendance) ||
                other.attendance == attendance) &&
            const DeepCollectionEquality()
                .equals(other._employees, _employees));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, attendance, const DeepCollectionEquality().hash(_employees));

  @override
  String toString() {
    return 'HomeModel(attendance: $attendance, employees: $employees)';
  }
}

/// @nodoc
abstract mixin class _$HomeModelCopyWith<$Res>
    implements $HomeModelCopyWith<$Res> {
  factory _$HomeModelCopyWith(
          _HomeModel value, $Res Function(_HomeModel) _then) =
      __$HomeModelCopyWithImpl;
  @override
  @useResult
  $Res call({AttendanceModel? attendance, List<EmployeeModel> employees});

  @override
  $AttendanceModelCopyWith<$Res>? get attendance;
}

/// @nodoc
class __$HomeModelCopyWithImpl<$Res> implements _$HomeModelCopyWith<$Res> {
  __$HomeModelCopyWithImpl(this._self, this._then);

  final _HomeModel _self;
  final $Res Function(_HomeModel) _then;

  /// Create a copy of HomeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? attendance = freezed,
    Object? employees = null,
  }) {
    return _then(_HomeModel(
      attendance: freezed == attendance
          ? _self.attendance
          : attendance // ignore: cast_nullable_to_non_nullable
              as AttendanceModel?,
      employees: null == employees
          ? _self._employees
          : employees // ignore: cast_nullable_to_non_nullable
              as List<EmployeeModel>,
    ));
  }

  /// Create a copy of HomeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AttendanceModelCopyWith<$Res>? get attendance {
    if (_self.attendance == null) {
      return null;
    }

    return $AttendanceModelCopyWith<$Res>(_self.attendance!, (value) {
      return _then(_self.copyWith(attendance: value));
    });
  }
}

// dart format on
