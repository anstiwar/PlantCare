import 'package:uuid/uuid.dart';
import 'package:drift/drift.dart';

import '../../../core/database/app_database.dart';
import '../../../core/database/tables/plants_table.dart';
import '../../../core/database/tables/schedules_table.dart';
import '../../../core/database/history_table.dart';

class PlantRepository {
  PlantRepository(this._db);

  final AppDatabase _db;
  final _uuid = const Uuid();

  Stream<List<Map<String, dynamic>>> watchPlants() {
    return _db.watchAllPlants().map((rows) => rows.map(_plantToMap).toList());
  }

  Future<Plant?> getPlantById(String plantId) => _db.getPlantById(plantId);

  Future<List<Map<String, dynamic>>> getHistoryForPlant(String plantId) async {
    final historyRows = await _db.getHistoryForPlant(plantId);
    return historyRows.map(_historyToMap).toList();
  }

  Stream<List<Map<String, dynamic>>> watchHistoryForPlant(String plantId) {
    return _db.watchHistoryForPlant(plantId).map(
          (rows) => rows.map(_historyToMap).toList(),
        );
  }

  Future<void> addPlant(Map<String, dynamic> plant) async {
    final now = DateTime.now();
    final id = (plant['id'] as String?) ?? _uuid.v4();
    final wateringInterval = (plant['wateringInterval'] as int?) ?? 7;
    final nextWateringText = plant['nextWatering'] as String? ?? '$wateringInterval days left';

    final newPlant = PlantsTableCompanion(
      id: Value(id),
      name: Value(plant['name'] as String),
      nickname: Value(plant['nickname'] as String?),
      photoPath: Value(plant['photoPath'] as String?),
      species: Value(plant['species'] as String?),
      location: Value(plant['location'] as String?),
      category: Value(plant['category'] as String?),
      dateAdded: Value(plant['dateAdded'] as DateTime? ?? now),
      notes: Value(plant['notes'] as String?),
      isArchived: Value(plant['isArchived'] as bool? ?? false),
      createdAt: Value(plant['createdAt'] as DateTime? ?? now),
      updatedAt: Value(plant['updatedAt'] as DateTime? ?? now),
      wateringProgress: Value((plant['watering'] as num?)?.toDouble() ?? 1.0),
      nextWatering: Value(nextWateringText),
      healthStatus: Value(plant['health'] as String? ?? 'Excellent'),
      wateringInterval: Value(wateringInterval),
    );

    await _db.insertPlant(newPlant);
    await _db.insertSchedule(SchedulesTableCompanion(
      id: Value(_uuid.v4()),
      plantId: Value(id),
      taskType: Value('Watering'),
      frequency: Value(wateringInterval),
      lastCompleted: const Value.absent(),
      nextDueDate: Value(now.add(Duration(days: wateringInterval))),
      isActive: const Value(true),
      createdAt: Value(now),
      updatedAt: Value(now),
    ));
    await addHistoryEntry(
      plantId: id,
      actionType: 'Added',
      notes: 'Plant added to collection',
      photoPath: plant['photoPath'] as String?,
      timestamp: now,
    );
  }

  Future<void> updatePlant(Map<String, dynamic> plant) async {
    final now = DateTime.now();
    final id = plant['id'] as String;

    final existingPlant = await _db.getPlantById(id);
    if (existingPlant == null) {
      return;
    }

    final updatedPlant = existingPlant.copyWith(
      name: plant['name'] as String? ?? existingPlant.name,
      nickname: Value(plant['nickname'] as String?),
      photoPath: Value(plant['photoPath'] as String?),
      species: Value(plant['species'] as String?),
      location: Value(plant['location'] as String?),
      category: Value(plant['category'] as String?),
      notes: Value(plant['notes'] as String?),
      isArchived: plant['isArchived'] as bool? ?? existingPlant.isArchived,
      updatedAt: now,
      wateringProgress: (plant['watering'] as num?)?.toDouble() ?? existingPlant.wateringProgress,
      nextWatering: plant['nextWatering'] as String? ?? existingPlant.nextWatering,
      healthStatus: plant['health'] as String? ?? existingPlant.healthStatus,
      wateringInterval: plant['wateringInterval'] as int? ?? existingPlant.wateringInterval,
    );

    await _db.updatePlantRow(updatedPlant);
  }

  Future<void> deletePlant(String plantId) async {
    await _db.deletePlantById(plantId);
  }

  Future<void> addHistoryEntry({
    required String plantId,
    required String actionType,
    String? notes,
    String? photoPath,
    DateTime? timestamp,
  }) async {
    final now = DateTime.now();
    await _db.insertHistoryEntry(HistoryTableCompanion(
      id: Value(_uuid.v4()),
      plantId: Value(plantId),
      actionType: Value(actionType),
      timestamp: Value(timestamp ?? now),
      notes: Value(notes),
      photoPath: Value(photoPath),
      createdAt: Value(now),
    ));
  }

  Map<String, dynamic> _plantToMap(Plant row) {
    return {
      'id': row.id,
      'name': row.name,
      'nickname': row.nickname,
      'photoPath': row.photoPath,
      'species': row.species,
      'location': row.location,
      'category': row.category,
      'dateAdded': row.dateAdded,
      'notes': row.notes,
      'isArchived': row.isArchived,
      'createdAt': row.createdAt,
      'updatedAt': row.updatedAt,
      'watering': row.wateringProgress,
      'nextWatering': row.nextWatering,
      'health': row.healthStatus,
      'wateringInterval': row.wateringInterval,
    };
  }

  Map<String, dynamic> _historyToMap(HistoryEntry row) {
    return {
      'id': row.id,
      'plantId': row.plantId,
      'action': row.actionType,
      'timestamp': row.timestamp,
      'notes': row.notes,
      'photoPath': row.photoPath,
      'createdAt': row.createdAt,
    };
  }
}
