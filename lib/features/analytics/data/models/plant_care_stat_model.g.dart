// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plant_care_stat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlantCareStatImpl _$$PlantCareStatImplFromJson(Map<String, dynamic> json) =>
    _$PlantCareStatImpl(
      id: json['id'] as String,
      plantId: json['plantId'] as String,
      taskType: json['taskType'] as String,
      count: (json['count'] as num).toInt(),
      date: DateTime.parse(json['date'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$PlantCareStatImplToJson(_$PlantCareStatImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'plantId': instance.plantId,
      'taskType': instance.taskType,
      'count': instance.count,
      'date': instance.date.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
    };

_$WeeklyChartDataImpl _$$WeeklyChartDataImplFromJson(
        Map<String, dynamic> json) =>
    _$WeeklyChartDataImpl(
      plantId: json['plantId'] as String,
      plantName: json['plantName'] as String,
      dailyStats: (json['dailyStats'] as List<dynamic>)
          .map((e) => DailyStat.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalCareActions: (json['totalCareActions'] as num).toInt(),
    );

Map<String, dynamic> _$$WeeklyChartDataImplToJson(
        _$WeeklyChartDataImpl instance) =>
    <String, dynamic>{
      'plantId': instance.plantId,
      'plantName': instance.plantName,
      'dailyStats': instance.dailyStats,
      'totalCareActions': instance.totalCareActions,
    };

_$MonthlyChartDataImpl _$$MonthlyChartDataImplFromJson(
        Map<String, dynamic> json) =>
    _$MonthlyChartDataImpl(
      plantId: json['plantId'] as String,
      plantName: json['plantName'] as String,
      weeklyStats: (json['weeklyStats'] as List<dynamic>)
          .map((e) => WeeklyStat.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalCareActions: (json['totalCareActions'] as num).toInt(),
    );

Map<String, dynamic> _$$MonthlyChartDataImplToJson(
        _$MonthlyChartDataImpl instance) =>
    <String, dynamic>{
      'plantId': instance.plantId,
      'plantName': instance.plantName,
      'weeklyStats': instance.weeklyStats,
      'totalCareActions': instance.totalCareActions,
    };

_$DailyStatImpl _$$DailyStatImplFromJson(Map<String, dynamic> json) =>
    _$DailyStatImpl(
      date: DateTime.parse(json['date'] as String),
      dayLabel: json['dayLabel'] as String,
      wateringCount: (json['wateringCount'] as num).toInt(),
      fertilizingCount: (json['fertilizingCount'] as num).toInt(),
      pruningCount: (json['pruningCount'] as num).toInt(),
      otherCount: (json['otherCount'] as num).toInt(),
    );

Map<String, dynamic> _$$DailyStatImplToJson(_$DailyStatImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'dayLabel': instance.dayLabel,
      'wateringCount': instance.wateringCount,
      'fertilizingCount': instance.fertilizingCount,
      'pruningCount': instance.pruningCount,
      'otherCount': instance.otherCount,
    };

_$WeeklyStatImpl _$$WeeklyStatImplFromJson(Map<String, dynamic> json) =>
    _$WeeklyStatImpl(
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      weekLabel: json['weekLabel'] as String,
      wateringCount: (json['wateringCount'] as num).toInt(),
      fertilizingCount: (json['fertilizingCount'] as num).toInt(),
      pruningCount: (json['pruningCount'] as num).toInt(),
      otherCount: (json['otherCount'] as num).toInt(),
    );

Map<String, dynamic> _$$WeeklyStatImplToJson(_$WeeklyStatImpl instance) =>
    <String, dynamic>{
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'weekLabel': instance.weekLabel,
      'wateringCount': instance.wateringCount,
      'fertilizingCount': instance.fertilizingCount,
      'pruningCount': instance.pruningCount,
      'otherCount': instance.otherCount,
    };
