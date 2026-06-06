// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScheduleModelImpl _$$ScheduleModelImplFromJson(Map<String, dynamic> json) =>
    _$ScheduleModelImpl(
      id: json['id'] as String,
      plantId: json['plantId'] as String,
      taskType: json['taskType'] as String,
      frequency: (json['frequency'] as num).toInt(),
      lastCompleted: json['lastCompleted'] == null
          ? null
          : DateTime.parse(json['lastCompleted'] as String),
      nextDueDate: DateTime.parse(json['nextDueDate'] as String),
      isActive: json['isActive'] as bool? ?? true,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$ScheduleModelImplToJson(_$ScheduleModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'plantId': instance.plantId,
      'taskType': instance.taskType,
      'frequency': instance.frequency,
      'lastCompleted': instance.lastCompleted?.toIso8601String(),
      'nextDueDate': instance.nextDueDate.toIso8601String(),
      'isActive': instance.isActive,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
