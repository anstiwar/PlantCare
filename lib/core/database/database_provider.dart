import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_database.dart';
import '../../features/plants/data/plant_repository.dart';

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  final database = AppDatabase();
  ref.onDispose(() => database.close());
  return database;
});

final plantRepositoryProvider = Provider<PlantRepository>((ref) {
  final database = ref.watch(appDatabaseProvider);
  return PlantRepository(database);
});

final plantListProvider = StreamProvider.autoDispose<List<Map<String, dynamic>>>((ref) {
  final repository = ref.watch(plantRepositoryProvider);
  return repository.watchPlants();
});

final plantHistoryProvider = StreamProvider.family.autoDispose<List<Map<String, dynamic>>, String>((ref, plantId) {
  final repository = ref.watch(plantRepositoryProvider);
  return repository.watchHistoryForPlant(plantId);
});
