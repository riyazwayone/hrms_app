// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendance_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AttendanceModel {
  @JsonKey(fromJson: AppUtils.anyToDateTime)
  DateTime? get attendanceDate;
  @JsonKey(fromJson: AppUtils.anyToDuration)
  Duration? get inTime;
  @JsonKey(fromJson: AppUtils.anyToDuration)
  Duration? get outTime;
  @JsonKey(fromJson: AppUtils.anyToDuration)
  Duration? get earlyArrival;
  @JsonKey(fromJson: AppUtils.anyToDuration)
  Duration? get lateHour;
  @JsonKey(fromJson: AppUtils.anyToDuration)
  Duration? get earlyLeave;
  @JsonKey(fromJson: AppUtils.anyToDuration)
  Duration? get overtime;
  @JsonKey(fromJson: AppUtils.anyToDateTime)
  DateTime? get createdAt;
  String? get status;
  String? get coordinates;
  String? get location;

  /// Create a copy of AttendanceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AttendanceModelCopyWith<AttendanceModel> get copyWith =>
      _$AttendanceModelCopyWithImpl<AttendanceModel>(
          this as AttendanceModel, _$identity);

  /// Serializes this AttendanceModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AttendanceModel &&
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

  @override
  String toString() {
    return 'AttendanceModel(attendanceDate: $attendanceDate, inTime: $inTime, outTime: $outTime, earlyArrival: $earlyArrival, lateHour: $lateHour, earlyLeave: $earlyLeave, overtime: $overtime, createdAt: $createdAt, status: $status, coordinates: $coordinates, location: $location)';
  }
}

/// @nodoc
abstract mixin class $AttendanceModelCopyWith<$Res> {
  factory $AttendanceModelCopyWith(
          AttendanceModel value, $Res Function(AttendanceModel) _then) =
      _$AttendanceModelCopyWithImpl;
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
class _$AttendanceModelCopyWithImpl<$Res>
    implements $AttendanceModelCopyWith<$Res> {
  _$AttendanceModelCopyWithImpl(this._self, this._then);

  final AttendanceModel _self;
  final $Res Function(AttendanceModel) _then;

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
    return _then(_self.copyWith(
      attendanceDate: freezed == attendanceDate
          ? _self.attendanceDate
          : attendanceDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      inTime: freezed == inTime
          ? _self.inTime
          : inTime // ignore: cast_nullable_to_non_nullable
              as Duration?,
      outTime: freezed == outTime
          ? _self.outTime
          : outTime // ignore: cast_nullable_to_non_nullable
              as Duration?,
      earlyArrival: freezed == earlyArrival
          ? _self.earlyArrival
          : earlyArrival // ignore: cast_nullable_to_non_nullable
              as Duration?,
      lateHour: freezed == lateHour
          ? _self.lateHour
          : lateHour // ignore: cast_nullable_to_non_nullable
              as Duration?,
      earlyLeave: freezed == earlyLeave
          ? _self.earlyLeave
          : earlyLeave // ignore: cast_nullable_to_non_nullable
              as Duration?,
      overtime: freezed == overtime
          ? _self.overtime
          : overtime // ignore: cast_nullable_to_non_nullable
              as Duration?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      coordinates: freezed == coordinates
          ? _self.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _AttendanceModel implements AttendanceModel {
  _AttendanceModel(
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
  factory _AttendanceModel.fromJson(Map<String, dynamic> json) =>
      _$AttendanceModelFromJson(json);

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

  /// Create a copy of AttendanceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AttendanceModelCopyWith<_AttendanceModel> get copyWith =>
      __$AttendanceModelCopyWithImpl<_AttendanceModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AttendanceModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AttendanceModel &&
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

  @override
  String toString() {
    return 'AttendanceModel(attendanceDate: $attendanceDate, inTime: $inTime, outTime: $outTime, earlyArrival: $earlyArrival, lateHour: $lateHour, earlyLeave: $earlyLeave, overtime: $overtime, createdAt: $createdAt, status: $status, coordinates: $coordinates, location: $location)';
  }
}

/// @nodoc
abstract mixin class _$AttendanceModelCopyWith<$Res>
    implements $AttendanceModelCopyWith<$Res> {
  factory _$AttendanceModelCopyWith(
          _AttendanceModel value, $Res Function(_AttendanceModel) _then) =
      __$AttendanceModelCopyWithImpl;
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
class __$AttendanceModelCopyWithImpl<$Res>
    implements _$AttendanceModelCopyWith<$Res> {
  __$AttendanceModelCopyWithImpl(this._self, this._then);

  final _AttendanceModel _self;
  final $Res Function(_AttendanceModel) _then;

  /// Create a copy of AttendanceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_AttendanceModel(
      attendanceDate: freezed == attendanceDate
          ? _self.attendanceDate
          : attendanceDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      inTime: freezed == inTime
          ? _self.inTime
          : inTime // ignore: cast_nullable_to_non_nullable
              as Duration?,
      outTime: freezed == outTime
          ? _self.outTime
          : outTime // ignore: cast_nullable_to_non_nullable
              as Duration?,
      earlyArrival: freezed == earlyArrival
          ? _self.earlyArrival
          : earlyArrival // ignore: cast_nullable_to_non_nullable
              as Duration?,
      lateHour: freezed == lateHour
          ? _self.lateHour
          : lateHour // ignore: cast_nullable_to_non_nullable
              as Duration?,
      earlyLeave: freezed == earlyLeave
          ? _self.earlyLeave
          : earlyLeave // ignore: cast_nullable_to_non_nullable
              as Duration?,
      overtime: freezed == overtime
          ? _self.overtime
          : overtime // ignore: cast_nullable_to_non_nullable
              as Duration?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      coordinates: freezed == coordinates
          ? _self.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
