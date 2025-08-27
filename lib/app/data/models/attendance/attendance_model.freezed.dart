// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendance_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AttendanceModel _$AttendanceModelFromJson(Map<String, dynamic> json) {
  return _AttendanceModel.fromJson(json);
}

/// @nodoc
mixin _$AttendanceModel {
  @JsonKey(fromJson: AppUtils.anyToDateTime)
  DateTime? get attendanceDate => throw _privateConstructorUsedError;
  @JsonKey(fromJson: AppUtils.anyToDuration)
  Duration? get inTime => throw _privateConstructorUsedError;
  @JsonKey(fromJson: AppUtils.anyToDuration)
  Duration? get outTime => throw _privateConstructorUsedError;
  @JsonKey(fromJson: AppUtils.anyToDuration)
  Duration? get earlyArrival => throw _privateConstructorUsedError;
  @JsonKey(fromJson: AppUtils.anyToDuration)
  Duration? get lateHour => throw _privateConstructorUsedError;
  @JsonKey(fromJson: AppUtils.anyToDuration)
  Duration? get earlyLeave => throw _privateConstructorUsedError;
  @JsonKey(fromJson: AppUtils.anyToDuration)
  Duration? get overtime => throw _privateConstructorUsedError;
  @JsonKey(fromJson: AppUtils.anyToDateTime)
  DateTime? get createdAt => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get coordinates => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;

  /// Serializes this AttendanceModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AttendanceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AttendanceModelCopyWith<AttendanceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendanceModelCopyWith<$Res> {
  factory $AttendanceModelCopyWith(
          AttendanceModel value, $Res Function(AttendanceModel) then) =
      _$AttendanceModelCopyWithImpl<$Res, AttendanceModel>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: AppUtils.anyToDateTime) DateTime? attendanceDate,
      @JsonKey(fromJson: AppUtils.anyToDuration) Duration? inTime,
      @JsonKey(fromJson: AppUtils.anyToDuration) Duration? outTime,
      @JsonKey(fromJson: AppUtils.anyToDuration) Duration? earlyArrival,
      @JsonKey(fromJson: AppUtils.anyToDuration) Duration? lateHour,
      @JsonKey(fromJson: AppUtils.anyToDuration) Duration? earlyLeave,
      @JsonKey(fromJson: AppUtils.anyToDuration) Duration? overtime,
      @JsonKey(fromJson: AppUtils.anyToDateTime) DateTime? createdAt,
      String? status,
      String? coordinates,
      String? location});
}

/// @nodoc
class _$AttendanceModelCopyWithImpl<$Res, $Val extends AttendanceModel>
    implements $AttendanceModelCopyWith<$Res> {
  _$AttendanceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AttendanceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attendanceDate = freezed,
    Object? inTime = freezed,
    Object? outTime = freezed,
    Object? earlyArrival = freezed,
    Object? lateHour = freezed,
    Object? earlyLeave = freezed,
    Object? overtime = freezed,
    Object? createdAt = freezed,
    Object? status = freezed,
    Object? coordinates = freezed,
    Object? location = freezed,
  }) {
    return _then(_value.copyWith(
      attendanceDate: freezed == attendanceDate
          ? _value.attendanceDate
          : attendanceDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      inTime: freezed == inTime
          ? _value.inTime
          : inTime // ignore: cast_nullable_to_non_nullable
              as Duration?,
      outTime: freezed == outTime
          ? _value.outTime
          : outTime // ignore: cast_nullable_to_non_nullable
              as Duration?,
      earlyArrival: freezed == earlyArrival
          ? _value.earlyArrival
          : earlyArrival // ignore: cast_nullable_to_non_nullable
              as Duration?,
      lateHour: freezed == lateHour
          ? _value.lateHour
          : lateHour // ignore: cast_nullable_to_non_nullable
              as Duration?,
      earlyLeave: freezed == earlyLeave
          ? _value.earlyLeave
          : earlyLeave // ignore: cast_nullable_to_non_nullable
              as Duration?,
      overtime: freezed == overtime
          ? _value.overtime
          : overtime // ignore: cast_nullable_to_non_nullable
              as Duration?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      coordinates: freezed == coordinates
          ? _value.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AttendanceModelImplCopyWith<$Res>
    implements $AttendanceModelCopyWith<$Res> {
  factory _$$AttendanceModelImplCopyWith(_$AttendanceModelImpl value,
          $Res Function(_$AttendanceModelImpl) then) =
      __$$AttendanceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: AppUtils.anyToDateTime) DateTime? attendanceDate,
      @JsonKey(fromJson: AppUtils.anyToDuration) Duration? inTime,
      @JsonKey(fromJson: AppUtils.anyToDuration) Duration? outTime,
      @JsonKey(fromJson: AppUtils.anyToDuration) Duration? earlyArrival,
      @JsonKey(fromJson: AppUtils.anyToDuration) Duration? lateHour,
      @JsonKey(fromJson: AppUtils.anyToDuration) Duration? earlyLeave,
      @JsonKey(fromJson: AppUtils.anyToDuration) Duration? overtime,
      @JsonKey(fromJson: AppUtils.anyToDateTime) DateTime? createdAt,
      String? status,
      String? coordinates,
      String? location});
}

/// @nodoc
class __$$AttendanceModelImplCopyWithImpl<$Res>
    extends _$AttendanceModelCopyWithImpl<$Res, _$AttendanceModelImpl>
    implements _$$AttendanceModelImplCopyWith<$Res> {
  __$$AttendanceModelImplCopyWithImpl(
      _$AttendanceModelImpl _value, $Res Function(_$AttendanceModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AttendanceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attendanceDate = freezed,
    Object? inTime = freezed,
    Object? outTime = freezed,
    Object? earlyArrival = freezed,
    Object? lateHour = freezed,
    Object? earlyLeave = freezed,
    Object? overtime = freezed,
    Object? createdAt = freezed,
    Object? status = freezed,
    Object? coordinates = freezed,
    Object? location = freezed,
  }) {
    return _then(_$AttendanceModelImpl(
      attendanceDate: freezed == attendanceDate
          ? _value.attendanceDate
          : attendanceDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      inTime: freezed == inTime
          ? _value.inTime
          : inTime // ignore: cast_nullable_to_non_nullable
              as Duration?,
      outTime: freezed == outTime
          ? _value.outTime
          : outTime // ignore: cast_nullable_to_non_nullable
              as Duration?,
      earlyArrival: freezed == earlyArrival
          ? _value.earlyArrival
          : earlyArrival // ignore: cast_nullable_to_non_nullable
              as Duration?,
      lateHour: freezed == lateHour
          ? _value.lateHour
          : lateHour // ignore: cast_nullable_to_non_nullable
              as Duration?,
      earlyLeave: freezed == earlyLeave
          ? _value.earlyLeave
          : earlyLeave // ignore: cast_nullable_to_non_nullable
              as Duration?,
      overtime: freezed == overtime
          ? _value.overtime
          : overtime // ignore: cast_nullable_to_non_nullable
              as Duration?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      coordinates: freezed == coordinates
          ? _value.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$AttendanceModelImpl implements _AttendanceModel {
  _$AttendanceModelImpl(
      {@JsonKey(fromJson: AppUtils.anyToDateTime) this.attendanceDate,
      @JsonKey(fromJson: AppUtils.anyToDuration) this.inTime,
      @JsonKey(fromJson: AppUtils.anyToDuration) this.outTime,
      @JsonKey(fromJson: AppUtils.anyToDuration) this.earlyArrival,
      @JsonKey(fromJson: AppUtils.anyToDuration) this.lateHour,
      @JsonKey(fromJson: AppUtils.anyToDuration) this.earlyLeave,
      @JsonKey(fromJson: AppUtils.anyToDuration) this.overtime,
      @JsonKey(fromJson: AppUtils.anyToDateTime) this.createdAt,
      this.status,
      this.coordinates,
      this.location});

  factory _$AttendanceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttendanceModelImplFromJson(json);

  @override
  @JsonKey(fromJson: AppUtils.anyToDateTime)
  final DateTime? attendanceDate;
  @override
  @JsonKey(fromJson: AppUtils.anyToDuration)
  final Duration? inTime;
  @override
  @JsonKey(fromJson: AppUtils.anyToDuration)
  final Duration? outTime;
  @override
  @JsonKey(fromJson: AppUtils.anyToDuration)
  final Duration? earlyArrival;
  @override
  @JsonKey(fromJson: AppUtils.anyToDuration)
  final Duration? lateHour;
  @override
  @JsonKey(fromJson: AppUtils.anyToDuration)
  final Duration? earlyLeave;
  @override
  @JsonKey(fromJson: AppUtils.anyToDuration)
  final Duration? overtime;
  @override
  @JsonKey(fromJson: AppUtils.anyToDateTime)
  final DateTime? createdAt;
  @override
  final String? status;
  @override
  final String? coordinates;
  @override
  final String? location;

  @override
  String toString() {
    return 'AttendanceModel(attendanceDate: $attendanceDate, inTime: $inTime, outTime: $outTime, earlyArrival: $earlyArrival, lateHour: $lateHour, earlyLeave: $earlyLeave, overtime: $overtime, createdAt: $createdAt, status: $status, coordinates: $coordinates, location: $location)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttendanceModelImpl &&
            (identical(other.attendanceDate, attendanceDate) ||
                other.attendanceDate == attendanceDate) &&
            (identical(other.inTime, inTime) || other.inTime == inTime) &&
            (identical(other.outTime, outTime) || other.outTime == outTime) &&
            (identical(other.earlyArrival, earlyArrival) ||
                other.earlyArrival == earlyArrival) &&
            (identical(other.lateHour, lateHour) ||
                other.lateHour == lateHour) &&
            (identical(other.earlyLeave, earlyLeave) ||
                other.earlyLeave == earlyLeave) &&
            (identical(other.overtime, overtime) ||
                other.overtime == overtime) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.coordinates, coordinates) ||
                other.coordinates == coordinates) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      attendanceDate,
      inTime,
      outTime,
      earlyArrival,
      lateHour,
      earlyLeave,
      overtime,
      createdAt,
      status,
      coordinates,
      location);

  /// Create a copy of AttendanceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AttendanceModelImplCopyWith<_$AttendanceModelImpl> get copyWith =>
      __$$AttendanceModelImplCopyWithImpl<_$AttendanceModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AttendanceModelImplToJson(
      this,
    );
  }
}

abstract class _AttendanceModel implements AttendanceModel {
  factory _AttendanceModel(
      {@JsonKey(fromJson: AppUtils.anyToDateTime)
      final DateTime? attendanceDate,
      @JsonKey(fromJson: AppUtils.anyToDuration) final Duration? inTime,
      @JsonKey(fromJson: AppUtils.anyToDuration) final Duration? outTime,
      @JsonKey(fromJson: AppUtils.anyToDuration) final Duration? earlyArrival,
      @JsonKey(fromJson: AppUtils.anyToDuration) final Duration? lateHour,
      @JsonKey(fromJson: AppUtils.anyToDuration) final Duration? earlyLeave,
      @JsonKey(fromJson: AppUtils.anyToDuration) final Duration? overtime,
      @JsonKey(fromJson: AppUtils.anyToDateTime) final DateTime? createdAt,
      final String? status,
      final String? coordinates,
      final String? location}) = _$AttendanceModelImpl;

  factory _AttendanceModel.fromJson(Map<String, dynamic> json) =
      _$AttendanceModelImpl.fromJson;

  @override
  @JsonKey(fromJson: AppUtils.anyToDateTime)
  DateTime? get attendanceDate;
  @override
  @JsonKey(fromJson: AppUtils.anyToDuration)
  Duration? get inTime;
  @override
  @JsonKey(fromJson: AppUtils.anyToDuration)
  Duration? get outTime;
  @override
  @JsonKey(fromJson: AppUtils.anyToDuration)
  Duration? get earlyArrival;
  @override
  @JsonKey(fromJson: AppUtils.anyToDuration)
  Duration? get lateHour;
  @override
  @JsonKey(fromJson: AppUtils.anyToDuration)
  Duration? get earlyLeave;
  @override
  @JsonKey(fromJson: AppUtils.anyToDuration)
  Duration? get overtime;
  @override
  @JsonKey(fromJson: AppUtils.anyToDateTime)
  DateTime? get createdAt;
  @override
  String? get status;
  @override
  String? get coordinates;
  @override
  String? get location;

  /// Create a copy of AttendanceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AttendanceModelImplCopyWith<_$AttendanceModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
