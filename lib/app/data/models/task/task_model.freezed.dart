// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TaskModel _$TaskModelFromJson(Map<String, dynamic> json) {
  return _TaskModel.fromJson(json);
}

/// @nodoc
mixin _$TaskModel {
  int? get id => throw _privateConstructorUsedError;
  String get taskTitle => throw _privateConstructorUsedError;
  String get department => throw _privateConstructorUsedError;
  String get taskDescription => throw _privateConstructorUsedError;
  @JsonKey(fromJson: AppUtils.anyToDateTime)
  DateTime? get deadline => throw _privateConstructorUsedError;
  String get priority => throw _privateConstructorUsedError;
  int get employeeId => throw _privateConstructorUsedError;
  String get employeeName => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  int get shopId => throw _privateConstructorUsedError;
  String get assignedBy => throw _privateConstructorUsedError;
  @JsonKey(fromJson: AppUtils.anyToDateTime)
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this TaskModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TaskModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaskModelCopyWith<TaskModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskModelCopyWith<$Res> {
  factory $TaskModelCopyWith(TaskModel value, $Res Function(TaskModel) then) =
      _$TaskModelCopyWithImpl<$Res, TaskModel>;
  @useResult
  $Res call(
      {int? id,
      String taskTitle,
      String department,
      String taskDescription,
      @JsonKey(fromJson: AppUtils.anyToDateTime) DateTime? deadline,
      String priority,
      int employeeId,
      String employeeName,
      String status,
      int userId,
      int shopId,
      String assignedBy,
      @JsonKey(fromJson: AppUtils.anyToDateTime) DateTime? createdAt});
}

/// @nodoc
class _$TaskModelCopyWithImpl<$Res, $Val extends TaskModel>
    implements $TaskModelCopyWith<$Res> {
  _$TaskModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaskModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? taskTitle = null,
    Object? department = null,
    Object? taskDescription = null,
    Object? deadline = freezed,
    Object? priority = null,
    Object? employeeId = null,
    Object? employeeName = null,
    Object? status = null,
    Object? userId = null,
    Object? shopId = null,
    Object? assignedBy = null,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      taskTitle: null == taskTitle
          ? _value.taskTitle
          : taskTitle // ignore: cast_nullable_to_non_nullable
              as String,
      department: null == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as String,
      taskDescription: null == taskDescription
          ? _value.taskDescription
          : taskDescription // ignore: cast_nullable_to_non_nullable
              as String,
      deadline: freezed == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String,
      employeeId: null == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int,
      employeeName: null == employeeName
          ? _value.employeeName
          : employeeName // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      shopId: null == shopId
          ? _value.shopId
          : shopId // ignore: cast_nullable_to_non_nullable
              as int,
      assignedBy: null == assignedBy
          ? _value.assignedBy
          : assignedBy // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskModelImplCopyWith<$Res>
    implements $TaskModelCopyWith<$Res> {
  factory _$$TaskModelImplCopyWith(
          _$TaskModelImpl value, $Res Function(_$TaskModelImpl) then) =
      __$$TaskModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String taskTitle,
      String department,
      String taskDescription,
      @JsonKey(fromJson: AppUtils.anyToDateTime) DateTime? deadline,
      String priority,
      int employeeId,
      String employeeName,
      String status,
      int userId,
      int shopId,
      String assignedBy,
      @JsonKey(fromJson: AppUtils.anyToDateTime) DateTime? createdAt});
}

/// @nodoc
class __$$TaskModelImplCopyWithImpl<$Res>
    extends _$TaskModelCopyWithImpl<$Res, _$TaskModelImpl>
    implements _$$TaskModelImplCopyWith<$Res> {
  __$$TaskModelImplCopyWithImpl(
      _$TaskModelImpl _value, $Res Function(_$TaskModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? taskTitle = null,
    Object? department = null,
    Object? taskDescription = null,
    Object? deadline = freezed,
    Object? priority = null,
    Object? employeeId = null,
    Object? employeeName = null,
    Object? status = null,
    Object? userId = null,
    Object? shopId = null,
    Object? assignedBy = null,
    Object? createdAt = freezed,
  }) {
    return _then(_$TaskModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      taskTitle: null == taskTitle
          ? _value.taskTitle
          : taskTitle // ignore: cast_nullable_to_non_nullable
              as String,
      department: null == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as String,
      taskDescription: null == taskDescription
          ? _value.taskDescription
          : taskDescription // ignore: cast_nullable_to_non_nullable
              as String,
      deadline: freezed == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String,
      employeeId: null == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int,
      employeeName: null == employeeName
          ? _value.employeeName
          : employeeName // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      shopId: null == shopId
          ? _value.shopId
          : shopId // ignore: cast_nullable_to_non_nullable
              as int,
      assignedBy: null == assignedBy
          ? _value.assignedBy
          : assignedBy // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$TaskModelImpl implements _TaskModel {
  _$TaskModelImpl(
      {this.id,
      this.taskTitle = "",
      this.department = "",
      this.taskDescription = "",
      @JsonKey(fromJson: AppUtils.anyToDateTime) this.deadline,
      this.priority = "",
      this.employeeId = 0,
      this.employeeName = "",
      this.status = "incomplete",
      this.userId = 0,
      this.shopId = 0,
      this.assignedBy = "",
      @JsonKey(fromJson: AppUtils.anyToDateTime) this.createdAt});

  factory _$TaskModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskModelImplFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey()
  final String taskTitle;
  @override
  @JsonKey()
  final String department;
  @override
  @JsonKey()
  final String taskDescription;
  @override
  @JsonKey(fromJson: AppUtils.anyToDateTime)
  final DateTime? deadline;
  @override
  @JsonKey()
  final String priority;
  @override
  @JsonKey()
  final int employeeId;
  @override
  @JsonKey()
  final String employeeName;
  @override
  @JsonKey()
  final String status;
  @override
  @JsonKey()
  final int userId;
  @override
  @JsonKey()
  final int shopId;
  @override
  @JsonKey()
  final String assignedBy;
  @override
  @JsonKey(fromJson: AppUtils.anyToDateTime)
  final DateTime? createdAt;

  @override
  String toString() {
    return 'TaskModel(id: $id, taskTitle: $taskTitle, department: $department, taskDescription: $taskDescription, deadline: $deadline, priority: $priority, employeeId: $employeeId, employeeName: $employeeName, status: $status, userId: $userId, shopId: $shopId, assignedBy: $assignedBy, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.taskTitle, taskTitle) ||
                other.taskTitle == taskTitle) &&
            (identical(other.department, department) ||
                other.department == department) &&
            (identical(other.taskDescription, taskDescription) ||
                other.taskDescription == taskDescription) &&
            (identical(other.deadline, deadline) ||
                other.deadline == deadline) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId) &&
            (identical(other.employeeName, employeeName) ||
                other.employeeName == employeeName) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.shopId, shopId) || other.shopId == shopId) &&
            (identical(other.assignedBy, assignedBy) ||
                other.assignedBy == assignedBy) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      taskTitle,
      department,
      taskDescription,
      deadline,
      priority,
      employeeId,
      employeeName,
      status,
      userId,
      shopId,
      assignedBy,
      createdAt);

  /// Create a copy of TaskModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskModelImplCopyWith<_$TaskModelImpl> get copyWith =>
      __$$TaskModelImplCopyWithImpl<_$TaskModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskModelImplToJson(
      this,
    );
  }
}

abstract class _TaskModel implements TaskModel {
  factory _TaskModel(
      {final int? id,
      final String taskTitle,
      final String department,
      final String taskDescription,
      @JsonKey(fromJson: AppUtils.anyToDateTime) final DateTime? deadline,
      final String priority,
      final int employeeId,
      final String employeeName,
      final String status,
      final int userId,
      final int shopId,
      final String assignedBy,
      @JsonKey(fromJson: AppUtils.anyToDateTime)
      final DateTime? createdAt}) = _$TaskModelImpl;

  factory _TaskModel.fromJson(Map<String, dynamic> json) =
      _$TaskModelImpl.fromJson;

  @override
  int? get id;
  @override
  String get taskTitle;
  @override
  String get department;
  @override
  String get taskDescription;
  @override
  @JsonKey(fromJson: AppUtils.anyToDateTime)
  DateTime? get deadline;
  @override
  String get priority;
  @override
  int get employeeId;
  @override
  String get employeeName;
  @override
  String get status;
  @override
  int get userId;
  @override
  int get shopId;
  @override
  String get assignedBy;
  @override
  @JsonKey(fromJson: AppUtils.anyToDateTime)
  DateTime? get createdAt;

  /// Create a copy of TaskModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskModelImplCopyWith<_$TaskModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
