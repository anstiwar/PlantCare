// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plant_care_stat_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PlantCareStat _$PlantCareStatFromJson(Map<String, dynamic> json) {
  return _PlantCareStat.fromJson(json);
}

/// @nodoc
mixin _$PlantCareStat {
  String get id => throw _privateConstructorUsedError;
  String get plantId => throw _privateConstructorUsedError;
  String get taskType =>
      throw _privateConstructorUsedError; // watering, fertilizing, pruning, etc.
  int get count =>
      throw _privateConstructorUsedError; // number of times completed
  DateTime get date => throw _privateConstructorUsedError; // date of the stat
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this PlantCareStat to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlantCareStat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlantCareStatCopyWith<PlantCareStat> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlantCareStatCopyWith<$Res> {
  factory $PlantCareStatCopyWith(
          PlantCareStat value, $Res Function(PlantCareStat) then) =
      _$PlantCareStatCopyWithImpl<$Res, PlantCareStat>;
  @useResult
  $Res call(
      {String id,
      String plantId,
      String taskType,
      int count,
      DateTime date,
      DateTime createdAt});
}

/// @nodoc
class _$PlantCareStatCopyWithImpl<$Res, $Val extends PlantCareStat>
    implements $PlantCareStatCopyWith<$Res> {
  _$PlantCareStatCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlantCareStat
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? plantId = null,
    Object? taskType = null,
    Object? count = null,
    Object? date = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      plantId: null == plantId
          ? _value.plantId
          : plantId // ignore: cast_nullable_to_non_nullable
              as String,
      taskType: null == taskType
          ? _value.taskType
          : taskType // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlantCareStatImplCopyWith<$Res>
    implements $PlantCareStatCopyWith<$Res> {
  factory _$$PlantCareStatImplCopyWith(
          _$PlantCareStatImpl value, $Res Function(_$PlantCareStatImpl) then) =
      __$$PlantCareStatImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String plantId,
      String taskType,
      int count,
      DateTime date,
      DateTime createdAt});
}

/// @nodoc
class __$$PlantCareStatImplCopyWithImpl<$Res>
    extends _$PlantCareStatCopyWithImpl<$Res, _$PlantCareStatImpl>
    implements _$$PlantCareStatImplCopyWith<$Res> {
  __$$PlantCareStatImplCopyWithImpl(
      _$PlantCareStatImpl _value, $Res Function(_$PlantCareStatImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlantCareStat
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? plantId = null,
    Object? taskType = null,
    Object? count = null,
    Object? date = null,
    Object? createdAt = null,
  }) {
    return _then(_$PlantCareStatImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      plantId: null == plantId
          ? _value.plantId
          : plantId // ignore: cast_nullable_to_non_nullable
              as String,
      taskType: null == taskType
          ? _value.taskType
          : taskType // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlantCareStatImpl implements _PlantCareStat {
  const _$PlantCareStatImpl(
      {required this.id,
      required this.plantId,
      required this.taskType,
      required this.count,
      required this.date,
      required this.createdAt});

  factory _$PlantCareStatImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlantCareStatImplFromJson(json);

  @override
  final String id;
  @override
  final String plantId;
  @override
  final String taskType;
// watering, fertilizing, pruning, etc.
  @override
  final int count;
// number of times completed
  @override
  final DateTime date;
// date of the stat
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'PlantCareStat(id: $id, plantId: $plantId, taskType: $taskType, count: $count, date: $date, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlantCareStatImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.plantId, plantId) || other.plantId == plantId) &&
            (identical(other.taskType, taskType) ||
                other.taskType == taskType) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, plantId, taskType, count, date, createdAt);

  /// Create a copy of PlantCareStat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlantCareStatImplCopyWith<_$PlantCareStatImpl> get copyWith =>
      __$$PlantCareStatImplCopyWithImpl<_$PlantCareStatImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlantCareStatImplToJson(
      this,
    );
  }
}

abstract class _PlantCareStat implements PlantCareStat {
  const factory _PlantCareStat(
      {required final String id,
      required final String plantId,
      required final String taskType,
      required final int count,
      required final DateTime date,
      required final DateTime createdAt}) = _$PlantCareStatImpl;

  factory _PlantCareStat.fromJson(Map<String, dynamic> json) =
      _$PlantCareStatImpl.fromJson;

  @override
  String get id;
  @override
  String get plantId;
  @override
  String get taskType; // watering, fertilizing, pruning, etc.
  @override
  int get count; // number of times completed
  @override
  DateTime get date; // date of the stat
  @override
  DateTime get createdAt;

  /// Create a copy of PlantCareStat
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlantCareStatImplCopyWith<_$PlantCareStatImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WeeklyChartData _$WeeklyChartDataFromJson(Map<String, dynamic> json) {
  return _WeeklyChartData.fromJson(json);
}

/// @nodoc
mixin _$WeeklyChartData {
  String get plantId => throw _privateConstructorUsedError;
  String get plantName => throw _privateConstructorUsedError;
  List<DailyStat> get dailyStats =>
      throw _privateConstructorUsedError; // 7 days
  int get totalCareActions => throw _privateConstructorUsedError;

  /// Serializes this WeeklyChartData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WeeklyChartData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeeklyChartDataCopyWith<WeeklyChartData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeeklyChartDataCopyWith<$Res> {
  factory $WeeklyChartDataCopyWith(
          WeeklyChartData value, $Res Function(WeeklyChartData) then) =
      _$WeeklyChartDataCopyWithImpl<$Res, WeeklyChartData>;
  @useResult
  $Res call(
      {String plantId,
      String plantName,
      List<DailyStat> dailyStats,
      int totalCareActions});
}

/// @nodoc
class _$WeeklyChartDataCopyWithImpl<$Res, $Val extends WeeklyChartData>
    implements $WeeklyChartDataCopyWith<$Res> {
  _$WeeklyChartDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeeklyChartData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? plantId = null,
    Object? plantName = null,
    Object? dailyStats = null,
    Object? totalCareActions = null,
  }) {
    return _then(_value.copyWith(
      plantId: null == plantId
          ? _value.plantId
          : plantId // ignore: cast_nullable_to_non_nullable
              as String,
      plantName: null == plantName
          ? _value.plantName
          : plantName // ignore: cast_nullable_to_non_nullable
              as String,
      dailyStats: null == dailyStats
          ? _value.dailyStats
          : dailyStats // ignore: cast_nullable_to_non_nullable
              as List<DailyStat>,
      totalCareActions: null == totalCareActions
          ? _value.totalCareActions
          : totalCareActions // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeeklyChartDataImplCopyWith<$Res>
    implements $WeeklyChartDataCopyWith<$Res> {
  factory _$$WeeklyChartDataImplCopyWith(_$WeeklyChartDataImpl value,
          $Res Function(_$WeeklyChartDataImpl) then) =
      __$$WeeklyChartDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String plantId,
      String plantName,
      List<DailyStat> dailyStats,
      int totalCareActions});
}

/// @nodoc
class __$$WeeklyChartDataImplCopyWithImpl<$Res>
    extends _$WeeklyChartDataCopyWithImpl<$Res, _$WeeklyChartDataImpl>
    implements _$$WeeklyChartDataImplCopyWith<$Res> {
  __$$WeeklyChartDataImplCopyWithImpl(
      _$WeeklyChartDataImpl _value, $Res Function(_$WeeklyChartDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of WeeklyChartData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? plantId = null,
    Object? plantName = null,
    Object? dailyStats = null,
    Object? totalCareActions = null,
  }) {
    return _then(_$WeeklyChartDataImpl(
      plantId: null == plantId
          ? _value.plantId
          : plantId // ignore: cast_nullable_to_non_nullable
              as String,
      plantName: null == plantName
          ? _value.plantName
          : plantName // ignore: cast_nullable_to_non_nullable
              as String,
      dailyStats: null == dailyStats
          ? _value._dailyStats
          : dailyStats // ignore: cast_nullable_to_non_nullable
              as List<DailyStat>,
      totalCareActions: null == totalCareActions
          ? _value.totalCareActions
          : totalCareActions // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeeklyChartDataImpl implements _WeeklyChartData {
  const _$WeeklyChartDataImpl(
      {required this.plantId,
      required this.plantName,
      required final List<DailyStat> dailyStats,
      required this.totalCareActions})
      : _dailyStats = dailyStats;

  factory _$WeeklyChartDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeeklyChartDataImplFromJson(json);

  @override
  final String plantId;
  @override
  final String plantName;
  final List<DailyStat> _dailyStats;
  @override
  List<DailyStat> get dailyStats {
    if (_dailyStats is EqualUnmodifiableListView) return _dailyStats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dailyStats);
  }

// 7 days
  @override
  final int totalCareActions;

  @override
  String toString() {
    return 'WeeklyChartData(plantId: $plantId, plantName: $plantName, dailyStats: $dailyStats, totalCareActions: $totalCareActions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeeklyChartDataImpl &&
            (identical(other.plantId, plantId) || other.plantId == plantId) &&
            (identical(other.plantName, plantName) ||
                other.plantName == plantName) &&
            const DeepCollectionEquality()
                .equals(other._dailyStats, _dailyStats) &&
            (identical(other.totalCareActions, totalCareActions) ||
                other.totalCareActions == totalCareActions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, plantId, plantName,
      const DeepCollectionEquality().hash(_dailyStats), totalCareActions);

  /// Create a copy of WeeklyChartData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeeklyChartDataImplCopyWith<_$WeeklyChartDataImpl> get copyWith =>
      __$$WeeklyChartDataImplCopyWithImpl<_$WeeklyChartDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeeklyChartDataImplToJson(
      this,
    );
  }
}

abstract class _WeeklyChartData implements WeeklyChartData {
  const factory _WeeklyChartData(
      {required final String plantId,
      required final String plantName,
      required final List<DailyStat> dailyStats,
      required final int totalCareActions}) = _$WeeklyChartDataImpl;

  factory _WeeklyChartData.fromJson(Map<String, dynamic> json) =
      _$WeeklyChartDataImpl.fromJson;

  @override
  String get plantId;
  @override
  String get plantName;
  @override
  List<DailyStat> get dailyStats; // 7 days
  @override
  int get totalCareActions;

  /// Create a copy of WeeklyChartData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeeklyChartDataImplCopyWith<_$WeeklyChartDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MonthlyChartData _$MonthlyChartDataFromJson(Map<String, dynamic> json) {
  return _MonthlyChartData.fromJson(json);
}

/// @nodoc
mixin _$MonthlyChartData {
  String get plantId => throw _privateConstructorUsedError;
  String get plantName => throw _privateConstructorUsedError;
  List<WeeklyStat> get weeklyStats =>
      throw _privateConstructorUsedError; // 4 weeks
  int get totalCareActions => throw _privateConstructorUsedError;

  /// Serializes this MonthlyChartData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MonthlyChartData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MonthlyChartDataCopyWith<MonthlyChartData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonthlyChartDataCopyWith<$Res> {
  factory $MonthlyChartDataCopyWith(
          MonthlyChartData value, $Res Function(MonthlyChartData) then) =
      _$MonthlyChartDataCopyWithImpl<$Res, MonthlyChartData>;
  @useResult
  $Res call(
      {String plantId,
      String plantName,
      List<WeeklyStat> weeklyStats,
      int totalCareActions});
}

/// @nodoc
class _$MonthlyChartDataCopyWithImpl<$Res, $Val extends MonthlyChartData>
    implements $MonthlyChartDataCopyWith<$Res> {
  _$MonthlyChartDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MonthlyChartData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? plantId = null,
    Object? plantName = null,
    Object? weeklyStats = null,
    Object? totalCareActions = null,
  }) {
    return _then(_value.copyWith(
      plantId: null == plantId
          ? _value.plantId
          : plantId // ignore: cast_nullable_to_non_nullable
              as String,
      plantName: null == plantName
          ? _value.plantName
          : plantName // ignore: cast_nullable_to_non_nullable
              as String,
      weeklyStats: null == weeklyStats
          ? _value.weeklyStats
          : weeklyStats // ignore: cast_nullable_to_non_nullable
              as List<WeeklyStat>,
      totalCareActions: null == totalCareActions
          ? _value.totalCareActions
          : totalCareActions // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MonthlyChartDataImplCopyWith<$Res>
    implements $MonthlyChartDataCopyWith<$Res> {
  factory _$$MonthlyChartDataImplCopyWith(_$MonthlyChartDataImpl value,
          $Res Function(_$MonthlyChartDataImpl) then) =
      __$$MonthlyChartDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String plantId,
      String plantName,
      List<WeeklyStat> weeklyStats,
      int totalCareActions});
}

/// @nodoc
class __$$MonthlyChartDataImplCopyWithImpl<$Res>
    extends _$MonthlyChartDataCopyWithImpl<$Res, _$MonthlyChartDataImpl>
    implements _$$MonthlyChartDataImplCopyWith<$Res> {
  __$$MonthlyChartDataImplCopyWithImpl(_$MonthlyChartDataImpl _value,
      $Res Function(_$MonthlyChartDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of MonthlyChartData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? plantId = null,
    Object? plantName = null,
    Object? weeklyStats = null,
    Object? totalCareActions = null,
  }) {
    return _then(_$MonthlyChartDataImpl(
      plantId: null == plantId
          ? _value.plantId
          : plantId // ignore: cast_nullable_to_non_nullable
              as String,
      plantName: null == plantName
          ? _value.plantName
          : plantName // ignore: cast_nullable_to_non_nullable
              as String,
      weeklyStats: null == weeklyStats
          ? _value._weeklyStats
          : weeklyStats // ignore: cast_nullable_to_non_nullable
              as List<WeeklyStat>,
      totalCareActions: null == totalCareActions
          ? _value.totalCareActions
          : totalCareActions // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MonthlyChartDataImpl implements _MonthlyChartData {
  const _$MonthlyChartDataImpl(
      {required this.plantId,
      required this.plantName,
      required final List<WeeklyStat> weeklyStats,
      required this.totalCareActions})
      : _weeklyStats = weeklyStats;

  factory _$MonthlyChartDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$MonthlyChartDataImplFromJson(json);

  @override
  final String plantId;
  @override
  final String plantName;
  final List<WeeklyStat> _weeklyStats;
  @override
  List<WeeklyStat> get weeklyStats {
    if (_weeklyStats is EqualUnmodifiableListView) return _weeklyStats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weeklyStats);
  }

// 4 weeks
  @override
  final int totalCareActions;

  @override
  String toString() {
    return 'MonthlyChartData(plantId: $plantId, plantName: $plantName, weeklyStats: $weeklyStats, totalCareActions: $totalCareActions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MonthlyChartDataImpl &&
            (identical(other.plantId, plantId) || other.plantId == plantId) &&
            (identical(other.plantName, plantName) ||
                other.plantName == plantName) &&
            const DeepCollectionEquality()
                .equals(other._weeklyStats, _weeklyStats) &&
            (identical(other.totalCareActions, totalCareActions) ||
                other.totalCareActions == totalCareActions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, plantId, plantName,
      const DeepCollectionEquality().hash(_weeklyStats), totalCareActions);

  /// Create a copy of MonthlyChartData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MonthlyChartDataImplCopyWith<_$MonthlyChartDataImpl> get copyWith =>
      __$$MonthlyChartDataImplCopyWithImpl<_$MonthlyChartDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MonthlyChartDataImplToJson(
      this,
    );
  }
}

abstract class _MonthlyChartData implements MonthlyChartData {
  const factory _MonthlyChartData(
      {required final String plantId,
      required final String plantName,
      required final List<WeeklyStat> weeklyStats,
      required final int totalCareActions}) = _$MonthlyChartDataImpl;

  factory _MonthlyChartData.fromJson(Map<String, dynamic> json) =
      _$MonthlyChartDataImpl.fromJson;

  @override
  String get plantId;
  @override
  String get plantName;
  @override
  List<WeeklyStat> get weeklyStats; // 4 weeks
  @override
  int get totalCareActions;

  /// Create a copy of MonthlyChartData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MonthlyChartDataImplCopyWith<_$MonthlyChartDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DailyStat _$DailyStatFromJson(Map<String, dynamic> json) {
  return _DailyStat.fromJson(json);
}

/// @nodoc
mixin _$DailyStat {
  DateTime get date => throw _privateConstructorUsedError;
  String get dayLabel => throw _privateConstructorUsedError; // Mon, Tue, etc.
  int get wateringCount => throw _privateConstructorUsedError;
  int get fertilizingCount => throw _privateConstructorUsedError;
  int get pruningCount => throw _privateConstructorUsedError;
  int get otherCount => throw _privateConstructorUsedError;

  /// Serializes this DailyStat to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DailyStat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailyStatCopyWith<DailyStat> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyStatCopyWith<$Res> {
  factory $DailyStatCopyWith(DailyStat value, $Res Function(DailyStat) then) =
      _$DailyStatCopyWithImpl<$Res, DailyStat>;
  @useResult
  $Res call(
      {DateTime date,
      String dayLabel,
      int wateringCount,
      int fertilizingCount,
      int pruningCount,
      int otherCount});
}

/// @nodoc
class _$DailyStatCopyWithImpl<$Res, $Val extends DailyStat>
    implements $DailyStatCopyWith<$Res> {
  _$DailyStatCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailyStat
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? dayLabel = null,
    Object? wateringCount = null,
    Object? fertilizingCount = null,
    Object? pruningCount = null,
    Object? otherCount = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dayLabel: null == dayLabel
          ? _value.dayLabel
          : dayLabel // ignore: cast_nullable_to_non_nullable
              as String,
      wateringCount: null == wateringCount
          ? _value.wateringCount
          : wateringCount // ignore: cast_nullable_to_non_nullable
              as int,
      fertilizingCount: null == fertilizingCount
          ? _value.fertilizingCount
          : fertilizingCount // ignore: cast_nullable_to_non_nullable
              as int,
      pruningCount: null == pruningCount
          ? _value.pruningCount
          : pruningCount // ignore: cast_nullable_to_non_nullable
              as int,
      otherCount: null == otherCount
          ? _value.otherCount
          : otherCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DailyStatImplCopyWith<$Res>
    implements $DailyStatCopyWith<$Res> {
  factory _$$DailyStatImplCopyWith(
          _$DailyStatImpl value, $Res Function(_$DailyStatImpl) then) =
      __$$DailyStatImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime date,
      String dayLabel,
      int wateringCount,
      int fertilizingCount,
      int pruningCount,
      int otherCount});
}

/// @nodoc
class __$$DailyStatImplCopyWithImpl<$Res>
    extends _$DailyStatCopyWithImpl<$Res, _$DailyStatImpl>
    implements _$$DailyStatImplCopyWith<$Res> {
  __$$DailyStatImplCopyWithImpl(
      _$DailyStatImpl _value, $Res Function(_$DailyStatImpl) _then)
      : super(_value, _then);

  /// Create a copy of DailyStat
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? dayLabel = null,
    Object? wateringCount = null,
    Object? fertilizingCount = null,
    Object? pruningCount = null,
    Object? otherCount = null,
  }) {
    return _then(_$DailyStatImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dayLabel: null == dayLabel
          ? _value.dayLabel
          : dayLabel // ignore: cast_nullable_to_non_nullable
              as String,
      wateringCount: null == wateringCount
          ? _value.wateringCount
          : wateringCount // ignore: cast_nullable_to_non_nullable
              as int,
      fertilizingCount: null == fertilizingCount
          ? _value.fertilizingCount
          : fertilizingCount // ignore: cast_nullable_to_non_nullable
              as int,
      pruningCount: null == pruningCount
          ? _value.pruningCount
          : pruningCount // ignore: cast_nullable_to_non_nullable
              as int,
      otherCount: null == otherCount
          ? _value.otherCount
          : otherCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DailyStatImpl implements _DailyStat {
  const _$DailyStatImpl(
      {required this.date,
      required this.dayLabel,
      required this.wateringCount,
      required this.fertilizingCount,
      required this.pruningCount,
      required this.otherCount});

  factory _$DailyStatImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyStatImplFromJson(json);

  @override
  final DateTime date;
  @override
  final String dayLabel;
// Mon, Tue, etc.
  @override
  final int wateringCount;
  @override
  final int fertilizingCount;
  @override
  final int pruningCount;
  @override
  final int otherCount;

  @override
  String toString() {
    return 'DailyStat(date: $date, dayLabel: $dayLabel, wateringCount: $wateringCount, fertilizingCount: $fertilizingCount, pruningCount: $pruningCount, otherCount: $otherCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyStatImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.dayLabel, dayLabel) ||
                other.dayLabel == dayLabel) &&
            (identical(other.wateringCount, wateringCount) ||
                other.wateringCount == wateringCount) &&
            (identical(other.fertilizingCount, fertilizingCount) ||
                other.fertilizingCount == fertilizingCount) &&
            (identical(other.pruningCount, pruningCount) ||
                other.pruningCount == pruningCount) &&
            (identical(other.otherCount, otherCount) ||
                other.otherCount == otherCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, date, dayLabel, wateringCount,
      fertilizingCount, pruningCount, otherCount);

  /// Create a copy of DailyStat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyStatImplCopyWith<_$DailyStatImpl> get copyWith =>
      __$$DailyStatImplCopyWithImpl<_$DailyStatImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyStatImplToJson(
      this,
    );
  }
}

abstract class _DailyStat implements DailyStat {
  const factory _DailyStat(
      {required final DateTime date,
      required final String dayLabel,
      required final int wateringCount,
      required final int fertilizingCount,
      required final int pruningCount,
      required final int otherCount}) = _$DailyStatImpl;

  factory _DailyStat.fromJson(Map<String, dynamic> json) =
      _$DailyStatImpl.fromJson;

  @override
  DateTime get date;
  @override
  String get dayLabel; // Mon, Tue, etc.
  @override
  int get wateringCount;
  @override
  int get fertilizingCount;
  @override
  int get pruningCount;
  @override
  int get otherCount;

  /// Create a copy of DailyStat
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailyStatImplCopyWith<_$DailyStatImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WeeklyStat _$WeeklyStatFromJson(Map<String, dynamic> json) {
  return _WeeklyStat.fromJson(json);
}

/// @nodoc
mixin _$WeeklyStat {
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime get endDate => throw _privateConstructorUsedError;
  String get weekLabel =>
      throw _privateConstructorUsedError; // Week 1, Week 2, etc.
  int get wateringCount => throw _privateConstructorUsedError;
  int get fertilizingCount => throw _privateConstructorUsedError;
  int get pruningCount => throw _privateConstructorUsedError;
  int get otherCount => throw _privateConstructorUsedError;

  /// Serializes this WeeklyStat to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WeeklyStat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeeklyStatCopyWith<WeeklyStat> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeeklyStatCopyWith<$Res> {
  factory $WeeklyStatCopyWith(
          WeeklyStat value, $Res Function(WeeklyStat) then) =
      _$WeeklyStatCopyWithImpl<$Res, WeeklyStat>;
  @useResult
  $Res call(
      {DateTime startDate,
      DateTime endDate,
      String weekLabel,
      int wateringCount,
      int fertilizingCount,
      int pruningCount,
      int otherCount});
}

/// @nodoc
class _$WeeklyStatCopyWithImpl<$Res, $Val extends WeeklyStat>
    implements $WeeklyStatCopyWith<$Res> {
  _$WeeklyStatCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeeklyStat
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = null,
    Object? endDate = null,
    Object? weekLabel = null,
    Object? wateringCount = null,
    Object? fertilizingCount = null,
    Object? pruningCount = null,
    Object? otherCount = null,
  }) {
    return _then(_value.copyWith(
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      weekLabel: null == weekLabel
          ? _value.weekLabel
          : weekLabel // ignore: cast_nullable_to_non_nullable
              as String,
      wateringCount: null == wateringCount
          ? _value.wateringCount
          : wateringCount // ignore: cast_nullable_to_non_nullable
              as int,
      fertilizingCount: null == fertilizingCount
          ? _value.fertilizingCount
          : fertilizingCount // ignore: cast_nullable_to_non_nullable
              as int,
      pruningCount: null == pruningCount
          ? _value.pruningCount
          : pruningCount // ignore: cast_nullable_to_non_nullable
              as int,
      otherCount: null == otherCount
          ? _value.otherCount
          : otherCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeeklyStatImplCopyWith<$Res>
    implements $WeeklyStatCopyWith<$Res> {
  factory _$$WeeklyStatImplCopyWith(
          _$WeeklyStatImpl value, $Res Function(_$WeeklyStatImpl) then) =
      __$$WeeklyStatImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime startDate,
      DateTime endDate,
      String weekLabel,
      int wateringCount,
      int fertilizingCount,
      int pruningCount,
      int otherCount});
}

/// @nodoc
class __$$WeeklyStatImplCopyWithImpl<$Res>
    extends _$WeeklyStatCopyWithImpl<$Res, _$WeeklyStatImpl>
    implements _$$WeeklyStatImplCopyWith<$Res> {
  __$$WeeklyStatImplCopyWithImpl(
      _$WeeklyStatImpl _value, $Res Function(_$WeeklyStatImpl) _then)
      : super(_value, _then);

  /// Create a copy of WeeklyStat
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = null,
    Object? endDate = null,
    Object? weekLabel = null,
    Object? wateringCount = null,
    Object? fertilizingCount = null,
    Object? pruningCount = null,
    Object? otherCount = null,
  }) {
    return _then(_$WeeklyStatImpl(
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      weekLabel: null == weekLabel
          ? _value.weekLabel
          : weekLabel // ignore: cast_nullable_to_non_nullable
              as String,
      wateringCount: null == wateringCount
          ? _value.wateringCount
          : wateringCount // ignore: cast_nullable_to_non_nullable
              as int,
      fertilizingCount: null == fertilizingCount
          ? _value.fertilizingCount
          : fertilizingCount // ignore: cast_nullable_to_non_nullable
              as int,
      pruningCount: null == pruningCount
          ? _value.pruningCount
          : pruningCount // ignore: cast_nullable_to_non_nullable
              as int,
      otherCount: null == otherCount
          ? _value.otherCount
          : otherCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeeklyStatImpl implements _WeeklyStat {
  const _$WeeklyStatImpl(
      {required this.startDate,
      required this.endDate,
      required this.weekLabel,
      required this.wateringCount,
      required this.fertilizingCount,
      required this.pruningCount,
      required this.otherCount});

  factory _$WeeklyStatImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeeklyStatImplFromJson(json);

  @override
  final DateTime startDate;
  @override
  final DateTime endDate;
  @override
  final String weekLabel;
// Week 1, Week 2, etc.
  @override
  final int wateringCount;
  @override
  final int fertilizingCount;
  @override
  final int pruningCount;
  @override
  final int otherCount;

  @override
  String toString() {
    return 'WeeklyStat(startDate: $startDate, endDate: $endDate, weekLabel: $weekLabel, wateringCount: $wateringCount, fertilizingCount: $fertilizingCount, pruningCount: $pruningCount, otherCount: $otherCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeeklyStatImpl &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.weekLabel, weekLabel) ||
                other.weekLabel == weekLabel) &&
            (identical(other.wateringCount, wateringCount) ||
                other.wateringCount == wateringCount) &&
            (identical(other.fertilizingCount, fertilizingCount) ||
                other.fertilizingCount == fertilizingCount) &&
            (identical(other.pruningCount, pruningCount) ||
                other.pruningCount == pruningCount) &&
            (identical(other.otherCount, otherCount) ||
                other.otherCount == otherCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, startDate, endDate, weekLabel,
      wateringCount, fertilizingCount, pruningCount, otherCount);

  /// Create a copy of WeeklyStat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeeklyStatImplCopyWith<_$WeeklyStatImpl> get copyWith =>
      __$$WeeklyStatImplCopyWithImpl<_$WeeklyStatImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeeklyStatImplToJson(
      this,
    );
  }
}

abstract class _WeeklyStat implements WeeklyStat {
  const factory _WeeklyStat(
      {required final DateTime startDate,
      required final DateTime endDate,
      required final String weekLabel,
      required final int wateringCount,
      required final int fertilizingCount,
      required final int pruningCount,
      required final int otherCount}) = _$WeeklyStatImpl;

  factory _WeeklyStat.fromJson(Map<String, dynamic> json) =
      _$WeeklyStatImpl.fromJson;

  @override
  DateTime get startDate;
  @override
  DateTime get endDate;
  @override
  String get weekLabel; // Week 1, Week 2, etc.
  @override
  int get wateringCount;
  @override
  int get fertilizingCount;
  @override
  int get pruningCount;
  @override
  int get otherCount;

  /// Create a copy of WeeklyStat
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeeklyStatImplCopyWith<_$WeeklyStatImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
