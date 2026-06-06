// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlantModelImpl _$$PlantModelImplFromJson(Map<String, dynamic> json) =>
    _$PlantModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      nickname: json['nickname'] as String?,
      photoPath: json['photoPath'] as String?,
      species: json['species'] as String?,
      location: json['location'] as String?,
      category: json['category'] as String?,
      dateAdded: DateTime.parse(json['dateAdded'] as String),
      notes: json['notes'] as String?,
      isArchived: json['isArchived'] as bool? ?? false,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$PlantModelImplToJson(_$PlantModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'nickname': instance.nickname,
      'photoPath': instance.photoPath,
      'species': instance.species,
      'location': instance.location,
      'category': instance.category,
      'dateAdded': instance.dateAdded.toIso8601String(),
      'notes': instance.notes,
      'isArchived': instance.isArchived,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
