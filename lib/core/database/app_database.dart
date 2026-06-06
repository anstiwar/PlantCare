import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

import 'tables/plants_table.dart';
import 'tables/schedules_table.dart';
import 'history_table.dart';

part 'app_database.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final appDir = await getApplicationDocumentsDirectory();
    final dbFile = File(path.join(appDir.path, 'plant_care.sqlite'));
    return NativeDatabase(dbFile);
  });
}

@DriftDatabase(tables: [PlantsTable, SchedulesTable, HistoryTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<Plant>> getAllPlants() => select(plantsTable).get();

  Stream<List<Plant>> watchAllPlants() => select(plantsTable).watch();

  Future<Plant?> getPlantById(String id) {
    return (select(plantsTable)..where((p) => p.id.equals(id))).getSingleOrNull();
  }

  Future<int> insertPlant(PlantsTableCompanion plant) => into(plantsTable).insert(plant);

  Future<bool> updatePlantRow(Plant plant) => update(plantsTable).replace(plant);

  Future<int> deletePlantById(String id) =>
      (delete(plantsTable)..where((p) => p.id.equals(id))).go();

  Future<List<Schedule>> getSchedulesForPlant(String plantId) {
    return (select(schedulesTable)..where((s) => s.plantId.equals(plantId))).get();
  }

  Future<int> insertSchedule(SchedulesTableCompanion schedule) => into(schedulesTable).insert(schedule);

  Future<List<HistoryEntry>> getHistoryForPlant(String plantId) {
    return (select(historyTable)
          ..where((h) => h.plantId.equals(plantId))
          ..orderBy([(h) => OrderingTerm(expression: h.timestamp, mode: OrderingMode.desc)]))
        .get();
  }

  Stream<List<HistoryEntry>> watchHistoryForPlant(String plantId) {
    return (select(historyTable)
          ..where((h) => h.plantId.equals(plantId))
          ..orderBy([(h) => OrderingTerm(expression: h.timestamp, mode: OrderingMode.desc)]))
        .watch();
  }

  Future<int> insertHistoryEntry(HistoryTableCompanion historyEntry) => into(historyTable).insert(historyEntry);
}
