// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TaskModel {
  int? get id;
  String get taskTitle;
  String get department;
  String get taskDescription;
  @JsonKey(fromJson: AppUtils.anyToDateTime)
  DateTime? get deadline;
  String get priority;
  int get employeeId;
  String get employeeName;
  String get status;
  int get userId;
  int get shopId;
  String get assignedBy;
  @JsonKey(fromJson: AppUtils.anyToDateTime)
  DateTime? get createdAt;

  /// Create a copy of TaskModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TaskModelCopyWith<TaskModel> get copyWith =>
      _$TaskModelCopyWithImpl<TaskModel>(this as TaskModel, _$identity);

  /// Serializes this TaskModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TaskModel &&
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

  @override
  String toString() {
    return 'TaskModel(id: $id, taskTitle: $taskTitle, department: $department, taskDescription: $taskDescription, deadline: $deadline, priority: $priority, employeeId: $employeeId, employeeName: $employeeName, status: $status, userId: $userId, shopId: $shopId, assignedBy: $assignedBy, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $TaskModelCopyWith<$Res> {
  factory $TaskModelCopyWith(TaskModel value, $Res Function(TaskModel) _then) =
      _$TaskModelCopyWithImpl;
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
class _$TaskModelCopyWithImpl<$Res> implements $TaskModelCopyWith<$Res> {
  _$TaskModelCopyWithImpl(this._self, this._then);

  final TaskModel _self;
  final $Res Function(TaskModel) _then;

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
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      taskTitle: null == taskTitle
          ? _self.taskTitle
          : taskTitle // ignore: cast_nullable_to_non_nullable
              as String,
      department: null == department
          ? _self.department
          : department // ignore: cast_nullable_to_non_nullable
              as String,
      taskDescription: null == taskDescription
          ? _self.taskDescription
          : taskDescription // ignore: cast_nullable_to_non_nullable
              as String,
      deadline: freezed == deadline
          ? _self.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      priority: null == priority
          ? _self.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String,
      employeeId: null == employeeId
          ? _self.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int,
      employeeName: null == employeeName
          ? _self.employeeName
          : employeeName // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      shopId: null == shopId
          ? _self.shopId
          : shopId // ignore: cast_nullable_to_non_nullable
              as int,
      assignedBy: null == assignedBy
          ? _self.assignedBy
          : assignedBy // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _TaskModel implements TaskModel {
  _TaskModel(
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
  factory _TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);

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

  /// Create a copy of TaskModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TaskModelCopyWith<_TaskModel> get copyWith =>
      __$TaskModelCopyWithImpl<_TaskModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TaskModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TaskModel &&
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

  @override
  String toString() {
    return 'TaskModel(id: $id, taskTitle: $taskTitle, department: $department, taskDescription: $taskDescription, deadline: $deadline, priority: $priority, employeeId: $employeeId, employeeName: $employeeName, status: $status, userId: $userId, shopId: $shopId, assignedBy: $assignedBy, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$TaskModelCopyWith<$Res>
    implements $TaskModelCopyWith<$Res> {
  factory _$TaskModelCopyWith(
          _TaskModel value, $Res Function(_TaskModel) _then) =
      __$TaskModelCopyWithImpl;
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
class __$TaskModelCopyWithImpl<$Res> implements _$TaskModelCopyWith<$Res> {
  __$TaskModelCopyWithImpl(this._self, this._then);

  final _TaskModel _self;
  final $Res Function(_TaskModel) _then;

  /// Create a copy of TaskModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_TaskModel(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      taskTitle: null == taskTitle
          ? _self.taskTitle
          : taskTitle // ignore: cast_nullable_to_non_nullable
              as String,
      department: null == department
          ? _self.department
          : department // ignore: cast_nullable_to_non_nullable
              as String,
      taskDescription: null == taskDescription
          ? _self.taskDescription
          : taskDescription // ignore: cast_nullable_to_non_nullable
              as String,
      deadline: freezed == deadline
          ? _self.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      priority: null == priority
          ? _self.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String,
      employeeId: null == employeeId
          ? _self.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as int,
      employeeName: null == employeeName
          ? _self.employeeName
          : employeeName // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      shopId: null == shopId
          ? _self.shopId
          : shopId // ignore: cast_nullable_to_non_nullable
              as int,
      assignedBy: null == assignedBy
          ? _self.assignedBy
          : assignedBy // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

// dart format on
