// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HistoryModelImpl _$$HistoryModelImplFromJson(Map<String, dynamic> json) =>
    _$HistoryModelImpl(
      id: json['id'] as String,
      plantId: json['plantId'] as String,
      actionType: json['actionType'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      notes: json['notes'] as String?,
      photoPath: json['photoPath'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$HistoryModelImplToJson(_$HistoryModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'plantId': instance.plantId,
      'actionType': instance.actionType,
      'timestamp': instance.timestamp.toIso8601String(),
      'notes': instance.notes,
      'photoPath': instance.photoPath,
      'createdAt': instance.createdAt.toIso8601String(),
    };
