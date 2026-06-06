// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskModelImpl _$$TaskModelImplFromJson(Map<String, dynamic> json) =>
    _$TaskModelImpl(
      id: json['id'] as String,
      plantId: json['plantId'] as String,
      scheduleId: json['scheduleId'] as String,
      taskType: json['taskType'] as String,
      dueDate: DateTime.parse(json['dueDate'] as String),
      status: json['status'] as String,
      completedDate: json['completedDate'] == null
          ? null
          : DateTime.parse(json['completedDate'] as String),
      skippedDate: json['skippedDate'] == null
          ? null
          : DateTime.parse(json['skippedDate'] as String),
      notes: json['notes'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$TaskModelImplToJson(_$TaskModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'plantId': instance.plantId,
      'scheduleId': instance.scheduleId,
      'taskType': instance.taskType,
      'dueDate': instance.dueDate.toIso8601String(),
      'status': instance.status,
      'completedDate': instance.completedDate?.toIso8601String(),
      'skippedDate': instance.skippedDate?.toIso8601String(),
      'notes': instance.notes,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
