import 'package:freezed_annotation/freezed_annotation.dart';

part 'plant_model.freezed.dart';
part 'plant_model.g.dart';

@freezed
class PlantModel with _$PlantModel {
  const factory PlantModel({
    required String id,
    required String name,
    String? nickname,
    String? photoPath,
    String? species,
    String? location,
    String? category,
    required DateTime dateAdded,
    String? notes,
    @Default(false) bool isArchived,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _PlantModel;

  factory PlantModel.fromJson(Map<String, dynamic> json) =>
      _$PlantModelFromJson(json);
}
